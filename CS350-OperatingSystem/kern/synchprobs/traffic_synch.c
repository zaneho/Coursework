#include <types.h>
#include <lib.h>
#include <synchprobs.h>
#include <synch.h>
#include <opt-A1.h>

/* 
 * This simple default synchronization mechanism allows only vehicle at a time
 * into the intersection.   The intersectionSem is used as a a lock.
 * We use a semaphore rather than a lock so that this code will work even
 * before locks are implemented.
 */

/* 
 * Replace this default synchronization mechanism with your own (better) mechanism
 * needed for your solution.   Your mechanism may use any of the available synchronzation
 * primitives, e.g., semaphores, locks, condition variables.   You are also free to 
 * declare other global variables if your solution requires them.
 */

/*
 * replace this with declarations of any synchronization and other variables you need here
 */
//static struct semaphore *intersectionSem;
struct lock *intersectionLock;

struct cv *intersectionCV;
struct cv *intersectionCV2;

volatile int num = 0;
volatile Direction curDir;
volatile Direction priority;
volatile int q = 0;
volatile int swap = 0;
volatile int old = 0;
volatile int block = 0;
volatile int count = 2;
volatile Direction next;

/* 
 * The simulation driver will call this function once before starting
 * the simulation
 *
 * You can use it to initialize synchronization and other variables.
 * 
 */
void
intersection_sync_init(void)
{
  /* replace this default implementation with your own implementation */
/*
  intersectionSem = sem_create("intersectionSem",1);
  if (intersectionSem == NULL) {
    panic("could not create intersection semaphore");
  }
  return;*/

	intersectionLock = lock_create("intersectionLock");
	if(intersectionLock == NULL){
		panic("could not create intersection lock");
	}

	intersectionCV = cv_create("intersectionCV");
	if(intersectionCV == NULL){
		panic("could not create intersection cv");
	}

	intersectionCV2 = cv_create("intersectionCV2");
	if(intersectionCV2 == NULL){
		panic("could not create intersection cv 2");
	}

	return;

}

/* 
 * The simulation driver will call this function once after
 * the simulation has finished
 *
 * You can use it to clean up any synchronization and other variables.
 *
 */
void
intersection_sync_cleanup(void)
{
  /* replace this default implementation with your own implementation */

/*  KASSERT(intersectionSem != NULL);
  sem_destroy(intersectionSem);
*/
	KASSERT(intersectionLock != NULL);
	lock_destroy(intersectionLock);

	KASSERT(intersectionCV != NULL);
	cv_destroy(intersectionCV);

	KASSERT(intersectionCV2 != NULL);
	cv_destroy(intersectionCV2);
}

/*
 * The simulation driver will call this function each time a vehicle
 * tries to enter the intersection, before it enters.
 * This function should cause the calling simulation thread
 * to block until it is OK for the vehicle to enter the intersection.
 *
 * parameters:
 *    * origin: the Direction from which the vehicle is arriving
 *    * destination: the Direction in which the vehicle is trying to go
 *
 * return value: none
 */

void
intersection_before_entry(Direction origin, Direction destination)
{
  /* replace this default implementation with your own implementation */
  (void)origin;  /* avoid compiler complaint about unused parameter */
  (void)destination; /* avoid compiler complaint about unused parameter */
//  KASSERT(intersectionSem != NULL);
  //P(intersectionSem);
	KASSERT(intersectionLock != NULL);

	KASSERT(intersectionCV != NULL);
	KASSERT(intersectionCV2 != NULL);

	lock_acquire(intersectionLock);

	if(num == 0 && swap == 0){
		curDir = origin;
	}

	if(curDir != origin || swap == 1){
		q++;
		cv_wait(intersectionCV, intersectionLock);
		q--;
		curDir = origin;
		swap=0;
	}

	num++;
	lock_release(intersectionLock);
}

/*
 * The simulation driver will call this function each time a vehicle
 * leaves the intersection.
 *
 * parameters:
 *    * origin: the Direction from which the vehicle arrived
 *    * destination: the Direction in which the vehicle is going
 *
 * return value: none
 */

void
intersection_after_exit(Direction origin, Direction destination)
{
  /* replace this default implementation with your own implementation */
  (void)origin;  /* avoid compiler complaint about unused parameter */
  (void)destination; /* avoid compiler complaint about unused parameter */
//  KASSERT(intersectionSem != NULL);
//  V(intersectionSem);
	KASSERT(intersectionLock != NULL);
	KASSERT(intersectionCV != NULL);
	KASSERT(intersectionCV2 != NULL);

	lock_acquire(intersectionLock);
	num--;

	if(num==0){
		if(q > 0){ swap = 1;}
		cv_signal(intersectionCV, intersectionLock);
	}
	lock_release(intersectionLock);
}
