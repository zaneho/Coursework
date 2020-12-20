
../../../build/user/uw-testbin/widefork/widefork:     file format elf32-tradbigmips

Disassembly of section .text:

00400000 <__start>:
  400000:	3c1c1001 	lui	gp,0x1001
  400004:	279c8000 	addiu	gp,gp,-32768
  400008:	2408fff8 	li	t0,-8
  40000c:	03a8e824 	and	sp,sp,t0
  400010:	27bdfff0 	addiu	sp,sp,-16
  400014:	3c011000 	lui	at,0x1000
  400018:	ac250014 	sw	a1,20(at)
  40001c:	0c100067 	jal	40019c <main>
  400020:	00000000 	nop
  400024:	00408021 	move	s0,v0
  400028:	0c1000dd 	jal	400374 <exit>
  40002c:	02002021 	move	a0,s0
  400030:	0c1000f3 	jal	4003cc <_exit>
  400034:	02002021 	move	a0,s0
  400038:	02002021 	move	a0,s0
  40003c:	24020003 	li	v0,3
  400040:	0000000c 	syscall
  400044:	0810000e 	j	400038 <__start+0x38>
  400048:	00000000 	nop
  40004c:	00000000 	nop

00400050 <dowait>:
  400050:	27bdffd8 	addiu	sp,sp,-40
  400054:	afb1001c 	sw	s1,28(sp)
  400058:	afb00018 	sw	s0,24(sp)
  40005c:	00a08821 	move	s1,a1
  400060:	00808021 	move	s0,a0
  400064:	8fa50010 	lw	a1,16(sp)
  400068:	3c040040 	lui	a0,0x40
  40006c:	afbf0020 	sw	ra,32(sp)
  400070:	0c1000af 	jal	4002bc <printf>
  400074:	24841a70 	addiu	a0,a0,6768
  400078:	02002021 	move	a0,s0
  40007c:	27a50010 	addiu	a1,sp,16
  400080:	0c1000f5 	jal	4003d4 <waitpid>
  400084:	00003021 	move	a2,zero
  400088:	3c040040 	lui	a0,0x40
  40008c:	04400017 	bltz	v0,4000ec <dowait+0x9c>
  400090:	24841a7c 	addiu	a0,a0,6780
  400094:	8fa20010 	lw	v0,16(sp)
  400098:	00000000 	nop
  40009c:	00021883 	sra	v1,v0,0x2
  4000a0:	30420003 	andi	v0,v0,0x3
  4000a4:	14400008 	bnez	v0,4000c8 <dowait+0x78>
  4000a8:	24040078 	li	a0,120
  4000ac:	10710006 	beq	v1,s1,4000c8 <dowait+0x78>
  4000b0:	24640060 	addiu	a0,v1,96
  4000b4:	8fbf0020 	lw	ra,32(sp)
  4000b8:	8fb1001c 	lw	s1,28(sp)
  4000bc:	8fb00018 	lw	s0,24(sp)
  4000c0:	03e00008 	jr	ra
  4000c4:	27bd0028 	addiu	sp,sp,40
  4000c8:	0c1000bc 	jal	4002f0 <putchar>
  4000cc:	00000000 	nop
  4000d0:	0c1000bc 	jal	4002f0 <putchar>
  4000d4:	2404000a 	li	a0,10
  4000d8:	8fbf0020 	lw	ra,32(sp)
  4000dc:	8fb1001c 	lw	s1,28(sp)
  4000e0:	8fb00018 	lw	s0,24(sp)
  4000e4:	03e00008 	jr	ra
  4000e8:	27bd0028 	addiu	sp,sp,40
  4000ec:	0c10020a 	jal	400828 <warnx>
  4000f0:	00000000 	nop
  4000f4:	8fbf0020 	lw	ra,32(sp)
  4000f8:	8fb1001c 	lw	s1,28(sp)
  4000fc:	8fb00018 	lw	s0,24(sp)
  400100:	03e00008 	jr	ra
  400104:	27bd0028 	addiu	sp,sp,40

00400108 <dofork>:
  400108:	27bdffe0 	addiu	sp,sp,-32
  40010c:	afb10014 	sw	s1,20(sp)
  400110:	afb00010 	sw	s0,16(sp)
  400114:	afbf0018 	sw	ra,24(sp)
  400118:	0c1000ed 	jal	4003b4 <fork>
  40011c:	00808821 	move	s1,a0
  400120:	3c040040 	lui	a0,0x40
  400124:	00408021 	move	s0,v0
  400128:	24841a88 	addiu	a0,a0,6792
  40012c:	02202821 	move	a1,s1
  400130:	0c1000af 	jal	4002bc <printf>
  400134:	00403021 	move	a2,v0
  400138:	06000008 	bltz	s0,40015c <dofork+0x54>
  40013c:	3c050040 	lui	a1,0x40
  400140:	12000010 	beqz	s0,400184 <dofork+0x7c>
  400144:	02001021 	move	v0,s0
  400148:	8fbf0018 	lw	ra,24(sp)
  40014c:	8fb10014 	lw	s1,20(sp)
  400150:	8fb00010 	lw	s0,16(sp)
  400154:	03e00008 	jr	ra
  400158:	27bd0020 	addiu	sp,sp,32
  40015c:	02203021 	move	a2,s1
  400160:	24a51aa8 	addiu	a1,a1,6824
  400164:	0c1001e6 	jal	400798 <errx>
  400168:	24040001 	li	a0,1
  40016c:	02001021 	move	v0,s0
  400170:	8fbf0018 	lw	ra,24(sp)
  400174:	8fb10014 	lw	s1,20(sp)
  400178:	8fb00010 	lw	s0,16(sp)
  40017c:	03e00008 	jr	ra
  400180:	27bd0020 	addiu	sp,sp,32
  400184:	0c1000bc 	jal	4002f0 <putchar>
  400188:	26240040 	addiu	a0,s1,64
  40018c:	0c1000bc 	jal	4002f0 <putchar>
  400190:	2404000a 	li	a0,10
  400194:	0c1000f3 	jal	4003cc <_exit>
  400198:	02202021 	move	a0,s1

0040019c <main>:
  40019c:	27bdffe8 	addiu	sp,sp,-24
  4001a0:	24040050 	li	a0,80
  4001a4:	afbf0014 	sw	ra,20(sp)
  4001a8:	0c1000bc 	jal	4002f0 <putchar>
  4001ac:	afb00010 	sw	s0,16(sp)
  4001b0:	0c1000bc 	jal	4002f0 <putchar>
  4001b4:	2404000a 	li	a0,10
  4001b8:	0c100042 	jal	400108 <dofork>
  4001bc:	24040001 	li	a0,1
  4001c0:	3c040040 	lui	a0,0x40
  4001c4:	00402821 	move	a1,v0
  4001c8:	24841ab0 	addiu	a0,a0,6832
  4001cc:	0c1000af 	jal	4002bc <printf>
  4001d0:	00408021 	move	s0,v0
  4001d4:	0c1000bc 	jal	4002f0 <putchar>
  4001d8:	24040050 	li	a0,80
  4001dc:	0c1000bc 	jal	4002f0 <putchar>
  4001e0:	2404000a 	li	a0,10
  4001e4:	0c100042 	jal	400108 <dofork>
  4001e8:	24040002 	li	a0,2
  4001ec:	3c040040 	lui	a0,0x40
  4001f0:	00402821 	move	a1,v0
  4001f4:	0c1000af 	jal	4002bc <printf>
  4001f8:	24841ac4 	addiu	a0,a0,6852
  4001fc:	0c1000bc 	jal	4002f0 <putchar>
  400200:	24040050 	li	a0,80
  400204:	0c1000bc 	jal	4002f0 <putchar>
  400208:	2404000a 	li	a0,10
  40020c:	0c100042 	jal	400108 <dofork>
  400210:	24040003 	li	a0,3
  400214:	3c040040 	lui	a0,0x40
  400218:	00402821 	move	a1,v0
  40021c:	0c1000af 	jal	4002bc <printf>
  400220:	24841ad8 	addiu	a0,a0,6872
  400224:	02002021 	move	a0,s0
  400228:	0c100014 	jal	400050 <dowait>
  40022c:	24050001 	li	a1,1
  400230:	8fbf0014 	lw	ra,20(sp)
  400234:	8fb00010 	lw	s0,16(sp)
  400238:	00001021 	move	v0,zero
  40023c:	03e00008 	jr	ra
  400240:	27bd0018 	addiu	sp,sp,24
	...

00400250 <vprintf>:
  400250:	00803021 	move	a2,a0
  400254:	3c040040 	lui	a0,0x40
  400258:	00a03821 	move	a3,a1
  40025c:	24840268 	addiu	a0,a0,616
  400260:	081002e5 	j	400b94 <__vprintf>
  400264:	00002821 	move	a1,zero

00400268 <__printf_send>:
  400268:	27bdffe0 	addiu	sp,sp,-32
  40026c:	afb20018 	sw	s2,24(sp)
  400270:	afb10014 	sw	s1,20(sp)
  400274:	afbf001c 	sw	ra,28(sp)
  400278:	afb00010 	sw	s0,16(sp)
  40027c:	00c09021 	move	s2,a2
  400280:	10c00008 	beqz	a2,4002a4 <__printf_send+0x3c>
  400284:	00a08821 	move	s1,a1
  400288:	00008021 	move	s0,zero
  40028c:	02301021 	addu	v0,s1,s0
  400290:	80440000 	lb	a0,0(v0)
  400294:	0c1000bc 	jal	4002f0 <putchar>
  400298:	26100001 	addiu	s0,s0,1
  40029c:	1650fffc 	bne	s2,s0,400290 <__printf_send+0x28>
  4002a0:	02301021 	addu	v0,s1,s0
  4002a4:	8fbf001c 	lw	ra,28(sp)
  4002a8:	8fb20018 	lw	s2,24(sp)
  4002ac:	8fb10014 	lw	s1,20(sp)
  4002b0:	8fb00010 	lw	s0,16(sp)
  4002b4:	03e00008 	jr	ra
  4002b8:	27bd0020 	addiu	sp,sp,32

004002bc <printf>:
  4002bc:	27bdffe0 	addiu	sp,sp,-32
  4002c0:	27a20024 	addiu	v0,sp,36
  4002c4:	afa50024 	sw	a1,36(sp)
  4002c8:	00402821 	move	a1,v0
  4002cc:	afbf0018 	sw	ra,24(sp)
  4002d0:	afa60028 	sw	a2,40(sp)
  4002d4:	afa7002c 	sw	a3,44(sp)
  4002d8:	0c100094 	jal	400250 <vprintf>
  4002dc:	afa20010 	sw	v0,16(sp)
  4002e0:	8fbf0018 	lw	ra,24(sp)
  4002e4:	00000000 	nop
  4002e8:	03e00008 	jr	ra
  4002ec:	27bd0020 	addiu	sp,sp,32

004002f0 <putchar>:
  4002f0:	27bdffe0 	addiu	sp,sp,-32
  4002f4:	afb00018 	sw	s0,24(sp)
  4002f8:	27a50010 	addiu	a1,sp,16
  4002fc:	00808021 	move	s0,a0
  400300:	24060001 	li	a2,1
  400304:	24040001 	li	a0,1
  400308:	afbf001c 	sw	ra,28(sp)
  40030c:	0c100133 	jal	4004cc <write>
  400310:	a3b00010 	sb	s0,16(sp)
  400314:	18400005 	blez	v0,40032c <putchar+0x3c>
  400318:	02001021 	move	v0,s0
  40031c:	8fbf001c 	lw	ra,28(sp)
  400320:	8fb00018 	lw	s0,24(sp)
  400324:	03e00008 	jr	ra
  400328:	27bd0020 	addiu	sp,sp,32
  40032c:	2410ffff 	li	s0,-1
  400330:	02001021 	move	v0,s0
  400334:	8fbf001c 	lw	ra,28(sp)
  400338:	8fb00018 	lw	s0,24(sp)
  40033c:	03e00008 	jr	ra
  400340:	27bd0020 	addiu	sp,sp,32
	...

00400350 <__exit_hack>:
  400350:	27bdfff8 	addiu	sp,sp,-8
  400354:	24020001 	li	v0,1
  400358:	afa20000 	sw	v0,0(sp)
  40035c:	8fa20000 	lw	v0,0(sp)
  400360:	00000000 	nop
  400364:	1440fffd 	bnez	v0,40035c <__exit_hack+0xc>
  400368:	00000000 	nop
  40036c:	03e00008 	jr	ra
  400370:	27bd0008 	addiu	sp,sp,8

00400374 <exit>:
  400374:	27bdffe8 	addiu	sp,sp,-24
  400378:	afbf0010 	sw	ra,16(sp)
  40037c:	0c1000f3 	jal	4003cc <_exit>
  400380:	00000000 	nop
	...

00400390 <__syscall>:
  400390:	0000000c 	syscall
  400394:	10e00005 	beqz	a3,4003ac <__syscall+0x1c>
  400398:	00000000 	nop
  40039c:	3c011000 	lui	at,0x1000
  4003a0:	ac220010 	sw	v0,16(at)
  4003a4:	2403ffff 	li	v1,-1
  4003a8:	2402ffff 	li	v0,-1
  4003ac:	03e00008 	jr	ra
  4003b0:	00000000 	nop

004003b4 <fork>:
  4003b4:	081000e4 	j	400390 <__syscall>
  4003b8:	24020000 	li	v0,0

004003bc <vfork>:
  4003bc:	081000e4 	j	400390 <__syscall>
  4003c0:	24020001 	li	v0,1

004003c4 <execv>:
  4003c4:	081000e4 	j	400390 <__syscall>
  4003c8:	24020002 	li	v0,2

004003cc <_exit>:
  4003cc:	081000e4 	j	400390 <__syscall>
  4003d0:	24020003 	li	v0,3

004003d4 <waitpid>:
  4003d4:	081000e4 	j	400390 <__syscall>
  4003d8:	24020004 	li	v0,4

004003dc <getpid>:
  4003dc:	081000e4 	j	400390 <__syscall>
  4003e0:	24020005 	li	v0,5

004003e4 <getppid>:
  4003e4:	081000e4 	j	400390 <__syscall>
  4003e8:	24020006 	li	v0,6

004003ec <sbrk>:
  4003ec:	081000e4 	j	400390 <__syscall>
  4003f0:	24020007 	li	v0,7

004003f4 <mmap>:
  4003f4:	081000e4 	j	400390 <__syscall>
  4003f8:	24020008 	li	v0,8

004003fc <munmap>:
  4003fc:	081000e4 	j	400390 <__syscall>
  400400:	24020009 	li	v0,9

00400404 <mprotect>:
  400404:	081000e4 	j	400390 <__syscall>
  400408:	2402000a 	li	v0,10

0040040c <umask>:
  40040c:	081000e4 	j	400390 <__syscall>
  400410:	24020011 	li	v0,17

00400414 <issetugid>:
  400414:	081000e4 	j	400390 <__syscall>
  400418:	24020012 	li	v0,18

0040041c <getresuid>:
  40041c:	081000e4 	j	400390 <__syscall>
  400420:	24020013 	li	v0,19

00400424 <setresuid>:
  400424:	081000e4 	j	400390 <__syscall>
  400428:	24020014 	li	v0,20

0040042c <getresgid>:
  40042c:	081000e4 	j	400390 <__syscall>
  400430:	24020015 	li	v0,21

00400434 <setresgid>:
  400434:	081000e4 	j	400390 <__syscall>
  400438:	24020016 	li	v0,22

0040043c <getgroups>:
  40043c:	081000e4 	j	400390 <__syscall>
  400440:	24020017 	li	v0,23

00400444 <setgroups>:
  400444:	081000e4 	j	400390 <__syscall>
  400448:	24020018 	li	v0,24

0040044c <__getlogin>:
  40044c:	081000e4 	j	400390 <__syscall>
  400450:	24020019 	li	v0,25

00400454 <__setlogin>:
  400454:	081000e4 	j	400390 <__syscall>
  400458:	2402001a 	li	v0,26

0040045c <kill>:
  40045c:	081000e4 	j	400390 <__syscall>
  400460:	2402001b 	li	v0,27

00400464 <sigaction>:
  400464:	081000e4 	j	400390 <__syscall>
  400468:	2402001c 	li	v0,28

0040046c <sigpending>:
  40046c:	081000e4 	j	400390 <__syscall>
  400470:	2402001d 	li	v0,29

00400474 <sigprocmask>:
  400474:	081000e4 	j	400390 <__syscall>
  400478:	2402001e 	li	v0,30

0040047c <sigsuspend>:
  40047c:	081000e4 	j	400390 <__syscall>
  400480:	2402001f 	li	v0,31

00400484 <sigreturn>:
  400484:	081000e4 	j	400390 <__syscall>
  400488:	24020020 	li	v0,32

0040048c <open>:
  40048c:	081000e4 	j	400390 <__syscall>
  400490:	2402002d 	li	v0,45

00400494 <pipe>:
  400494:	081000e4 	j	400390 <__syscall>
  400498:	2402002e 	li	v0,46

0040049c <dup>:
  40049c:	081000e4 	j	400390 <__syscall>
  4004a0:	2402002f 	li	v0,47

004004a4 <dup2>:
  4004a4:	081000e4 	j	400390 <__syscall>
  4004a8:	24020030 	li	v0,48

004004ac <close>:
  4004ac:	081000e4 	j	400390 <__syscall>
  4004b0:	24020031 	li	v0,49

004004b4 <read>:
  4004b4:	081000e4 	j	400390 <__syscall>
  4004b8:	24020032 	li	v0,50

004004bc <pread>:
  4004bc:	081000e4 	j	400390 <__syscall>
  4004c0:	24020033 	li	v0,51

004004c4 <getdirentry>:
  4004c4:	081000e4 	j	400390 <__syscall>
  4004c8:	24020036 	li	v0,54

004004cc <write>:
  4004cc:	081000e4 	j	400390 <__syscall>
  4004d0:	24020037 	li	v0,55

004004d4 <pwrite>:
  4004d4:	081000e4 	j	400390 <__syscall>
  4004d8:	24020038 	li	v0,56

004004dc <lseek>:
  4004dc:	081000e4 	j	400390 <__syscall>
  4004e0:	2402003b 	li	v0,59

004004e4 <flock>:
  4004e4:	081000e4 	j	400390 <__syscall>
  4004e8:	2402003c 	li	v0,60

004004ec <ftruncate>:
  4004ec:	081000e4 	j	400390 <__syscall>
  4004f0:	2402003d 	li	v0,61

004004f4 <fsync>:
  4004f4:	081000e4 	j	400390 <__syscall>
  4004f8:	2402003e 	li	v0,62

004004fc <fcntl>:
  4004fc:	081000e4 	j	400390 <__syscall>
  400500:	2402003f 	li	v0,63

00400504 <ioctl>:
  400504:	081000e4 	j	400390 <__syscall>
  400508:	24020040 	li	v0,64

0040050c <select>:
  40050c:	081000e4 	j	400390 <__syscall>
  400510:	24020041 	li	v0,65

00400514 <poll>:
  400514:	081000e4 	j	400390 <__syscall>
  400518:	24020042 	li	v0,66

0040051c <link>:
  40051c:	081000e4 	j	400390 <__syscall>
  400520:	24020043 	li	v0,67

00400524 <remove>:
  400524:	081000e4 	j	400390 <__syscall>
  400528:	24020044 	li	v0,68

0040052c <mkdir>:
  40052c:	081000e4 	j	400390 <__syscall>
  400530:	24020045 	li	v0,69

00400534 <rmdir>:
  400534:	081000e4 	j	400390 <__syscall>
  400538:	24020046 	li	v0,70

0040053c <mkfifo>:
  40053c:	081000e4 	j	400390 <__syscall>
  400540:	24020047 	li	v0,71

00400544 <rename>:
  400544:	081000e4 	j	400390 <__syscall>
  400548:	24020048 	li	v0,72

0040054c <access>:
  40054c:	081000e4 	j	400390 <__syscall>
  400550:	24020049 	li	v0,73

00400554 <chdir>:
  400554:	081000e4 	j	400390 <__syscall>
  400558:	2402004a 	li	v0,74

0040055c <fchdir>:
  40055c:	081000e4 	j	400390 <__syscall>
  400560:	2402004b 	li	v0,75

00400564 <__getcwd>:
  400564:	081000e4 	j	400390 <__syscall>
  400568:	2402004c 	li	v0,76

0040056c <symlink>:
  40056c:	081000e4 	j	400390 <__syscall>
  400570:	2402004d 	li	v0,77

00400574 <readlink>:
  400574:	081000e4 	j	400390 <__syscall>
  400578:	2402004e 	li	v0,78

0040057c <mount>:
  40057c:	081000e4 	j	400390 <__syscall>
  400580:	2402004f 	li	v0,79

00400584 <unmount>:
  400584:	081000e4 	j	400390 <__syscall>
  400588:	24020050 	li	v0,80

0040058c <stat>:
  40058c:	081000e4 	j	400390 <__syscall>
  400590:	24020051 	li	v0,81

00400594 <fstat>:
  400594:	081000e4 	j	400390 <__syscall>
  400598:	24020052 	li	v0,82

0040059c <lstat>:
  40059c:	081000e4 	j	400390 <__syscall>
  4005a0:	24020053 	li	v0,83

004005a4 <utimes>:
  4005a4:	081000e4 	j	400390 <__syscall>
  4005a8:	24020054 	li	v0,84

004005ac <futimes>:
  4005ac:	081000e4 	j	400390 <__syscall>
  4005b0:	24020055 	li	v0,85

004005b4 <lutimes>:
  4005b4:	081000e4 	j	400390 <__syscall>
  4005b8:	24020056 	li	v0,86

004005bc <chmod>:
  4005bc:	081000e4 	j	400390 <__syscall>
  4005c0:	24020057 	li	v0,87

004005c4 <chown>:
  4005c4:	081000e4 	j	400390 <__syscall>
  4005c8:	24020058 	li	v0,88

004005cc <fchmod>:
  4005cc:	081000e4 	j	400390 <__syscall>
  4005d0:	24020059 	li	v0,89

004005d4 <fchown>:
  4005d4:	081000e4 	j	400390 <__syscall>
  4005d8:	2402005a 	li	v0,90

004005dc <lchmod>:
  4005dc:	081000e4 	j	400390 <__syscall>
  4005e0:	2402005b 	li	v0,91

004005e4 <lchown>:
  4005e4:	081000e4 	j	400390 <__syscall>
  4005e8:	2402005c 	li	v0,92

004005ec <socket>:
  4005ec:	081000e4 	j	400390 <__syscall>
  4005f0:	24020062 	li	v0,98

004005f4 <bind>:
  4005f4:	081000e4 	j	400390 <__syscall>
  4005f8:	24020063 	li	v0,99

004005fc <connect>:
  4005fc:	081000e4 	j	400390 <__syscall>
  400600:	24020064 	li	v0,100

00400604 <listen>:
  400604:	081000e4 	j	400390 <__syscall>
  400608:	24020065 	li	v0,101

0040060c <accept>:
  40060c:	081000e4 	j	400390 <__syscall>
  400610:	24020066 	li	v0,102

00400614 <shutdown>:
  400614:	081000e4 	j	400390 <__syscall>
  400618:	24020068 	li	v0,104

0040061c <getsockname>:
  40061c:	081000e4 	j	400390 <__syscall>
  400620:	24020069 	li	v0,105

00400624 <getpeername>:
  400624:	081000e4 	j	400390 <__syscall>
  400628:	2402006a 	li	v0,106

0040062c <getsockopt>:
  40062c:	081000e4 	j	400390 <__syscall>
  400630:	2402006b 	li	v0,107

00400634 <setsockopt>:
  400634:	081000e4 	j	400390 <__syscall>
  400638:	2402006c 	li	v0,108

0040063c <__time>:
  40063c:	081000e4 	j	400390 <__syscall>
  400640:	24020071 	li	v0,113

00400644 <__settime>:
  400644:	081000e4 	j	400390 <__syscall>
  400648:	24020072 	li	v0,114

0040064c <nanosleep>:
  40064c:	081000e4 	j	400390 <__syscall>
  400650:	24020073 	li	v0,115

00400654 <sync>:
  400654:	081000e4 	j	400390 <__syscall>
  400658:	24020076 	li	v0,118

0040065c <reboot>:
  40065c:	081000e4 	j	400390 <__syscall>
  400660:	24020077 	li	v0,119
	...

00400670 <__senderr>:
  400670:	08100133 	j	4004cc <write>
  400674:	24040002 	li	a0,2

00400678 <__senderrstr>:
  400678:	27bdffe8 	addiu	sp,sp,-24
  40067c:	afbf0014 	sw	ra,20(sp)
  400680:	afb00010 	sw	s0,16(sp)
  400684:	0c100454 	jal	401150 <strlen>
  400688:	00808021 	move	s0,a0
  40068c:	00403021 	move	a2,v0
  400690:	02002821 	move	a1,s0
  400694:	8fbf0014 	lw	ra,20(sp)
  400698:	8fb00010 	lw	s0,16(sp)
  40069c:	00002021 	move	a0,zero
  4006a0:	0810019c 	j	400670 <__senderr>
  4006a4:	27bd0018 	addiu	sp,sp,24

004006a8 <__printerr>:
  4006a8:	27bdffd8 	addiu	sp,sp,-40
  4006ac:	afb40020 	sw	s4,32(sp)
  4006b0:	afb3001c 	sw	s3,28(sp)
  4006b4:	afb20018 	sw	s2,24(sp)
  4006b8:	afb10014 	sw	s1,20(sp)
  4006bc:	afbf0024 	sw	ra,36(sp)
  4006c0:	afb00010 	sw	s0,16(sp)
  4006c4:	3c021000 	lui	v0,0x1000
  4006c8:	00809821 	move	s3,a0
  4006cc:	8c440010 	lw	a0,16(v0)
  4006d0:	00a08821 	move	s1,a1
  4006d4:	0c100448 	jal	401120 <strerror>
  4006d8:	00c09021 	move	s2,a2
  4006dc:	0040a021 	move	s4,v0
  4006e0:	3c021000 	lui	v0,0x1000
  4006e4:	8c420014 	lw	v0,20(v0)
  4006e8:	00000000 	nop
  4006ec:	1040001f 	beqz	v0,40076c <__printerr+0xc4>
  4006f0:	00000000 	nop
  4006f4:	8c420000 	lw	v0,0(v0)
  4006f8:	00000000 	nop
  4006fc:	1040001b 	beqz	v0,40076c <__printerr+0xc4>
  400700:	00402021 	move	a0,v0
  400704:	0c10019e 	jal	400678 <__senderrstr>
  400708:	3c100040 	lui	s0,0x40
  40070c:	0c10019e 	jal	400678 <__senderrstr>
  400710:	26041b04 	addiu	a0,s0,6916
  400714:	3c040040 	lui	a0,0x40
  400718:	24840670 	addiu	a0,a0,1648
  40071c:	02203021 	move	a2,s1
  400720:	02403821 	move	a3,s2
  400724:	0c1002e5 	jal	400b94 <__vprintf>
  400728:	00002821 	move	a1,zero
  40072c:	12600005 	beqz	s3,400744 <__printerr+0x9c>
  400730:	26041b04 	addiu	a0,s0,6916
  400734:	0c10019e 	jal	400678 <__senderrstr>
  400738:	00000000 	nop
  40073c:	0c10019e 	jal	400678 <__senderrstr>
  400740:	02802021 	move	a0,s4
  400744:	3c040040 	lui	a0,0x40
  400748:	8fbf0024 	lw	ra,36(sp)
  40074c:	8fb40020 	lw	s4,32(sp)
  400750:	8fb3001c 	lw	s3,28(sp)
  400754:	8fb20018 	lw	s2,24(sp)
  400758:	8fb10014 	lw	s1,20(sp)
  40075c:	8fb00010 	lw	s0,16(sp)
  400760:	24841b08 	addiu	a0,a0,6920
  400764:	0810019e 	j	400678 <__senderrstr>
  400768:	27bd0028 	addiu	sp,sp,40
  40076c:	3c020040 	lui	v0,0x40
  400770:	081001c1 	j	400704 <__printerr+0x5c>
  400774:	24441aec 	addiu	a0,v0,6892

00400778 <verrx>:
  400778:	27bdffe8 	addiu	sp,sp,-24
  40077c:	afb00010 	sw	s0,16(sp)
  400780:	00808021 	move	s0,a0
  400784:	afbf0014 	sw	ra,20(sp)
  400788:	0c1001aa 	jal	4006a8 <__printerr>
  40078c:	00002021 	move	a0,zero
  400790:	0c1000dd 	jal	400374 <exit>
  400794:	02002021 	move	a0,s0

00400798 <errx>:
  400798:	27bdffe0 	addiu	sp,sp,-32
  40079c:	27a20028 	addiu	v0,sp,40
  4007a0:	afa60028 	sw	a2,40(sp)
  4007a4:	00403021 	move	a2,v0
  4007a8:	afbf0018 	sw	ra,24(sp)
  4007ac:	afa7002c 	sw	a3,44(sp)
  4007b0:	0c1001de 	jal	400778 <verrx>
  4007b4:	afa20010 	sw	v0,16(sp)
  4007b8:	8fbf0018 	lw	ra,24(sp)
  4007bc:	00000000 	nop
  4007c0:	03e00008 	jr	ra
  4007c4:	27bd0020 	addiu	sp,sp,32

004007c8 <verr>:
  4007c8:	27bdffe8 	addiu	sp,sp,-24
  4007cc:	afb00010 	sw	s0,16(sp)
  4007d0:	00808021 	move	s0,a0
  4007d4:	afbf0014 	sw	ra,20(sp)
  4007d8:	0c1001aa 	jal	4006a8 <__printerr>
  4007dc:	24040001 	li	a0,1
  4007e0:	0c1000dd 	jal	400374 <exit>
  4007e4:	02002021 	move	a0,s0

004007e8 <err>:
  4007e8:	27bdffe0 	addiu	sp,sp,-32
  4007ec:	27a20028 	addiu	v0,sp,40
  4007f0:	afa60028 	sw	a2,40(sp)
  4007f4:	00403021 	move	a2,v0
  4007f8:	afbf0018 	sw	ra,24(sp)
  4007fc:	afa7002c 	sw	a3,44(sp)
  400800:	0c1001f2 	jal	4007c8 <verr>
  400804:	afa20010 	sw	v0,16(sp)
  400808:	8fbf0018 	lw	ra,24(sp)
  40080c:	00000000 	nop
  400810:	03e00008 	jr	ra
  400814:	27bd0020 	addiu	sp,sp,32

00400818 <vwarnx>:
  400818:	00a03021 	move	a2,a1
  40081c:	00802821 	move	a1,a0
  400820:	081001aa 	j	4006a8 <__printerr>
  400824:	00002021 	move	a0,zero

00400828 <warnx>:
  400828:	27bdffe0 	addiu	sp,sp,-32
  40082c:	27a20024 	addiu	v0,sp,36
  400830:	afa50024 	sw	a1,36(sp)
  400834:	00402821 	move	a1,v0
  400838:	afbf0018 	sw	ra,24(sp)
  40083c:	afa60028 	sw	a2,40(sp)
  400840:	afa7002c 	sw	a3,44(sp)
  400844:	0c100206 	jal	400818 <vwarnx>
  400848:	afa20010 	sw	v0,16(sp)
  40084c:	8fbf0018 	lw	ra,24(sp)
  400850:	00000000 	nop
  400854:	03e00008 	jr	ra
  400858:	27bd0020 	addiu	sp,sp,32

0040085c <vwarn>:
  40085c:	00a03021 	move	a2,a1
  400860:	00802821 	move	a1,a0
  400864:	081001aa 	j	4006a8 <__printerr>
  400868:	24040001 	li	a0,1

0040086c <warn>:
  40086c:	27bdffe0 	addiu	sp,sp,-32
  400870:	27a20024 	addiu	v0,sp,36
  400874:	afa50024 	sw	a1,36(sp)
  400878:	00402821 	move	a1,v0
  40087c:	afbf0018 	sw	ra,24(sp)
  400880:	afa60028 	sw	a2,40(sp)
  400884:	afa7002c 	sw	a3,44(sp)
  400888:	0c100217 	jal	40085c <vwarn>
  40088c:	afa20010 	sw	v0,16(sp)
  400890:	8fbf0018 	lw	ra,24(sp)
  400894:	00000000 	nop
  400898:	03e00008 	jr	ra
  40089c:	27bd0020 	addiu	sp,sp,32

004008a0 <__pf_print>:
  4008a0:	27bdffe0 	addiu	sp,sp,-32
  4008a4:	afbf0018 	sw	ra,24(sp)
  4008a8:	afb10014 	sw	s1,20(sp)
  4008ac:	afb00010 	sw	s0,16(sp)
  4008b0:	8c830000 	lw	v1,0(a0)
  4008b4:	00808021 	move	s0,a0
  4008b8:	8c840004 	lw	a0,4(a0)
  4008bc:	0060f809 	jalr	v1
  4008c0:	00c08821 	move	s1,a2
  4008c4:	8e02000c 	lw	v0,12(s0)
  4008c8:	00000000 	nop
  4008cc:	00511021 	addu	v0,v0,s1
  4008d0:	ae02000c 	sw	v0,12(s0)
  4008d4:	8fbf0018 	lw	ra,24(sp)
  4008d8:	8fb10014 	lw	s1,20(sp)
  4008dc:	8fb00010 	lw	s0,16(sp)
  4008e0:	03e00008 	jr	ra
  4008e4:	27bd0020 	addiu	sp,sp,32

004008e8 <__pf_endfield>:
  4008e8:	24020020 	li	v0,32
  4008ec:	ac82002c 	sw	v0,44(a0)
  4008f0:	00001821 	move	v1,zero
  4008f4:	00001021 	move	v0,zero
  4008f8:	ac800038 	sw	zero,56(a0)
  4008fc:	ac800010 	sw	zero,16(a0)
  400900:	ac800014 	sw	zero,20(a0)
  400904:	ac83001c 	sw	v1,28(a0)
  400908:	ac820018 	sw	v0,24(a0)
  40090c:	ac800020 	sw	zero,32(a0)
  400910:	ac800024 	sw	zero,36(a0)
  400914:	ac800028 	sw	zero,40(a0)
  400918:	ac800030 	sw	zero,48(a0)
  40091c:	03e00008 	jr	ra
  400920:	ac800034 	sw	zero,52(a0)

00400924 <__pf_fill>:
  400924:	27bdffd0 	addiu	sp,sp,-48
  400928:	afb30024 	sw	s3,36(sp)
  40092c:	afb20020 	sw	s2,32(sp)
  400930:	afbf0028 	sw	ra,40(sp)
  400934:	afb1001c 	sw	s1,28(sp)
  400938:	afb00018 	sw	s0,24(sp)
  40093c:	00809821 	move	s3,a0
  400940:	8c82002c 	lw	v0,44(a0)
  400944:	18a0000b 	blez	a1,400974 <__pf_fill+0x50>
  400948:	00a09021 	move	s2,a1
  40094c:	a3a20010 	sb	v0,16(sp)
  400950:	00008021 	move	s0,zero
  400954:	27b10010 	addiu	s1,sp,16
  400958:	26100001 	addiu	s0,s0,1
  40095c:	02602021 	move	a0,s3
  400960:	02202821 	move	a1,s1
  400964:	0c100228 	jal	4008a0 <__pf_print>
  400968:	24060001 	li	a2,1
  40096c:	1650fffb 	bne	s2,s0,40095c <__pf_fill+0x38>
  400970:	26100001 	addiu	s0,s0,1
  400974:	8fbf0028 	lw	ra,40(sp)
  400978:	8fb30024 	lw	s3,36(sp)
  40097c:	8fb20020 	lw	s2,32(sp)
  400980:	8fb1001c 	lw	s1,28(sp)
  400984:	8fb00018 	lw	s0,24(sp)
  400988:	03e00008 	jr	ra
  40098c:	27bd0030 	addiu	sp,sp,48

00400990 <__pf_printstuff>:
  400990:	27bdffd0 	addiu	sp,sp,-48
  400994:	afbf0028 	sw	ra,40(sp)
  400998:	afb50024 	sw	s5,36(sp)
  40099c:	afb40020 	sw	s4,32(sp)
  4009a0:	afb3001c 	sw	s3,28(sp)
  4009a4:	afb20018 	sw	s2,24(sp)
  4009a8:	00c09821 	move	s3,a2
  4009ac:	afb10014 	sw	s1,20(sp)
  4009b0:	afb00010 	sw	s0,16(sp)
  4009b4:	00808821 	move	s1,a0
  4009b8:	00a02021 	move	a0,a1
  4009bc:	00a0a021 	move	s4,a1
  4009c0:	0c100454 	jal	401150 <strlen>
  4009c4:	00e0a821 	move	s5,a3
  4009c8:	02602021 	move	a0,s3
  4009cc:	0c100454 	jal	401150 <strlen>
  4009d0:	00409021 	move	s2,v0
  4009d4:	02a02021 	move	a0,s5
  4009d8:	0c100454 	jal	401150 <strlen>
  4009dc:	02428021 	addu	s0,s2,v0
  4009e0:	8e230024 	lw	v1,36(s1)
  4009e4:	02022821 	addu	a1,s0,v0
  4009e8:	00a3102a 	slt	v0,a1,v1
  4009ec:	10400040 	beqz	v0,400af0 <__pf_printstuff+0x160>
  4009f0:	00658023 	subu	s0,v1,a1
  4009f4:	1a000056 	blez	s0,400b50 <__pf_printstuff+0x1c0>
  4009f8:	02403021 	move	a2,s2
  4009fc:	8e220028 	lw	v0,40(s1)
  400a00:	00000000 	nop
  400a04:	10400028 	beqz	v0,400aa8 <__pf_printstuff+0x118>
  400a08:	24020030 	li	v0,48
  400a0c:	0c100454 	jal	401150 <strlen>
  400a10:	02802021 	move	a0,s4
  400a14:	00403021 	move	a2,v0
  400a18:	02802821 	move	a1,s4
  400a1c:	0c100228 	jal	4008a0 <__pf_print>
  400a20:	02202021 	move	a0,s1
  400a24:	0c100454 	jal	401150 <strlen>
  400a28:	02602021 	move	a0,s3
  400a2c:	00403021 	move	a2,v0
  400a30:	02202021 	move	a0,s1
  400a34:	0c100228 	jal	4008a0 <__pf_print>
  400a38:	02602821 	move	a1,s3
  400a3c:	8e220028 	lw	v0,40(s1)
  400a40:	00000000 	nop
  400a44:	14400005 	bnez	v0,400a5c <__pf_printstuff+0xcc>
  400a48:	24020030 	li	v0,48
  400a4c:	8e23002c 	lw	v1,44(s1)
  400a50:	00000000 	nop
  400a54:	1062004b 	beq	v1,v0,400b84 <__pf_printstuff+0x1f4>
  400a58:	02202021 	move	a0,s1
  400a5c:	0c100454 	jal	401150 <strlen>
  400a60:	02a02021 	move	a0,s5
  400a64:	00403021 	move	a2,v0
  400a68:	02202021 	move	a0,s1
  400a6c:	0c100228 	jal	4008a0 <__pf_print>
  400a70:	02a02821 	move	a1,s5
  400a74:	8e220028 	lw	v0,40(s1)
  400a78:	00000000 	nop
  400a7c:	14400012 	bnez	v0,400ac8 <__pf_printstuff+0x138>
  400a80:	02202021 	move	a0,s1
  400a84:	8fbf0028 	lw	ra,40(sp)
  400a88:	8fb50024 	lw	s5,36(sp)
  400a8c:	8fb40020 	lw	s4,32(sp)
  400a90:	8fb3001c 	lw	s3,28(sp)
  400a94:	8fb20018 	lw	s2,24(sp)
  400a98:	8fb10014 	lw	s1,20(sp)
  400a9c:	8fb00010 	lw	s0,16(sp)
  400aa0:	03e00008 	jr	ra
  400aa4:	27bd0030 	addiu	sp,sp,48
  400aa8:	8e23002c 	lw	v1,44(s1)
  400aac:	00000000 	nop
  400ab0:	1062ffd6 	beq	v1,v0,400a0c <__pf_printstuff+0x7c>
  400ab4:	02202021 	move	a0,s1
  400ab8:	0c100249 	jal	400924 <__pf_fill>
  400abc:	02002821 	move	a1,s0
  400ac0:	08100283 	j	400a0c <__pf_printstuff+0x7c>
  400ac4:	00000000 	nop
  400ac8:	02002821 	move	a1,s0
  400acc:	8fbf0028 	lw	ra,40(sp)
  400ad0:	8fb50024 	lw	s5,36(sp)
  400ad4:	8fb40020 	lw	s4,32(sp)
  400ad8:	8fb3001c 	lw	s3,28(sp)
  400adc:	8fb20018 	lw	s2,24(sp)
  400ae0:	8fb10014 	lw	s1,20(sp)
  400ae4:	8fb00010 	lw	s0,16(sp)
  400ae8:	08100249 	j	400924 <__pf_fill>
  400aec:	27bd0030 	addiu	sp,sp,48
  400af0:	02802821 	move	a1,s4
  400af4:	02403021 	move	a2,s2
  400af8:	0c100228 	jal	4008a0 <__pf_print>
  400afc:	02202021 	move	a0,s1
  400b00:	0c100454 	jal	401150 <strlen>
  400b04:	02602021 	move	a0,s3
  400b08:	00403021 	move	a2,v0
  400b0c:	02202021 	move	a0,s1
  400b10:	0c100228 	jal	4008a0 <__pf_print>
  400b14:	02602821 	move	a1,s3
  400b18:	0c100454 	jal	401150 <strlen>
  400b1c:	02a02021 	move	a0,s5
  400b20:	02202021 	move	a0,s1
  400b24:	02a02821 	move	a1,s5
  400b28:	8fbf0028 	lw	ra,40(sp)
  400b2c:	8fb50024 	lw	s5,36(sp)
  400b30:	8fb40020 	lw	s4,32(sp)
  400b34:	8fb3001c 	lw	s3,28(sp)
  400b38:	8fb20018 	lw	s2,24(sp)
  400b3c:	8fb10014 	lw	s1,20(sp)
  400b40:	8fb00010 	lw	s0,16(sp)
  400b44:	00403021 	move	a2,v0
  400b48:	08100228 	j	4008a0 <__pf_print>
  400b4c:	27bd0030 	addiu	sp,sp,48
  400b50:	02802821 	move	a1,s4
  400b54:	0c100228 	jal	4008a0 <__pf_print>
  400b58:	02202021 	move	a0,s1
  400b5c:	0c100454 	jal	401150 <strlen>
  400b60:	02602021 	move	a0,s3
  400b64:	00403021 	move	a2,v0
  400b68:	02202021 	move	a0,s1
  400b6c:	0c100228 	jal	4008a0 <__pf_print>
  400b70:	02602821 	move	a1,s3
  400b74:	0c100454 	jal	401150 <strlen>
  400b78:	02a02021 	move	a0,s5
  400b7c:	081002c9 	j	400b24 <__pf_printstuff+0x194>
  400b80:	02202021 	move	a0,s1
  400b84:	0c100249 	jal	400924 <__pf_fill>
  400b88:	02002821 	move	a1,s0
  400b8c:	08100297 	j	400a5c <__pf_printstuff+0xcc>
  400b90:	00000000 	nop

00400b94 <__vprintf>:
  400b94:	27bdff68 	addiu	sp,sp,-152
  400b98:	afbe0090 	sw	s8,144(sp)
  400b9c:	27be0030 	addiu	s8,sp,48
  400ba0:	afb10074 	sw	s1,116(sp)
  400ba4:	afa40030 	sw	a0,48(sp)
  400ba8:	00c08821 	move	s1,a2
  400bac:	03c02021 	move	a0,s8
  400bb0:	afb00070 	sw	s0,112(sp)
  400bb4:	afbf0094 	sw	ra,148(sp)
  400bb8:	afb7008c 	sw	s7,140(sp)
  400bbc:	afb60088 	sw	s6,136(sp)
  400bc0:	afb50084 	sw	s5,132(sp)
  400bc4:	afb40080 	sw	s4,128(sp)
  400bc8:	afb3007c 	sw	s3,124(sp)
  400bcc:	afb20078 	sw	s2,120(sp)
  400bd0:	afa50034 	sw	a1,52(sp)
  400bd4:	afa70038 	sw	a3,56(sp)
  400bd8:	0c10023a 	jal	4008e8 <__pf_endfield>
  400bdc:	afa0003c 	sw	zero,60(sp)
  400be0:	82300000 	lb	s0,0(s1)
  400be4:	00000000 	nop
  400be8:	12000017 	beqz	s0,400c48 <__vprintf+0xb4>
  400bec:	0220a021 	move	s4,s1
  400bf0:	08100306 	j	400c18 <__vprintf+0x84>
  400bf4:	00000000 	nop
  400bf8:	27a50010 	addiu	a1,sp,16
  400bfc:	24060001 	li	a2,1
  400c00:	0c100228 	jal	4008a0 <__pf_print>
  400c04:	a3b00010 	sb	s0,16(sp)
  400c08:	82900001 	lb	s0,1(s4)
  400c0c:	00000000 	nop
  400c10:	1200000d 	beqz	s0,400c48 <__vprintf+0xb4>
  400c14:	26940001 	addiu	s4,s4,1
  400c18:	8fa20040 	lw	v0,64(sp)
  400c1c:	00000000 	nop
  400c20:	14400016 	bnez	v0,400c7c <__vprintf+0xe8>
  400c24:	24020025 	li	v0,37
  400c28:	1602fff3 	bne	s0,v0,400bf8 <__vprintf+0x64>
  400c2c:	03c02021 	move	a0,s8
  400c30:	24020001 	li	v0,1
  400c34:	afa20040 	sw	v0,64(sp)
  400c38:	82900001 	lb	s0,1(s4)
  400c3c:	00000000 	nop
  400c40:	1600fff5 	bnez	s0,400c18 <__vprintf+0x84>
  400c44:	26940001 	addiu	s4,s4,1
  400c48:	8fa2003c 	lw	v0,60(sp)
  400c4c:	8fbf0094 	lw	ra,148(sp)
  400c50:	8fbe0090 	lw	s8,144(sp)
  400c54:	8fb7008c 	lw	s7,140(sp)
  400c58:	8fb60088 	lw	s6,136(sp)
  400c5c:	8fb50084 	lw	s5,132(sp)
  400c60:	8fb40080 	lw	s4,128(sp)
  400c64:	8fb3007c 	lw	s3,124(sp)
  400c68:	8fb20078 	lw	s2,120(sp)
  400c6c:	8fb10074 	lw	s1,116(sp)
  400c70:	8fb00070 	lw	s0,112(sp)
  400c74:	03e00008 	jr	ra
  400c78:	27bd0098 	addiu	sp,sp,152
  400c7c:	3c040040 	lui	a0,0x40
  400c80:	24841b18 	addiu	a0,a0,6936
  400c84:	0c100430 	jal	4010c0 <strchr>
  400c88:	02002821 	move	a1,s0
  400c8c:	10400031 	beqz	v0,400d54 <__vprintf+0x1c0>
  400c90:	24020030 	li	v0,48
  400c94:	1202001d 	beq	s0,v0,400d0c <__vprintf+0x178>
  400c98:	2a020031 	slti	v0,s0,49
  400c9c:	10400013 	beqz	v0,400cec <__vprintf+0x158>
  400ca0:	2402006c 	li	v0,108
  400ca4:	24020023 	li	v0,35
  400ca8:	12020027 	beq	s0,v0,400d48 <__vprintf+0x1b4>
  400cac:	2402002d 	li	v0,45
  400cb0:	1202004a 	beq	s0,v0,400ddc <__vprintf+0x248>
  400cb4:	24020001 	li	v0,1
  400cb8:	2602ffcf 	addiu	v0,s0,-49
  400cbc:	2c420009 	sltiu	v0,v0,9
  400cc0:	1040001a 	beqz	v0,400d2c <__vprintf+0x198>
  400cc4:	3c040040 	lui	a0,0x40
  400cc8:	8fa20054 	lw	v0,84(sp)
  400ccc:	00000000 	nop
  400cd0:	000218c0 	sll	v1,v0,0x3
  400cd4:	00021040 	sll	v0,v0,0x1
  400cd8:	00431021 	addu	v0,v0,v1
  400cdc:	02021021 	addu	v0,s0,v0
  400ce0:	2442ffd0 	addiu	v0,v0,-48
  400ce4:	08100302 	j	400c08 <__vprintf+0x74>
  400ce8:	afa20054 	sw	v0,84(sp)
  400cec:	1602fff3 	bne	s0,v0,400cbc <__vprintf+0x128>
  400cf0:	2602ffcf 	addiu	v0,s0,-49
  400cf4:	8fa20044 	lw	v0,68(sp)
  400cf8:	24030001 	li	v1,1
  400cfc:	10430039 	beq	v0,v1,400de4 <__vprintf+0x250>
  400d00:	24020002 	li	v0,2
  400d04:	08100302 	j	400c08 <__vprintf+0x74>
  400d08:	afa30044 	sw	v1,68(sp)
  400d0c:	8fa20054 	lw	v0,84(sp)
  400d10:	00000000 	nop
  400d14:	1840008c 	blez	v0,400f48 <__vprintf+0x3b4>
  400d18:	000218c0 	sll	v1,v0,0x3
  400d1c:	00021040 	sll	v0,v0,0x1
  400d20:	00431021 	addu	v0,v0,v1
  400d24:	08100302 	j	400c08 <__vprintf+0x74>
  400d28:	afa20054 	sw	v0,84(sp)
  400d2c:	3c060040 	lui	a2,0x40
  400d30:	24841b28 	addiu	a0,a0,6952
  400d34:	24c61b50 	addiu	a2,a2,6992
  400d38:	0c100478 	jal	4011e0 <__bad_assert>
  400d3c:	240500dc 	li	a1,220
  400d40:	08100332 	j	400cc8 <__vprintf+0x134>
  400d44:	00000000 	nop
  400d48:	24020001 	li	v0,1
  400d4c:	08100302 	j	400c08 <__vprintf+0x74>
  400d50:	afa20068 	sw	v0,104(sp)
  400d54:	3c040040 	lui	a0,0x40
  400d58:	24841b64 	addiu	a0,a0,7012
  400d5c:	0c100430 	jal	4010c0 <strchr>
  400d60:	02002821 	move	a1,s0
  400d64:	10400091 	beqz	v0,400fac <__vprintf+0x418>
  400d68:	24020070 	li	v0,112
  400d6c:	1202001f 	beq	s0,v0,400dec <__vprintf+0x258>
  400d70:	24020064 	li	v0,100
  400d74:	1202009e 	beq	s0,v0,400ff0 <__vprintf+0x45c>
  400d78:	24020001 	li	v0,1
  400d7c:	8fa30044 	lw	v1,68(sp)
  400d80:	00000000 	nop
  400d84:	10620003 	beq	v1,v0,400d94 <__vprintf+0x200>
  400d88:	00000000 	nop
  400d8c:	14600074 	bnez	v1,400f60 <__vprintf+0x3cc>
  400d90:	24020002 	li	v0,2
  400d94:	8fa20038 	lw	v0,56(sp)
  400d98:	afa00048 	sw	zero,72(sp)
  400d9c:	8c430000 	lw	v1,0(v0)
  400da0:	24420004 	addiu	v0,v0,4
  400da4:	afa20038 	sw	v0,56(sp)
  400da8:	afa3004c 	sw	v1,76(sp)
  400dac:	2602ff9c 	addiu	v0,s0,-100
  400db0:	304200ff 	andi	v0,v0,0xff
  400db4:	2c430015 	sltiu	v1,v0,21
  400db8:	10600015 	beqz	v1,400e10 <__vprintf+0x27c>
  400dbc:	3c030040 	lui	v1,0x40
  400dc0:	00021080 	sll	v0,v0,0x2
  400dc4:	24631900 	addiu	v1,v1,6400
  400dc8:	00431021 	addu	v0,v0,v1
  400dcc:	8c440000 	lw	a0,0(v0)
  400dd0:	00000000 	nop
  400dd4:	00800008 	jr	a0
  400dd8:	00000000 	nop
  400ddc:	08100302 	j	400c08 <__vprintf+0x74>
  400de0:	afa20058 	sw	v0,88(sp)
  400de4:	08100302 	j	400c08 <__vprintf+0x74>
  400de8:	afa20044 	sw	v0,68(sp)
  400dec:	8fa20038 	lw	v0,56(sp)
  400df0:	afa00048 	sw	zero,72(sp)
  400df4:	24430004 	addiu	v1,v0,4
  400df8:	afa30038 	sw	v1,56(sp)
  400dfc:	8c440000 	lw	a0,0(v0)
  400e00:	00000000 	nop
  400e04:	afa4004c 	sw	a0,76(sp)
  400e08:	24020010 	li	v0,16
  400e0c:	afa20060 	sw	v0,96(sp)
  400e10:	8fa20068 	lw	v0,104(sp)
  400e14:	00000000 	nop
  400e18:	1440004d 	bnez	v0,400f50 <__vprintf+0x3bc>
  400e1c:	24020001 	li	v0,1
  400e20:	24020070 	li	v0,112
  400e24:	1202004a 	beq	s0,v0,400f50 <__vprintf+0x3bc>
  400e28:	24020001 	li	v0,1
  400e2c:	8fb60060 	lw	s6,96(sp)
  400e30:	3c020040 	lui	v0,0x40
  400e34:	8fb1004c 	lw	s1,76(sp)
  400e38:	8fb00048 	lw	s0,72(sp)
  400e3c:	a3a00029 	sb	zero,41(sp)
  400e40:	24571b6c 	addiu	s7,v0,7020
  400e44:	27b50028 	addiu	s5,sp,40
  400e48:	02c09821 	move	s3,s6
  400e4c:	001697c3 	sra	s2,s6,0x1f
  400e50:	02202821 	move	a1,s1
  400e54:	02002021 	move	a0,s0
  400e58:	02603821 	move	a3,s3
  400e5c:	0c10046c 	jal	4011b0 <__umoddi3>
  400e60:	02403021 	move	a2,s2
  400e64:	02e31821 	addu	v1,s7,v1
  400e68:	90620000 	lbu	v0,0(v1)
  400e6c:	02202821 	move	a1,s1
  400e70:	02002021 	move	a0,s0
  400e74:	02603821 	move	a3,s3
  400e78:	02403021 	move	a2,s2
  400e7c:	0c100464 	jal	401190 <__udivdi3>
  400e80:	a2a20000 	sb	v0,0(s5)
  400e84:	00408021 	move	s0,v0
  400e88:	02031025 	or	v0,s0,v1
  400e8c:	00608821 	move	s1,v1
  400e90:	1440ffef 	bnez	v0,400e50 <__vprintf+0x2bc>
  400e94:	26b5ffff 	addiu	s5,s5,-1
  400e98:	8fa20064 	lw	v0,100(sp)
  400e9c:	00000000 	nop
  400ea0:	10400006 	beqz	v0,400ebc <__vprintf+0x328>
  400ea4:	3c020040 	lui	v0,0x40
  400ea8:	24020010 	li	v0,16
  400eac:	12c2005e 	beq	s6,v0,401028 <__vprintf+0x494>
  400eb0:	24020008 	li	v0,8
  400eb4:	12c20037 	beq	s6,v0,400f94 <__vprintf+0x400>
  400eb8:	3c020040 	lui	v0,0x40
  400ebc:	24461c34 	addiu	a2,v0,7220
  400ec0:	8fa20050 	lw	v0,80(sp)
  400ec4:	00000000 	nop
  400ec8:	10400023 	beqz	v0,400f58 <__vprintf+0x3c4>
  400ecc:	3c020040 	lui	v0,0x40
  400ed0:	3c020040 	lui	v0,0x40
  400ed4:	24451b0c 	addiu	a1,v0,6924
  400ed8:	03c02021 	move	a0,s8
  400edc:	0c100264 	jal	400990 <__pf_printstuff>
  400ee0:	26a70001 	addiu	a3,s5,1
  400ee4:	0c10023a 	jal	4008e8 <__pf_endfield>
  400ee8:	03c02021 	move	a0,s8
  400eec:	08100302 	j	400c08 <__vprintf+0x74>
  400ef0:	00000000 	nop
  400ef4:	8fa20038 	lw	v0,56(sp)
  400ef8:	2403fff8 	li	v1,-8
  400efc:	24420007 	addiu	v0,v0,7
  400f00:	00431024 	and	v0,v0,v1
  400f04:	8c470004 	lw	a3,4(v0)
  400f08:	8c460000 	lw	a2,0(v0)
  400f0c:	24420008 	addiu	v0,v0,8
  400f10:	afa20038 	sw	v0,56(sp)
  400f14:	04c10040 	bgez	a2,401018 <__vprintf+0x484>
  400f18:	2402000a 	li	v0,10
  400f1c:	00071823 	negu	v1,a3
  400f20:	0003282b 	sltu	a1,zero,v1
  400f24:	00061023 	negu	v0,a2
  400f28:	00451023 	subu	v0,v0,a1
  400f2c:	2404ffff 	li	a0,-1
  400f30:	afa40050 	sw	a0,80(sp)
  400f34:	afa3004c 	sw	v1,76(sp)
  400f38:	afa20048 	sw	v0,72(sp)
  400f3c:	2402000a 	li	v0,10
  400f40:	08100384 	j	400e10 <__vprintf+0x27c>
  400f44:	afa20060 	sw	v0,96(sp)
  400f48:	08100302 	j	400c08 <__vprintf+0x74>
  400f4c:	afb0005c 	sw	s0,92(sp)
  400f50:	0810038b 	j	400e2c <__vprintf+0x298>
  400f54:	afa20064 	sw	v0,100(sp)
  400f58:	081003b6 	j	400ed8 <__vprintf+0x344>
  400f5c:	24451c34 	addiu	a1,v0,7220
  400f60:	1462ff93 	bne	v1,v0,400db0 <__vprintf+0x21c>
  400f64:	2602ff9c 	addiu	v0,s0,-100
  400f68:	8fa20038 	lw	v0,56(sp)
  400f6c:	2403fff8 	li	v1,-8
  400f70:	24420007 	addiu	v0,v0,7
  400f74:	00431024 	and	v0,v0,v1
  400f78:	8c450004 	lw	a1,4(v0)
  400f7c:	8c440000 	lw	a0,0(v0)
  400f80:	24420008 	addiu	v0,v0,8
  400f84:	afa20038 	sw	v0,56(sp)
  400f88:	afa5004c 	sw	a1,76(sp)
  400f8c:	0810036b 	j	400dac <__vprintf+0x218>
  400f90:	afa40048 	sw	a0,72(sp)
  400f94:	3c020040 	lui	v0,0x40
  400f98:	081003b0 	j	400ec0 <__vprintf+0x32c>
  400f9c:	24461b84 	addiu	a2,v0,7044
  400fa0:	24020008 	li	v0,8
  400fa4:	08100384 	j	400e10 <__vprintf+0x27c>
  400fa8:	afa20060 	sw	v0,96(sp)
  400fac:	24020073 	li	v0,115
  400fb0:	12020028 	beq	s0,v0,401054 <__vprintf+0x4c0>
  400fb4:	24020063 	li	v0,99
  400fb8:	12020037 	beq	s0,v0,401098 <__vprintf+0x504>
  400fbc:	00000000 	nop
  400fc0:	a3b00011 	sb	s0,17(sp)
  400fc4:	3c050040 	lui	a1,0x40
  400fc8:	24a51c34 	addiu	a1,a1,7220
  400fcc:	03c02021 	move	a0,s8
  400fd0:	00a03021 	move	a2,a1
  400fd4:	27a70011 	addiu	a3,sp,17
  400fd8:	0c100264 	jal	400990 <__pf_printstuff>
  400fdc:	a3a00012 	sb	zero,18(sp)
  400fe0:	0c10023a 	jal	4008e8 <__pf_endfield>
  400fe4:	03c02021 	move	a0,s8
  400fe8:	08100302 	j	400c08 <__vprintf+0x74>
  400fec:	00000000 	nop
  400ff0:	8fa30044 	lw	v1,68(sp)
  400ff4:	00000000 	nop
  400ff8:	1062000e 	beq	v1,v0,401034 <__vprintf+0x4a0>
  400ffc:	00000000 	nop
  401000:	1060000c 	beqz	v1,401034 <__vprintf+0x4a0>
  401004:	24020002 	li	v0,2
  401008:	1062ffba 	beq	v1,v0,400ef4 <__vprintf+0x360>
  40100c:	00003821 	move	a3,zero
  401010:	00003021 	move	a2,zero
  401014:	2402000a 	li	v0,10
  401018:	afa7004c 	sw	a3,76(sp)
  40101c:	afa60048 	sw	a2,72(sp)
  401020:	08100384 	j	400e10 <__vprintf+0x27c>
  401024:	afa20060 	sw	v0,96(sp)
  401028:	3c020040 	lui	v0,0x40
  40102c:	081003b0 	j	400ec0 <__vprintf+0x32c>
  401030:	24461b80 	addiu	a2,v0,7040
  401034:	8fa20038 	lw	v0,56(sp)
  401038:	00000000 	nop
  40103c:	8c430000 	lw	v1,0(v0)
  401040:	24420004 	addiu	v0,v0,4
  401044:	00603821 	move	a3,v1
  401048:	000337c3 	sra	a2,v1,0x1f
  40104c:	081003c5 	j	400f14 <__vprintf+0x380>
  401050:	afa20038 	sw	v0,56(sp)
  401054:	8fa30038 	lw	v1,56(sp)
  401058:	00000000 	nop
  40105c:	8c670000 	lw	a3,0(v1)
  401060:	00000000 	nop
  401064:	10e00013 	beqz	a3,4010b4 <__vprintf+0x520>
  401068:	3c020040 	lui	v0,0x40
  40106c:	3c050040 	lui	a1,0x40
  401070:	24a51c34 	addiu	a1,a1,7220
  401074:	24620004 	addiu	v0,v1,4
  401078:	03c02021 	move	a0,s8
  40107c:	00a03021 	move	a2,a1
  401080:	0c100264 	jal	400990 <__pf_printstuff>
  401084:	afa20038 	sw	v0,56(sp)
  401088:	0c10023a 	jal	4008e8 <__pf_endfield>
  40108c:	03c02021 	move	a0,s8
  401090:	08100302 	j	400c08 <__vprintf+0x74>
  401094:	00000000 	nop
  401098:	8fa20038 	lw	v0,56(sp)
  40109c:	00000000 	nop
  4010a0:	8c430000 	lw	v1,0(v0)
  4010a4:	24420004 	addiu	v0,v0,4
  4010a8:	afa20038 	sw	v0,56(sp)
  4010ac:	081003f1 	j	400fc4 <__vprintf+0x430>
  4010b0:	a3a30011 	sb	v1,17(sp)
  4010b4:	0810041b 	j	40106c <__vprintf+0x4d8>
  4010b8:	24471b10 	addiu	a3,v0,6928
  4010bc:	00000000 	nop

004010c0 <strchr>:
  4010c0:	80830000 	lb	v1,0(a0)
  4010c4:	00052e00 	sll	a1,a1,0x18
  4010c8:	00801021 	move	v0,a0
  4010cc:	1060000c 	beqz	v1,401100 <strchr+0x40>
  4010d0:	00052e03 	sra	a1,a1,0x18
  4010d4:	14a30006 	bne	a1,v1,4010f0 <strchr+0x30>
  4010d8:	24420001 	addiu	v0,v0,1
  4010dc:	03e00008 	jr	ra
  4010e0:	2442ffff 	addiu	v0,v0,-1
  4010e4:	10a3000c 	beq	a1,v1,401118 <strchr+0x58>
  4010e8:	00000000 	nop
  4010ec:	24420001 	addiu	v0,v0,1
  4010f0:	80430000 	lb	v1,0(v0)
  4010f4:	00000000 	nop
  4010f8:	1460fffa 	bnez	v1,4010e4 <strchr+0x24>
  4010fc:	00000000 	nop
  401100:	14a00003 	bnez	a1,401110 <strchr+0x50>
  401104:	00000000 	nop
  401108:	03e00008 	jr	ra
  40110c:	00000000 	nop
  401110:	03e00008 	jr	ra
  401114:	00001021 	move	v0,zero
  401118:	03e00008 	jr	ra
  40111c:	00000000 	nop

00401120 <strerror>:
  401120:	3c020040 	lui	v0,0x40
  401124:	00042880 	sll	a1,a0,0x2
  401128:	24421960 	addiu	v0,v0,6496
  40112c:	3c030040 	lui	v1,0x40
  401130:	2c840041 	sltiu	a0,a0,65
  401134:	00a22821 	addu	a1,a1,v0
  401138:	10800002 	beqz	a0,401144 <strerror+0x24>
  40113c:	24621b88 	addiu	v0,v1,7048
  401140:	8ca20000 	lw	v0,0(a1)
  401144:	03e00008 	jr	ra
  401148:	00000000 	nop
  40114c:	00000000 	nop

00401150 <strlen>:
  401150:	80820000 	lb	v0,0(a0)
  401154:	00000000 	nop
  401158:	1040000a 	beqz	v0,401184 <strlen+0x34>
  40115c:	00002821 	move	a1,zero
  401160:	24a50001 	addiu	a1,a1,1
  401164:	00851021 	addu	v0,a0,a1
  401168:	80430000 	lb	v1,0(v0)
  40116c:	00000000 	nop
  401170:	1460fffc 	bnez	v1,401164 <strlen+0x14>
  401174:	24a50001 	addiu	a1,a1,1
  401178:	24a5ffff 	addiu	a1,a1,-1
  40117c:	03e00008 	jr	ra
  401180:	00a01021 	move	v0,a1
  401184:	03e00008 	jr	ra
  401188:	00a01021 	move	v0,a1
  40118c:	00000000 	nop

00401190 <__udivdi3>:
  401190:	27bdffe0 	addiu	sp,sp,-32
  401194:	afbf0018 	sw	ra,24(sp)
  401198:	0c1004f3 	jal	4013cc <__qdivrem>
  40119c:	afa00010 	sw	zero,16(sp)
  4011a0:	8fbf0018 	lw	ra,24(sp)
  4011a4:	00000000 	nop
  4011a8:	03e00008 	jr	ra
  4011ac:	27bd0020 	addiu	sp,sp,32

004011b0 <__umoddi3>:
  4011b0:	27bdffd8 	addiu	sp,sp,-40
  4011b4:	27a20018 	addiu	v0,sp,24
  4011b8:	afbf0020 	sw	ra,32(sp)
  4011bc:	0c1004f3 	jal	4013cc <__qdivrem>
  4011c0:	afa20010 	sw	v0,16(sp)
  4011c4:	8fa3001c 	lw	v1,28(sp)
  4011c8:	8fa20018 	lw	v0,24(sp)
  4011cc:	8fbf0020 	lw	ra,32(sp)
  4011d0:	00000000 	nop
  4011d4:	03e00008 	jr	ra
  4011d8:	27bd0028 	addiu	sp,sp,40
  4011dc:	00000000 	nop

004011e0 <__bad_assert>:
  4011e0:	27bdfee0 	addiu	sp,sp,-288
  4011e4:	00c03821 	move	a3,a2
  4011e8:	afb00118 	sw	s0,280(sp)
  4011ec:	3c060040 	lui	a2,0x40
  4011f0:	27b00018 	addiu	s0,sp,24
  4011f4:	24c6218c 	addiu	a2,a2,8588
  4011f8:	afa40010 	sw	a0,16(sp)
  4011fc:	afa50014 	sw	a1,20(sp)
  401200:	02002021 	move	a0,s0
  401204:	afbf011c 	sw	ra,284(sp)
  401208:	0c1004c4 	jal	401310 <snprintf>
  40120c:	24050100 	li	a1,256
  401210:	0c100454 	jal	401150 <strlen>
  401214:	02002021 	move	a0,s0
  401218:	00403021 	move	a2,v0
  40121c:	02002821 	move	a1,s0
  401220:	0c100133 	jal	4004cc <write>
  401224:	24040002 	li	a0,2
  401228:	0c1004d0 	jal	401340 <abort>
  40122c:	00000000 	nop

00401230 <__snprintf_send>:
  401230:	10c00012 	beqz	a2,40127c <__snprintf_send+0x4c>
  401234:	00004021 	move	t0,zero
  401238:	8c870008 	lw	a3,8(a0)
  40123c:	8c820004 	lw	v0,4(a0)
  401240:	00a81821 	addu	v1,a1,t0
  401244:	00e2102b 	sltu	v0,a3,v0
  401248:	1040000a 	beqz	v0,401274 <__snprintf_send+0x44>
  40124c:	25080001 	addiu	t0,t0,1
  401250:	8c820000 	lw	v0,0(a0)
  401254:	90630000 	lbu	v1,0(v1)
  401258:	00471021 	addu	v0,v0,a3
  40125c:	a0430000 	sb	v1,0(v0)
  401260:	8c870008 	lw	a3,8(a0)
  401264:	00000000 	nop
  401268:	24e20001 	addiu	v0,a3,1
  40126c:	00403821 	move	a3,v0
  401270:	ac820008 	sw	v0,8(a0)
  401274:	14c8fff1 	bne	a2,t0,40123c <__snprintf_send+0xc>
  401278:	00000000 	nop
  40127c:	03e00008 	jr	ra
  401280:	00000000 	nop

00401284 <vsnprintf>:
  401284:	27bdffd8 	addiu	sp,sp,-40
  401288:	afb00020 	sw	s0,32(sp)
  40128c:	00a01021 	move	v0,a1
  401290:	00808021 	move	s0,a0
  401294:	3c040040 	lui	a0,0x40
  401298:	24a3ffff 	addiu	v1,a1,-1
  40129c:	afbf0024 	sw	ra,36(sp)
  4012a0:	24841230 	addiu	a0,a0,4656
  4012a4:	27a50010 	addiu	a1,sp,16
  4012a8:	1440000c 	bnez	v0,4012dc <vsnprintf+0x58>
  4012ac:	afb00010 	sw	s0,16(sp)
  4012b0:	3c040040 	lui	a0,0x40
  4012b4:	24841230 	addiu	a0,a0,4656
  4012b8:	afa00014 	sw	zero,20(sp)
  4012bc:	0c1002e5 	jal	400b94 <__vprintf>
  4012c0:	afa00018 	sw	zero,24(sp)
  4012c4:	00401821 	move	v1,v0
  4012c8:	8fbf0024 	lw	ra,36(sp)
  4012cc:	8fb00020 	lw	s0,32(sp)
  4012d0:	00601021 	move	v0,v1
  4012d4:	03e00008 	jr	ra
  4012d8:	27bd0028 	addiu	sp,sp,40
  4012dc:	afa30014 	sw	v1,20(sp)
  4012e0:	0c1002e5 	jal	400b94 <__vprintf>
  4012e4:	afa00018 	sw	zero,24(sp)
  4012e8:	00401821 	move	v1,v0
  4012ec:	8fa20018 	lw	v0,24(sp)
  4012f0:	00000000 	nop
  4012f4:	02021021 	addu	v0,s0,v0
  4012f8:	a0400000 	sb	zero,0(v0)
  4012fc:	8fbf0024 	lw	ra,36(sp)
  401300:	8fb00020 	lw	s0,32(sp)
  401304:	00601021 	move	v0,v1
  401308:	03e00008 	jr	ra
  40130c:	27bd0028 	addiu	sp,sp,40

00401310 <snprintf>:
  401310:	27bdffe0 	addiu	sp,sp,-32
  401314:	27a2002c 	addiu	v0,sp,44
  401318:	afa7002c 	sw	a3,44(sp)
  40131c:	00403821 	move	a3,v0
  401320:	afbf0018 	sw	ra,24(sp)
  401324:	0c1004a1 	jal	401284 <vsnprintf>
  401328:	afa20010 	sw	v0,16(sp)
  40132c:	8fbf0018 	lw	ra,24(sp)
  401330:	00000000 	nop
  401334:	03e00008 	jr	ra
  401338:	27bd0020 	addiu	sp,sp,32
  40133c:	00000000 	nop

00401340 <abort>:
  401340:	27bdffe8 	addiu	sp,sp,-24
  401344:	afbf0010 	sw	ra,16(sp)
  401348:	0c1000f3 	jal	4003cc <_exit>
  40134c:	240400ff 	li	a0,255

00401350 <shl>:
  401350:	18a00016 	blez	a1,4013ac <shl+0x5c>
  401354:	24020010 	li	v0,16
  401358:	00464823 	subu	t1,v0,a2
  40135c:	00803821 	move	a3,a0
  401360:	00004021 	move	t0,zero
  401364:	8ce20000 	lw	v0,0(a3)
  401368:	8ce30004 	lw	v1,4(a3)
  40136c:	00c21004 	sllv	v0,v0,a2
  401370:	3042ffff 	andi	v0,v0,0xffff
  401374:	01231806 	srlv	v1,v1,t1
  401378:	00431025 	or	v0,v0,v1
  40137c:	25080001 	addiu	t0,t0,1
  401380:	ace20000 	sw	v0,0(a3)
  401384:	14a8fff7 	bne	a1,t0,401364 <shl+0x14>
  401388:	24e70004 	addiu	a3,a3,4
  40138c:	00051880 	sll	v1,a1,0x2
  401390:	00831821 	addu	v1,a0,v1
  401394:	8c620000 	lw	v0,0(v1)
  401398:	00000000 	nop
  40139c:	00c21004 	sllv	v0,v0,a2
  4013a0:	3042ffff 	andi	v0,v0,0xffff
  4013a4:	03e00008 	jr	ra
  4013a8:	ac620000 	sw	v0,0(v1)
  4013ac:	00001821 	move	v1,zero
  4013b0:	00831821 	addu	v1,a0,v1
  4013b4:	8c620000 	lw	v0,0(v1)
  4013b8:	00000000 	nop
  4013bc:	00c21004 	sllv	v0,v0,a2
  4013c0:	3042ffff 	andi	v0,v0,0xffff
  4013c4:	03e00008 	jr	ra
  4013c8:	ac620000 	sw	v0,0(v1)

004013cc <__qdivrem>:
  4013cc:	27bdff80 	addiu	sp,sp,-128
  4013d0:	00c71025 	or	v0,a2,a3
  4013d4:	afb20060 	sw	s2,96(sp)
  4013d8:	afbf007c 	sw	ra,124(sp)
  4013dc:	afbe0078 	sw	s8,120(sp)
  4013e0:	afb70074 	sw	s7,116(sp)
  4013e4:	afb60070 	sw	s6,112(sp)
  4013e8:	afb5006c 	sw	s5,108(sp)
  4013ec:	afb40068 	sw	s4,104(sp)
  4013f0:	afb30064 	sw	s3,100(sp)
  4013f4:	afb1005c 	sw	s1,92(sp)
  4013f8:	afb00058 	sw	s0,88(sp)
  4013fc:	00a04821 	move	t1,a1
  401400:	8fb20090 	lw	s2,144(sp)
  401404:	14400018 	bnez	v0,401468 <__qdivrem+0x9c>
  401408:	00804021 	move	t0,a0
  40140c:	3c031000 	lui	v1,0x1000
  401410:	8c640000 	lw	a0,0(v1)
  401414:	24020001 	li	v0,1
  401418:	14800002 	bnez	a0,401424 <__qdivrem+0x58>
  40141c:	0044001b 	divu	zero,v0,a0
  401420:	0007000d 	break	0x7
  401424:	00001012 	mflo	v0
  401428:	12400003 	beqz	s2,401438 <__qdivrem+0x6c>
  40142c:	00401821 	move	v1,v0
  401430:	ae450004 	sw	a1,4(s2)
  401434:	ae480000 	sw	t0,0(s2)
  401438:	8fbf007c 	lw	ra,124(sp)
  40143c:	8fbe0078 	lw	s8,120(sp)
  401440:	8fb70074 	lw	s7,116(sp)
  401444:	8fb60070 	lw	s6,112(sp)
  401448:	8fb5006c 	lw	s5,108(sp)
  40144c:	8fb40068 	lw	s4,104(sp)
  401450:	8fb30064 	lw	s3,100(sp)
  401454:	8fb20060 	lw	s2,96(sp)
  401458:	8fb1005c 	lw	s1,92(sp)
  40145c:	8fb00058 	lw	s0,88(sp)
  401460:	03e00008 	jr	ra
  401464:	27bd0080 	addiu	sp,sp,128
  401468:	0086102b 	sltu	v0,a0,a2
  40146c:	10400008 	beqz	v0,401490 <__qdivrem+0xc4>
  401470:	00000000 	nop
  401474:	1240010c 	beqz	s2,4018a8 <__qdivrem+0x4dc>
  401478:	00000000 	nop
  40147c:	00001821 	move	v1,zero
  401480:	00001021 	move	v0,zero
  401484:	ae490004 	sw	t1,4(s2)
  401488:	0810050e 	j	401438 <__qdivrem+0x6c>
  40148c:	ae480000 	sw	t0,0(s2)
  401490:	10860046 	beq	a0,a2,4015ac <__qdivrem+0x1e0>
  401494:	00a7102b 	sltu	v0,a1,a3
  401498:	00e08821 	move	s1,a3
  40149c:	01001821 	move	v1,t0
  4014a0:	00c08021 	move	s0,a2
  4014a4:	30c7ffff 	andi	a3,a2,0xffff
  4014a8:	3108ffff 	andi	t0,t0,0xffff
  4014ac:	312affff 	andi	t2,t1,0xffff
  4014b0:	3226ffff 	andi	a2,s1,0xffff
  4014b4:	00031c02 	srl	v1,v1,0x10
  4014b8:	00092c02 	srl	a1,t1,0x10
  4014bc:	00101402 	srl	v0,s0,0x10
  4014c0:	00112402 	srl	a0,s1,0x10
  4014c4:	afa00010 	sw	zero,16(sp)
  4014c8:	afa30014 	sw	v1,20(sp)
  4014cc:	afa80018 	sw	t0,24(sp)
  4014d0:	afa5001c 	sw	a1,28(sp)
  4014d4:	afaa0020 	sw	t2,32(sp)
  4014d8:	afa20028 	sw	v0,40(sp)
  4014dc:	afa7002c 	sw	a3,44(sp)
  4014e0:	afa40030 	sw	a0,48(sp)
  4014e4:	144000f6 	bnez	v0,4018c0 <__qdivrem+0x4f4>
  4014e8:	afa60034 	sw	a2,52(sp)
  4014ec:	14e00033 	bnez	a3,4015bc <__qdivrem+0x1f0>
  4014f0:	27a20028 	addiu	v0,sp,40
  4014f4:	148000f7 	bnez	a0,4018d4 <__qdivrem+0x508>
  4014f8:	27a2002c 	addiu	v0,sp,44
  4014fc:	14c00002 	bnez	a2,401508 <__qdivrem+0x13c>
  401500:	0066001b 	divu	zero,v1,a2
  401504:	0007000d 	break	0x7
  401508:	00001010 	mfhi	v0
  40150c:	00021400 	sll	v0,v0,0x10
  401510:	00481025 	or	v0,v0,t0
  401514:	00004812 	mflo	t1
	...
  401520:	14c00002 	bnez	a2,40152c <__qdivrem+0x160>
  401524:	0046001b 	divu	zero,v0,a2
  401528:	0007000d 	break	0x7
  40152c:	00001810 	mfhi	v1
  401530:	00031c00 	sll	v1,v1,0x10
  401534:	00651825 	or	v1,v1,a1
  401538:	00003812 	mflo	a3
	...
  401544:	14c00002 	bnez	a2,401550 <__qdivrem+0x184>
  401548:	0066001b 	divu	zero,v1,a2
  40154c:	0007000d 	break	0x7
  401550:	00001010 	mfhi	v0
  401554:	00021400 	sll	v0,v0,0x10
  401558:	00001812 	mflo	v1
  40155c:	12400008 	beqz	s2,401580 <__qdivrem+0x1b4>
  401560:	01422025 	or	a0,t2,v0
  401564:	14c00002 	bnez	a2,401570 <__qdivrem+0x1a4>
  401568:	0086001b 	divu	zero,a0,a2
  40156c:	0007000d 	break	0x7
  401570:	ae400000 	sw	zero,0(s2)
  401574:	00001010 	mfhi	v0
  401578:	ae420004 	sw	v0,4(s2)
  40157c:	00000000 	nop
  401580:	14c00002 	bnez	a2,40158c <__qdivrem+0x1c0>
  401584:	0086001b 	divu	zero,a0,a2
  401588:	0007000d 	break	0x7
  40158c:	00091400 	sll	v0,t1,0x10
  401590:	00031c00 	sll	v1,v1,0x10
  401594:	00e28025 	or	s0,a3,v0
  401598:	02001021 	move	v0,s0
  40159c:	00002012 	mflo	a0
  4015a0:	00838825 	or	s1,a0,v1
  4015a4:	0810050e 	j	401438 <__qdivrem+0x6c>
  4015a8:	02201821 	move	v1,s1
  4015ac:	1040ffbb 	beqz	v0,40149c <__qdivrem+0xd0>
  4015b0:	00e08821 	move	s1,a3
  4015b4:	0810051d 	j	401474 <__qdivrem+0xa8>
  4015b8:	00000000 	nop
  4015bc:	afa20050 	sw	v0,80(sp)
  4015c0:	24170003 	li	s7,3
  4015c4:	27be002c 	addiu	s8,sp,44
  4015c8:	8fa30014 	lw	v1,20(sp)
  4015cc:	24020004 	li	v0,4
  4015d0:	146000c4 	bnez	v1,4018e4 <__qdivrem+0x518>
  4015d4:	00579823 	subu	s3,v0,s7
  4015d8:	08100579 	j	4015e4 <__qdivrem+0x218>
  4015dc:	27b40014 	addiu	s4,sp,20
  4015e0:	0060a021 	move	s4,v1
  4015e4:	8e820004 	lw	v0,4(s4)
  4015e8:	2673ffff 	addiu	s3,s3,-1
  4015ec:	1040fffc 	beqz	v0,4015e0 <__qdivrem+0x214>
  4015f0:	26830004 	addiu	v1,s4,4
  4015f4:	24020004 	li	v0,4
  4015f8:	00532023 	subu	a0,v0,s3
  4015fc:	2483ffff 	addiu	v1,a0,-1
  401600:	046000bc 	bltz	v1,4018f4 <__qdivrem+0x528>
  401604:	00001821 	move	v1,zero
  401608:	27a60038 	addiu	a2,sp,56
  40160c:	00042880 	sll	a1,a0,0x2
  401610:	00c51021 	addu	v0,a2,a1
  401614:	2442fffc 	addiu	v0,v0,-4
  401618:	24630001 	addiu	v1,v1,1
  40161c:	ac400000 	sw	zero,0(v0)
  401620:	1464fffd 	bne	v1,a0,401618 <__qdivrem+0x24c>
  401624:	2442fffc 	addiu	v0,v0,-4
  401628:	8fcb0000 	lw	t3,0(s8)
  40162c:	34028000 	li	v0,0x8000
  401630:	0162102b 	sltu	v0,t3,v0
  401634:	00c5b021 	addu	s6,a2,a1
  401638:	104000ac 	beqz	v0,4018ec <__qdivrem+0x520>
  40163c:	01601821 	move	v1,t3
  401640:	0000a821 	move	s5,zero
  401644:	34048000 	li	a0,0x8000
  401648:	00031840 	sll	v1,v1,0x1
  40164c:	0064102b 	sltu	v0,v1,a0
  401650:	1440fffd 	bnez	v0,401648 <__qdivrem+0x27c>
  401654:	26b50001 	addiu	s5,s5,1
  401658:	1aa00009 	blez	s5,401680 <__qdivrem+0x2b4>
  40165c:	02f32821 	addu	a1,s7,s3
  401660:	02a03021 	move	a2,s5
  401664:	0c1004d4 	jal	401350 <shl>
  401668:	02802021 	move	a0,s4
  40166c:	03c02021 	move	a0,s8
  401670:	26e5ffff 	addiu	a1,s7,-1
  401674:	0c1004d4 	jal	401350 <shl>
  401678:	02a03021 	move	a2,s5
  40167c:	8fcb0000 	lw	t3,0(s8)
  401680:	8fa20050 	lw	v0,80(sp)
  401684:	00177080 	sll	t6,s7,0x2
  401688:	8c580008 	lw	t8,8(v0)
  40168c:	02c06821 	move	t5,s6
  401690:	02804821 	move	t1,s4
  401694:	028e6021 	addu	t4,s4,t6
  401698:	00007821 	move	t7,zero
  40169c:	3416ffff 	li	s6,0xffff
  4016a0:	8d240000 	lw	a0,0(t1)
  4016a4:	8d230004 	lw	v1,4(t1)
  4016a8:	8d260008 	lw	a2,8(t1)
  4016ac:	11640081 	beq	t3,a0,4018b4 <__qdivrem+0x4e8>
  4016b0:	00041400 	sll	v0,a0,0x10
  4016b4:	00621025 	or	v0,v1,v0
  4016b8:	15600002 	bnez	t3,4016c4 <__qdivrem+0x2f8>
  4016bc:	004b001b 	divu	zero,v0,t3
  4016c0:	0007000d 	break	0x7
  4016c4:	00002810 	mfhi	a1
  4016c8:	00003812 	mflo	a3
	...
  4016d4:	00f80018 	mult	a3,t8
  4016d8:	00051400 	sll	v0,a1,0x10
  4016dc:	00c21025 	or	v0,a2,v0
  4016e0:	00001812 	mflo	v1
  4016e4:	0043182b 	sltu	v1,v0,v1
  4016e8:	10600006 	beqz	v1,401704 <__qdivrem+0x338>
  4016ec:	00000000 	nop
  4016f0:	24e7ffff 	addiu	a3,a3,-1
  4016f4:	00ab2821 	addu	a1,a1,t3
  4016f8:	02c5102b 	sltu	v0,s6,a1
  4016fc:	1040fff6 	beqz	v0,4016d8 <__qdivrem+0x30c>
  401700:	00f80018 	mult	a3,t8
  401704:	1ae00017 	blez	s7,401764 <__qdivrem+0x398>
  401708:	00004021 	move	t0,zero
  40170c:	8fa20050 	lw	v0,80(sp)
  401710:	01802021 	move	a0,t4
  401714:	004e3021 	addu	a2,v0,t6
  401718:	02e02821 	move	a1,s7
  40171c:	3c0a0001 	lui	t2,0x1
  401720:	8cc20000 	lw	v0,0(a2)
  401724:	8c830000 	lw	v1,0(a0)
  401728:	00e20018 	mult	a3,v0
  40172c:	24a5ffff 	addiu	a1,a1,-1
  401730:	24c6fffc 	addiu	a2,a2,-4
  401734:	00001012 	mflo	v0
  401738:	00621823 	subu	v1,v1,v0
  40173c:	00681823 	subu	v1,v1,t0
  401740:	00031402 	srl	v0,v1,0x10
  401744:	01421023 	subu	v0,t2,v0
  401748:	3063ffff 	andi	v1,v1,0xffff
  40174c:	ac830000 	sw	v1,0(a0)
  401750:	3048ffff 	andi	t0,v0,0xffff
  401754:	14a0fff2 	bnez	a1,401720 <__qdivrem+0x354>
  401758:	2484fffc 	addiu	a0,a0,-4
  40175c:	8d240000 	lw	a0,0(t1)
  401760:	00000000 	nop
  401764:	00881023 	subu	v0,a0,t0
  401768:	3044ffff 	andi	a0,v0,0xffff
  40176c:	00021c02 	srl	v1,v0,0x10
  401770:	10600018 	beqz	v1,4017d4 <__qdivrem+0x408>
  401774:	ad240000 	sw	a0,0(t1)
  401778:	1ae00012 	blez	s7,4017c4 <__qdivrem+0x3f8>
  40177c:	00004021 	move	t0,zero
  401780:	8fa20050 	lw	v0,80(sp)
  401784:	01802021 	move	a0,t4
  401788:	004e3021 	addu	a2,v0,t6
  40178c:	02e02821 	move	a1,s7
  401790:	8c820000 	lw	v0,0(a0)
  401794:	8cc30000 	lw	v1,0(a2)
  401798:	01021021 	addu	v0,t0,v0
  40179c:	00431021 	addu	v0,v0,v1
  4017a0:	3043ffff 	andi	v1,v0,0xffff
  4017a4:	24a5ffff 	addiu	a1,a1,-1
  4017a8:	ac830000 	sw	v1,0(a0)
  4017ac:	00024402 	srl	t0,v0,0x10
  4017b0:	2484fffc 	addiu	a0,a0,-4
  4017b4:	14a0fff6 	bnez	a1,401790 <__qdivrem+0x3c4>
  4017b8:	24c6fffc 	addiu	a2,a2,-4
  4017bc:	8d240000 	lw	a0,0(t1)
  4017c0:	00000000 	nop
  4017c4:	01041021 	addu	v0,t0,a0
  4017c8:	3042ffff 	andi	v0,v0,0xffff
  4017cc:	ad220000 	sw	v0,0(t1)
  4017d0:	24e7ffff 	addiu	a3,a3,-1
  4017d4:	25ef0001 	addiu	t7,t7,1
  4017d8:	026f102a 	slt	v0,s3,t7
  4017dc:	ada70000 	sw	a3,0(t5)
  4017e0:	25290004 	addiu	t1,t1,4
  4017e4:	25ad0004 	addiu	t5,t5,4
  4017e8:	1040ffad 	beqz	v0,4016a0 <__qdivrem+0x2d4>
  4017ec:	258c0004 	addiu	t4,t4,4
  4017f0:	12400022 	beqz	s2,40187c <__qdivrem+0x4b0>
  4017f4:	00000000 	nop
  4017f8:	12a00016 	beqz	s5,401854 <__qdivrem+0x488>
  4017fc:	02f32821 	addu	a1,s7,s3
  401800:	0265102a 	slt	v0,s3,a1
  401804:	10400011 	beqz	v0,40184c <__qdivrem+0x480>
  401808:	00051080 	sll	v0,a1,0x2
  40180c:	00051880 	sll	v1,a1,0x2
  401810:	24020010 	li	v0,16
  401814:	00553823 	subu	a3,v0,s5
  401818:	02833021 	addu	a2,s4,v1
  40181c:	8cc2fffc 	lw	v0,-4(a2)
  401820:	8cc30000 	lw	v1,0(a2)
  401824:	00e21004 	sllv	v0,v0,a3
  401828:	02a31806 	srlv	v1,v1,s5
  40182c:	3042ffff 	andi	v0,v0,0xffff
  401830:	24a5ffff 	addiu	a1,a1,-1
  401834:	00621825 	or	v1,v1,v0
  401838:	0265202a 	slt	a0,s3,a1
  40183c:	acc30000 	sw	v1,0(a2)
  401840:	1480fff6 	bnez	a0,40181c <__qdivrem+0x450>
  401844:	24c6fffc 	addiu	a2,a2,-4
  401848:	00051080 	sll	v0,a1,0x2
  40184c:	00541021 	addu	v0,v0,s4
  401850:	ac400000 	sw	zero,0(v0)
  401854:	8fa20014 	lw	v0,20(sp)
  401858:	8fa40018 	lw	a0,24(sp)
  40185c:	00021400 	sll	v0,v0,0x10
  401860:	8fa3001c 	lw	v1,28(sp)
  401864:	00448025 	or	s0,v0,a0
  401868:	8fa20020 	lw	v0,32(sp)
  40186c:	00031c00 	sll	v1,v1,0x10
  401870:	00628825 	or	s1,v1,v0
  401874:	ae510004 	sw	s1,4(s2)
  401878:	ae500000 	sw	s0,0(s2)
  40187c:	8fa2003c 	lw	v0,60(sp)
  401880:	8fa40040 	lw	a0,64(sp)
  401884:	00021400 	sll	v0,v0,0x10
  401888:	8fa30044 	lw	v1,68(sp)
  40188c:	00448025 	or	s0,v0,a0
  401890:	8fa20048 	lw	v0,72(sp)
  401894:	00031c00 	sll	v1,v1,0x10
  401898:	00628825 	or	s1,v1,v0
  40189c:	02201821 	move	v1,s1
  4018a0:	0810050e 	j	401438 <__qdivrem+0x6c>
  4018a4:	02001021 	move	v0,s0
  4018a8:	00001821 	move	v1,zero
  4018ac:	0810050e 	j	401438 <__qdivrem+0x6c>
  4018b0:	00001021 	move	v0,zero
  4018b4:	00602821 	move	a1,v1
  4018b8:	081005bd 	j	4016f4 <__qdivrem+0x328>
  4018bc:	3407ffff 	li	a3,0xffff
  4018c0:	27a20024 	addiu	v0,sp,36
  4018c4:	24170004 	li	s7,4
  4018c8:	27be0028 	addiu	s8,sp,40
  4018cc:	08100572 	j	4015c8 <__qdivrem+0x1fc>
  4018d0:	afa20050 	sw	v0,80(sp)
  4018d4:	24170002 	li	s7,2
  4018d8:	27be0030 	addiu	s8,sp,48
  4018dc:	08100572 	j	4015c8 <__qdivrem+0x1fc>
  4018e0:	afa20050 	sw	v0,80(sp)
  4018e4:	0810057d 	j	4015f4 <__qdivrem+0x228>
  4018e8:	27b40010 	addiu	s4,sp,16
  4018ec:	081005a0 	j	401680 <__qdivrem+0x2b4>
  4018f0:	0000a821 	move	s5,zero
  4018f4:	00042880 	sll	a1,a0,0x2
  4018f8:	0810058a 	j	401628 <__qdivrem+0x25c>
  4018fc:	27a60038 	addiu	a2,sp,56
