#include <types.h>
#include <kern/errno.h>
#include <kern/unistd.h>
#include <kern/wait.h>
#include <lib.h>
#include <syscall.h>
#include <current.h>
#include <proc.h>
#include <thread.h>
#include <addrspace.h>
#include <copyinout.h>
#include "opt-A2.h"
#include <synch.h>
#include <mips/trapframe.h>
#include <vfs.h>
#include <vm.h>
#include <test.h>
#include <kern/fcntl.h>

int sys_execv(const char  *progname, char **args){
#if OPT_A2
//	(void) args;
//	(void) progname;

	struct addrspace *as;
	struct vnode *v;
	vaddr_t entrypoint, stackptr;
	int result;

	int i=0;
	size_t argsize;
	int kernargc;//arg count
	char **kernargv;

	if(progname == NULL){
		return EFAULT;//bad memmory reference
	}
	if(args == NULL){
		return EFAULT;
	}

	///////////////////////////////////

	/*Count argument & copy to kernel*/

	while(args[i] != NULL){
		i++;
	}
	kernargc=i;

	argsize = (kernargc+1)*(sizeof(char*));
	kernargv = kmalloc(argsize);
	KASSERT(kernargv != NULL);

	i=0;
	while(i < kernargc){
		size_t argsize_ = (strlen(args[i])+1) * sizeof(char);
		kernargv[i] = kmalloc(argsize_);
		KASSERT(kernargv[i] != NULL);
		int error = copyin((const_userptr_t) args[i], (void*) kernargv[i], argsize_);
		KASSERT(error == 0);
	i++;
	}

	kernargv[kernargc]=NULL;


	//make a copy of progname to pass to vfs_open

	char *fname_temp;
	fname_temp = kstrdup((char *)progname);

	if(fname_temp==NULL){
		return ENOMEM;
	}

	//Open the file
	result = vfs_open(fname_temp,O_RDONLY,0,&v);
	if(result){
		return result;
	}
	kfree(fname_temp);

///////////////////////////////////////////////////////


	/* We should be a new process. */
//	KASSERT(curproc_getas() == NULL);

	/* Create a new address space. */
	as = as_create();
	if (as ==NULL) {
		vfs_close(v);
		return ENOMEM;
	}

	/* Switch to it and activate it. */
struct addrspace *oldAS = curproc_setas(as);
//	curproc_setas(as);
	as_activate();
	as_destroy(oldAS);

	/* Load the executable. */
	result = load_elf(v, &entrypoint);
	if (result) {
		/* p_addrspace will go away when curproc is destroyed */
		vfs_close(v);
		return result;
	}

	/* Done with the file now. */
	vfs_close(v);

	/* Define the user stack in the address space */
	result = as_define_stack(as, &stackptr);
	if (result) {
		/* p_addrspace will go away when curproc is destroyed */
		return result;
	}

	/* Warp to user mode. */
	enter_new_process(kernargc /*argc*/,(userptr_t) stackptr /*userspace addr of argv*/,
			  stackptr, entrypoint);

	/* enter_new_process does not return. */
	panic("enter_new_process returned\n");
	return EINVAL;

#endif
}




  /* this implementation of sys__exit does not do anything with the exit code */
  /* this needs to be fixed to get exit() and waitpid() working properly */
void sys__exit(int exitcode) {

  struct addrspace *as;
  struct proc *p = curproc;
  /* for now, just include this to keep the compiler from complaining about
     an unused variable */


  DEBUG(DB_SYSCALL,"Syscall: _exit(%d)\n",exitcode);

  KASSERT(curproc->p_addrspace != NULL);
  as_deactivate();
  /*
   * clear p_addrspace before calling as_destroy. Otherwise if
   * as_destroy sleeps (which is quite possible) when we
   * come back we'll be calling as_activate on a
   * half-destroyed address space. This tends to be
   * messily fatal.
   */
  as = curproc_setas(NULL);
  as_destroy(as);

  /* detach this thread from its process */
  /* note: curproc cannot be used after this call */
  proc_remthread(curthread);



  #if OPT_A2
  p->p_exitcode = exitcode;
  p->p_exited = true;




  if(p->p_parent != NULL){//if I have parent
	//wake up parent
	lock_acquire(p->p_wait_lk);
	cv_signal(p->p_wait_cv, p->p_wait_lk);
	lock_release(p->p_wait_lk);

	//modify parent array, add to deadchild array and remove from alive child array
	struct proc *parent = p->p_parent;
	lock_acquire(parent->p_wait_lk);
	for(unsigned int i=0; i<array_num(parent->p_alive_child); i++){
		struct proc *getChild = array_get(parent->p_alive_child, i);
		if(getChild->pid == p->pid){
			array_add(parent->p_dead_child,p, NULL);
			array_remove(parent->p_alive_child,i);
			break;
		}
	}
	lock_release(parent->p_wait_lk);
  }else{
	//orhan process, need to destroy and wake up kernel thread
	proc_destroy(p);
  }

  #else
  (void)exitcode;
  #endif




  /* if this is the last user process in the system, proc_destroy()
     will wake up the kernel menu thread */
//proc_destroy(p);

  thread_exit();
  /* thread_exit() does not return, so we should never get here */
  panic("return from thread_exit in sys_exit\n");
}






/* stub handler for getpid() system call                */
int
sys_getpid(pid_t *retval)
{
  /* for now, this is just a stub that always returns a PID of 1 */
  /* you need to fix this to make it work properly */
#if OPT_A2
	KASSERT(curproc!=NULL);
	*retval = curproc->pid;
#else
  *retval = 1;
#endif
  return(0);
}

/* stub handler for waitpid() system call                */

int
sys_waitpid(pid_t pid,
	    userptr_t status,
	    int options,
	    pid_t *retval)
{
  int exitstatus;
  int result;

  /* this is just a stub implementation that always reports an
     exit status of 0, regardless of the actual exit status of
     the specified process.   
     In fact, this will return 0 even if the specified process
     is still running, and even if it never existed in the first place.

     Fix this!
  */

  if (options != 0) {
   *retval = -1;
    return(EINVAL);
  }
 

  #if OPT_A2

 // pid_t curpid = curproc->pid; //pid of parent
  struct proc *getChild=NULL;

int found = 0;
  //getChild and check if pid is child of curpid
  for(unsigned int i=0; i<array_num(curproc->p_all_child); i++){

	getChild = array_get(curproc->p_all_child, i);
//kprintf("array_num,i,this is getChild pid, pid: %d %d %d %d \n",array_num(curproc->p_all_child),i, getChild->pid, pid);
	if(getChild->pid == pid){
		found = 1;
		break;
	}
  }

  if(found == 0 || getChild == NULL){
	*retval = -1;
//kprintf("aaahhh");
	return ECHILD;
  }

  if(getChild->p_parent != curproc){//parent id do not match
	*retval = -1;
//kprintf("wwwaaaa");
	return ECHILD;
  }


  //If child process have not exited, need to block its parent
  lock_acquire(getChild->p_wait_lk);
  while(!getChild->p_exited){
	cv_wait(getChild->p_wait_cv, getChild->p_wait_lk);
  }
  lock_release(getChild->p_wait_lk);

//struct semaphore *p_sem = getChild->p_sem;
//P(p_sem);

  if(status == NULL){
	*retval = -1;
//kprintf("kkkee");
	return EFAULT; //bad memory reference
  }

  exitstatus = _MKWAIT_EXIT(getChild->p_exitcode);

  #else
  /* for now, just pretend the exitstatus is 0 */
  exitstatus = 0;
  #endif


  result = copyout((void *)&exitstatus,status,sizeof(int));


  if (result) {
    *retval = -1;
//kprintf("lllalal");
    return(result);
  }
  *retval = pid;

  //after waitpid, destory the child and remove from parent array
  lock_acquire(curproc->p_wait_lk);
	for(unsigned int i=0; i<array_num(curproc->p_dead_child); i++){
		struct proc *getChild = array_get(curproc->p_dead_child, i);
		if(getChild->pid == pid){
			array_remove(curproc->p_dead_child,i);
			break;
		}
	}
	lock_release(curproc->p_wait_lk);
  proc_destroy(getChild);
  return(0);
}




#if OPT_A2
void enter_forked2(void * ptr, unsigned long data2);
void enter_forked2(void * ptr, unsigned long data2){
  (void)data2;
  enter_forked_process((struct trapframe *) ptr);
}

/*
Create a copy of the current process. Return 0 for the child process, and the PID of
the child process for the parent.
*/

int sys_fork(struct trapframe *tf, pid_t *retval){
	int result;

	//Create process structure for child process
	KASSERT(curproc!=NULL);

	struct proc *child = proc_create_runprogram(curproc->p_name);

	if(child == NULL){
		DEBUG(DB_SYSCALL, "sys_fork failed to create child");
		return ENOMEM; //no more memory
	}

	//Create and copy address space
	spinlock_acquire(&child->p_lock);
	as_copy(curproc_getas(),&child->p_addrspace);
	spinlock_release(&child->p_lock);

	if(child->p_addrspace == NULL){
		DEBUG(DB_SYSCALL, "sys_fork failed to create new address space");
		proc_destroy(child);
		return ENOMEM; //no more memoru for address space
	}

	struct trapframe *tf_child = kmalloc(sizeof(struct trapframe));
	if(tf_child == NULL){
		DEBUG(DB_SYSCALL,"sys_fork failed to create new trapframe space");
		proc_destroy(child);
		return ENOMEM; //no more memory for trapframe
	}

	memcpy(tf_child,tf, sizeof(struct trapframe));

	//Assign PID to child process and create the parent/child relationship
	lock_acquire(curproc->p_wait_lk);
	child->p_parent = curproc;
	array_add(curproc->p_all_child, child, NULL);
	array_add(curproc->p_alive_child, child, NULL);
	lock_release(curproc->p_wait_lk);

	//Create thread for child process
	result = thread_fork(curthread->t_name, child, enter_forked2,tf_child, 0);
	if(result){
		DEBUG(DB_SYSCALL,"sys_fork fail to fork thread");
		as_destroy(child->p_addrspace);
		proc_destroy(child);
		kfree(tf_child);
		return ENOMEM;
	}

	*retval = child->pid; //return value for parent
	return 0;
}
#endif
