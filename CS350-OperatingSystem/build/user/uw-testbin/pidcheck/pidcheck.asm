
../../../build/user/uw-testbin/pidcheck/pidcheck:     file format elf32-tradbigmips

Disassembly of section .text:

00400000 <__start>:
  400000:	3c1c1001 	lui	gp,0x1001
  400004:	279c8000 	addiu	gp,gp,-32768
  400008:	2408fff8 	li	t0,-8
  40000c:	03a8e824 	and	sp,sp,t0
  400010:	27bdfff0 	addiu	sp,sp,-16
  400014:	3c011000 	lui	at,0x1000
  400018:	ac250018 	sw	a1,24(at)
  40001c:	0c100014 	jal	400050 <main>
  400020:	00000000 	nop
  400024:	00408021 	move	s0,v0
  400028:	0c10008d 	jal	400234 <exit>
  40002c:	02002021 	move	a0,s0
  400030:	0c1000a3 	jal	40028c <_exit>
  400034:	02002021 	move	a0,s0
  400038:	02002021 	move	a0,s0
  40003c:	24020003 	li	v0,3
  400040:	0000000c 	syscall
  400044:	0810000e 	j	400038 <__start+0x38>
  400048:	00000000 	nop
  40004c:	00000000 	nop

00400050 <main>:
  400050:	27bdffe8 	addiu	sp,sp,-24
  400054:	afbf0010 	sw	ra,16(sp)
  400058:	0c10009d 	jal	400274 <fork>
  40005c:	00000000 	nop
  400060:	04400024 	bltz	v0,4000f4 <main+0xa4>
  400064:	00402821 	move	a1,v0
  400068:	10400018 	beqz	v0,4000cc <main+0x7c>
  40006c:	3c041000 	lui	a0,0x1000
  400070:	3c02000f 	lui	v0,0xf
  400074:	ac800010 	sw	zero,16(a0)
  400078:	34464240 	ori	a2,v0,0x4240
  40007c:	00001821 	move	v1,zero
  400080:	8c820010 	lw	v0,16(a0)
  400084:	24630001 	addiu	v1,v1,1
  400088:	24420001 	addiu	v0,v0,1
  40008c:	ac820010 	sw	v0,16(a0)
  400090:	1466fffb 	bne	v1,a2,400080 <main+0x30>
  400094:	00000000 	nop
  400098:	3c040040 	lui	a0,0x40
  40009c:	0c10005f 	jal	40017c <printf>
  4000a0:	24841940 	addiu	a0,a0,6464
  4000a4:	0c1000a7 	jal	40029c <getpid>
  4000a8:	00000000 	nop
  4000ac:	3c040040 	lui	a0,0x40
  4000b0:	24841948 	addiu	a0,a0,6472
  4000b4:	0c10005f 	jal	40017c <printf>
  4000b8:	00402821 	move	a1,v0
  4000bc:	8fbf0010 	lw	ra,16(sp)
  4000c0:	00001021 	move	v0,zero
  4000c4:	03e00008 	jr	ra
  4000c8:	27bd0018 	addiu	sp,sp,24
  4000cc:	0c1000a7 	jal	40029c <getpid>
  4000d0:	00000000 	nop
  4000d4:	3c040040 	lui	a0,0x40
  4000d8:	24841938 	addiu	a0,a0,6456
  4000dc:	0c10005f 	jal	40017c <printf>
  4000e0:	00402821 	move	a1,v0
  4000e4:	8fbf0010 	lw	ra,16(sp)
  4000e8:	00001021 	move	v0,zero
  4000ec:	03e00008 	jr	ra
  4000f0:	27bd0018 	addiu	sp,sp,24
  4000f4:	3c040040 	lui	a0,0x40
  4000f8:	0c1001cb 	jal	40072c <warn>
  4000fc:	24841930 	addiu	a0,a0,6448
  400100:	8fbf0010 	lw	ra,16(sp)
  400104:	00001021 	move	v0,zero
  400108:	03e00008 	jr	ra
  40010c:	27bd0018 	addiu	sp,sp,24

00400110 <vprintf>:
  400110:	00803021 	move	a2,a0
  400114:	3c040040 	lui	a0,0x40
  400118:	00a03821 	move	a3,a1
  40011c:	24840128 	addiu	a0,a0,296
  400120:	08100295 	j	400a54 <__vprintf>
  400124:	00002821 	move	a1,zero

00400128 <__printf_send>:
  400128:	27bdffe0 	addiu	sp,sp,-32
  40012c:	afb20018 	sw	s2,24(sp)
  400130:	afb10014 	sw	s1,20(sp)
  400134:	afbf001c 	sw	ra,28(sp)
  400138:	afb00010 	sw	s0,16(sp)
  40013c:	00c09021 	move	s2,a2
  400140:	10c00008 	beqz	a2,400164 <__printf_send+0x3c>
  400144:	00a08821 	move	s1,a1
  400148:	00008021 	move	s0,zero
  40014c:	02301021 	addu	v0,s1,s0
  400150:	80440000 	lb	a0,0(v0)
  400154:	0c10006c 	jal	4001b0 <putchar>
  400158:	26100001 	addiu	s0,s0,1
  40015c:	1650fffc 	bne	s2,s0,400150 <__printf_send+0x28>
  400160:	02301021 	addu	v0,s1,s0
  400164:	8fbf001c 	lw	ra,28(sp)
  400168:	8fb20018 	lw	s2,24(sp)
  40016c:	8fb10014 	lw	s1,20(sp)
  400170:	8fb00010 	lw	s0,16(sp)
  400174:	03e00008 	jr	ra
  400178:	27bd0020 	addiu	sp,sp,32

0040017c <printf>:
  40017c:	27bdffe0 	addiu	sp,sp,-32
  400180:	27a20024 	addiu	v0,sp,36
  400184:	afa50024 	sw	a1,36(sp)
  400188:	00402821 	move	a1,v0
  40018c:	afbf0018 	sw	ra,24(sp)
  400190:	afa60028 	sw	a2,40(sp)
  400194:	afa7002c 	sw	a3,44(sp)
  400198:	0c100044 	jal	400110 <vprintf>
  40019c:	afa20010 	sw	v0,16(sp)
  4001a0:	8fbf0018 	lw	ra,24(sp)
  4001a4:	00000000 	nop
  4001a8:	03e00008 	jr	ra
  4001ac:	27bd0020 	addiu	sp,sp,32

004001b0 <putchar>:
  4001b0:	27bdffe0 	addiu	sp,sp,-32
  4001b4:	afb00018 	sw	s0,24(sp)
  4001b8:	27a50010 	addiu	a1,sp,16
  4001bc:	00808021 	move	s0,a0
  4001c0:	24060001 	li	a2,1
  4001c4:	24040001 	li	a0,1
  4001c8:	afbf001c 	sw	ra,28(sp)
  4001cc:	0c1000e3 	jal	40038c <write>
  4001d0:	a3b00010 	sb	s0,16(sp)
  4001d4:	18400005 	blez	v0,4001ec <putchar+0x3c>
  4001d8:	02001021 	move	v0,s0
  4001dc:	8fbf001c 	lw	ra,28(sp)
  4001e0:	8fb00018 	lw	s0,24(sp)
  4001e4:	03e00008 	jr	ra
  4001e8:	27bd0020 	addiu	sp,sp,32
  4001ec:	2410ffff 	li	s0,-1
  4001f0:	02001021 	move	v0,s0
  4001f4:	8fbf001c 	lw	ra,28(sp)
  4001f8:	8fb00018 	lw	s0,24(sp)
  4001fc:	03e00008 	jr	ra
  400200:	27bd0020 	addiu	sp,sp,32
	...

00400210 <__exit_hack>:
  400210:	27bdfff8 	addiu	sp,sp,-8
  400214:	24020001 	li	v0,1
  400218:	afa20000 	sw	v0,0(sp)
  40021c:	8fa20000 	lw	v0,0(sp)
  400220:	00000000 	nop
  400224:	1440fffd 	bnez	v0,40021c <__exit_hack+0xc>
  400228:	00000000 	nop
  40022c:	03e00008 	jr	ra
  400230:	27bd0008 	addiu	sp,sp,8

00400234 <exit>:
  400234:	27bdffe8 	addiu	sp,sp,-24
  400238:	afbf0010 	sw	ra,16(sp)
  40023c:	0c1000a3 	jal	40028c <_exit>
  400240:	00000000 	nop
	...

00400250 <__syscall>:
  400250:	0000000c 	syscall
  400254:	10e00005 	beqz	a3,40026c <__syscall+0x1c>
  400258:	00000000 	nop
  40025c:	3c011000 	lui	at,0x1000
  400260:	ac220014 	sw	v0,20(at)
  400264:	2403ffff 	li	v1,-1
  400268:	2402ffff 	li	v0,-1
  40026c:	03e00008 	jr	ra
  400270:	00000000 	nop

00400274 <fork>:
  400274:	08100094 	j	400250 <__syscall>
  400278:	24020000 	li	v0,0

0040027c <vfork>:
  40027c:	08100094 	j	400250 <__syscall>
  400280:	24020001 	li	v0,1

00400284 <execv>:
  400284:	08100094 	j	400250 <__syscall>
  400288:	24020002 	li	v0,2

0040028c <_exit>:
  40028c:	08100094 	j	400250 <__syscall>
  400290:	24020003 	li	v0,3

00400294 <waitpid>:
  400294:	08100094 	j	400250 <__syscall>
  400298:	24020004 	li	v0,4

0040029c <getpid>:
  40029c:	08100094 	j	400250 <__syscall>
  4002a0:	24020005 	li	v0,5

004002a4 <getppid>:
  4002a4:	08100094 	j	400250 <__syscall>
  4002a8:	24020006 	li	v0,6

004002ac <sbrk>:
  4002ac:	08100094 	j	400250 <__syscall>
  4002b0:	24020007 	li	v0,7

004002b4 <mmap>:
  4002b4:	08100094 	j	400250 <__syscall>
  4002b8:	24020008 	li	v0,8

004002bc <munmap>:
  4002bc:	08100094 	j	400250 <__syscall>
  4002c0:	24020009 	li	v0,9

004002c4 <mprotect>:
  4002c4:	08100094 	j	400250 <__syscall>
  4002c8:	2402000a 	li	v0,10

004002cc <umask>:
  4002cc:	08100094 	j	400250 <__syscall>
  4002d0:	24020011 	li	v0,17

004002d4 <issetugid>:
  4002d4:	08100094 	j	400250 <__syscall>
  4002d8:	24020012 	li	v0,18

004002dc <getresuid>:
  4002dc:	08100094 	j	400250 <__syscall>
  4002e0:	24020013 	li	v0,19

004002e4 <setresuid>:
  4002e4:	08100094 	j	400250 <__syscall>
  4002e8:	24020014 	li	v0,20

004002ec <getresgid>:
  4002ec:	08100094 	j	400250 <__syscall>
  4002f0:	24020015 	li	v0,21

004002f4 <setresgid>:
  4002f4:	08100094 	j	400250 <__syscall>
  4002f8:	24020016 	li	v0,22

004002fc <getgroups>:
  4002fc:	08100094 	j	400250 <__syscall>
  400300:	24020017 	li	v0,23

00400304 <setgroups>:
  400304:	08100094 	j	400250 <__syscall>
  400308:	24020018 	li	v0,24

0040030c <__getlogin>:
  40030c:	08100094 	j	400250 <__syscall>
  400310:	24020019 	li	v0,25

00400314 <__setlogin>:
  400314:	08100094 	j	400250 <__syscall>
  400318:	2402001a 	li	v0,26

0040031c <kill>:
  40031c:	08100094 	j	400250 <__syscall>
  400320:	2402001b 	li	v0,27

00400324 <sigaction>:
  400324:	08100094 	j	400250 <__syscall>
  400328:	2402001c 	li	v0,28

0040032c <sigpending>:
  40032c:	08100094 	j	400250 <__syscall>
  400330:	2402001d 	li	v0,29

00400334 <sigprocmask>:
  400334:	08100094 	j	400250 <__syscall>
  400338:	2402001e 	li	v0,30

0040033c <sigsuspend>:
  40033c:	08100094 	j	400250 <__syscall>
  400340:	2402001f 	li	v0,31

00400344 <sigreturn>:
  400344:	08100094 	j	400250 <__syscall>
  400348:	24020020 	li	v0,32

0040034c <open>:
  40034c:	08100094 	j	400250 <__syscall>
  400350:	2402002d 	li	v0,45

00400354 <pipe>:
  400354:	08100094 	j	400250 <__syscall>
  400358:	2402002e 	li	v0,46

0040035c <dup>:
  40035c:	08100094 	j	400250 <__syscall>
  400360:	2402002f 	li	v0,47

00400364 <dup2>:
  400364:	08100094 	j	400250 <__syscall>
  400368:	24020030 	li	v0,48

0040036c <close>:
  40036c:	08100094 	j	400250 <__syscall>
  400370:	24020031 	li	v0,49

00400374 <read>:
  400374:	08100094 	j	400250 <__syscall>
  400378:	24020032 	li	v0,50

0040037c <pread>:
  40037c:	08100094 	j	400250 <__syscall>
  400380:	24020033 	li	v0,51

00400384 <getdirentry>:
  400384:	08100094 	j	400250 <__syscall>
  400388:	24020036 	li	v0,54

0040038c <write>:
  40038c:	08100094 	j	400250 <__syscall>
  400390:	24020037 	li	v0,55

00400394 <pwrite>:
  400394:	08100094 	j	400250 <__syscall>
  400398:	24020038 	li	v0,56

0040039c <lseek>:
  40039c:	08100094 	j	400250 <__syscall>
  4003a0:	2402003b 	li	v0,59

004003a4 <flock>:
  4003a4:	08100094 	j	400250 <__syscall>
  4003a8:	2402003c 	li	v0,60

004003ac <ftruncate>:
  4003ac:	08100094 	j	400250 <__syscall>
  4003b0:	2402003d 	li	v0,61

004003b4 <fsync>:
  4003b4:	08100094 	j	400250 <__syscall>
  4003b8:	2402003e 	li	v0,62

004003bc <fcntl>:
  4003bc:	08100094 	j	400250 <__syscall>
  4003c0:	2402003f 	li	v0,63

004003c4 <ioctl>:
  4003c4:	08100094 	j	400250 <__syscall>
  4003c8:	24020040 	li	v0,64

004003cc <select>:
  4003cc:	08100094 	j	400250 <__syscall>
  4003d0:	24020041 	li	v0,65

004003d4 <poll>:
  4003d4:	08100094 	j	400250 <__syscall>
  4003d8:	24020042 	li	v0,66

004003dc <link>:
  4003dc:	08100094 	j	400250 <__syscall>
  4003e0:	24020043 	li	v0,67

004003e4 <remove>:
  4003e4:	08100094 	j	400250 <__syscall>
  4003e8:	24020044 	li	v0,68

004003ec <mkdir>:
  4003ec:	08100094 	j	400250 <__syscall>
  4003f0:	24020045 	li	v0,69

004003f4 <rmdir>:
  4003f4:	08100094 	j	400250 <__syscall>
  4003f8:	24020046 	li	v0,70

004003fc <mkfifo>:
  4003fc:	08100094 	j	400250 <__syscall>
  400400:	24020047 	li	v0,71

00400404 <rename>:
  400404:	08100094 	j	400250 <__syscall>
  400408:	24020048 	li	v0,72

0040040c <access>:
  40040c:	08100094 	j	400250 <__syscall>
  400410:	24020049 	li	v0,73

00400414 <chdir>:
  400414:	08100094 	j	400250 <__syscall>
  400418:	2402004a 	li	v0,74

0040041c <fchdir>:
  40041c:	08100094 	j	400250 <__syscall>
  400420:	2402004b 	li	v0,75

00400424 <__getcwd>:
  400424:	08100094 	j	400250 <__syscall>
  400428:	2402004c 	li	v0,76

0040042c <symlink>:
  40042c:	08100094 	j	400250 <__syscall>
  400430:	2402004d 	li	v0,77

00400434 <readlink>:
  400434:	08100094 	j	400250 <__syscall>
  400438:	2402004e 	li	v0,78

0040043c <mount>:
  40043c:	08100094 	j	400250 <__syscall>
  400440:	2402004f 	li	v0,79

00400444 <unmount>:
  400444:	08100094 	j	400250 <__syscall>
  400448:	24020050 	li	v0,80

0040044c <stat>:
  40044c:	08100094 	j	400250 <__syscall>
  400450:	24020051 	li	v0,81

00400454 <fstat>:
  400454:	08100094 	j	400250 <__syscall>
  400458:	24020052 	li	v0,82

0040045c <lstat>:
  40045c:	08100094 	j	400250 <__syscall>
  400460:	24020053 	li	v0,83

00400464 <utimes>:
  400464:	08100094 	j	400250 <__syscall>
  400468:	24020054 	li	v0,84

0040046c <futimes>:
  40046c:	08100094 	j	400250 <__syscall>
  400470:	24020055 	li	v0,85

00400474 <lutimes>:
  400474:	08100094 	j	400250 <__syscall>
  400478:	24020056 	li	v0,86

0040047c <chmod>:
  40047c:	08100094 	j	400250 <__syscall>
  400480:	24020057 	li	v0,87

00400484 <chown>:
  400484:	08100094 	j	400250 <__syscall>
  400488:	24020058 	li	v0,88

0040048c <fchmod>:
  40048c:	08100094 	j	400250 <__syscall>
  400490:	24020059 	li	v0,89

00400494 <fchown>:
  400494:	08100094 	j	400250 <__syscall>
  400498:	2402005a 	li	v0,90

0040049c <lchmod>:
  40049c:	08100094 	j	400250 <__syscall>
  4004a0:	2402005b 	li	v0,91

004004a4 <lchown>:
  4004a4:	08100094 	j	400250 <__syscall>
  4004a8:	2402005c 	li	v0,92

004004ac <socket>:
  4004ac:	08100094 	j	400250 <__syscall>
  4004b0:	24020062 	li	v0,98

004004b4 <bind>:
  4004b4:	08100094 	j	400250 <__syscall>
  4004b8:	24020063 	li	v0,99

004004bc <connect>:
  4004bc:	08100094 	j	400250 <__syscall>
  4004c0:	24020064 	li	v0,100

004004c4 <listen>:
  4004c4:	08100094 	j	400250 <__syscall>
  4004c8:	24020065 	li	v0,101

004004cc <accept>:
  4004cc:	08100094 	j	400250 <__syscall>
  4004d0:	24020066 	li	v0,102

004004d4 <shutdown>:
  4004d4:	08100094 	j	400250 <__syscall>
  4004d8:	24020068 	li	v0,104

004004dc <getsockname>:
  4004dc:	08100094 	j	400250 <__syscall>
  4004e0:	24020069 	li	v0,105

004004e4 <getpeername>:
  4004e4:	08100094 	j	400250 <__syscall>
  4004e8:	2402006a 	li	v0,106

004004ec <getsockopt>:
  4004ec:	08100094 	j	400250 <__syscall>
  4004f0:	2402006b 	li	v0,107

004004f4 <setsockopt>:
  4004f4:	08100094 	j	400250 <__syscall>
  4004f8:	2402006c 	li	v0,108

004004fc <__time>:
  4004fc:	08100094 	j	400250 <__syscall>
  400500:	24020071 	li	v0,113

00400504 <__settime>:
  400504:	08100094 	j	400250 <__syscall>
  400508:	24020072 	li	v0,114

0040050c <nanosleep>:
  40050c:	08100094 	j	400250 <__syscall>
  400510:	24020073 	li	v0,115

00400514 <sync>:
  400514:	08100094 	j	400250 <__syscall>
  400518:	24020076 	li	v0,118

0040051c <reboot>:
  40051c:	08100094 	j	400250 <__syscall>
  400520:	24020077 	li	v0,119
	...

00400530 <__senderr>:
  400530:	081000e3 	j	40038c <write>
  400534:	24040002 	li	a0,2

00400538 <__senderrstr>:
  400538:	27bdffe8 	addiu	sp,sp,-24
  40053c:	afbf0014 	sw	ra,20(sp)
  400540:	afb00010 	sw	s0,16(sp)
  400544:	0c100404 	jal	401010 <strlen>
  400548:	00808021 	move	s0,a0
  40054c:	00403021 	move	a2,v0
  400550:	02002821 	move	a1,s0
  400554:	8fbf0014 	lw	ra,20(sp)
  400558:	8fb00010 	lw	s0,16(sp)
  40055c:	00002021 	move	a0,zero
  400560:	0810014c 	j	400530 <__senderr>
  400564:	27bd0018 	addiu	sp,sp,24

00400568 <__printerr>:
  400568:	27bdffd8 	addiu	sp,sp,-40
  40056c:	afb40020 	sw	s4,32(sp)
  400570:	afb3001c 	sw	s3,28(sp)
  400574:	afb20018 	sw	s2,24(sp)
  400578:	afb10014 	sw	s1,20(sp)
  40057c:	afbf0024 	sw	ra,36(sp)
  400580:	afb00010 	sw	s0,16(sp)
  400584:	3c021000 	lui	v0,0x1000
  400588:	00809821 	move	s3,a0
  40058c:	8c440014 	lw	a0,20(v0)
  400590:	00a08821 	move	s1,a1
  400594:	0c1003f8 	jal	400fe0 <strerror>
  400598:	00c09021 	move	s2,a2
  40059c:	0040a021 	move	s4,v0
  4005a0:	3c021000 	lui	v0,0x1000
  4005a4:	8c420018 	lw	v0,24(v0)
  4005a8:	00000000 	nop
  4005ac:	1040001f 	beqz	v0,40062c <__printerr+0xc4>
  4005b0:	00000000 	nop
  4005b4:	8c420000 	lw	v0,0(v0)
  4005b8:	00000000 	nop
  4005bc:	1040001b 	beqz	v0,40062c <__printerr+0xc4>
  4005c0:	00402021 	move	a0,v0
  4005c4:	0c10014e 	jal	400538 <__senderrstr>
  4005c8:	3c100040 	lui	s0,0x40
  4005cc:	0c10014e 	jal	400538 <__senderrstr>
  4005d0:	26041968 	addiu	a0,s0,6504
  4005d4:	3c040040 	lui	a0,0x40
  4005d8:	24840530 	addiu	a0,a0,1328
  4005dc:	02203021 	move	a2,s1
  4005e0:	02403821 	move	a3,s2
  4005e4:	0c100295 	jal	400a54 <__vprintf>
  4005e8:	00002821 	move	a1,zero
  4005ec:	12600005 	beqz	s3,400604 <__printerr+0x9c>
  4005f0:	26041968 	addiu	a0,s0,6504
  4005f4:	0c10014e 	jal	400538 <__senderrstr>
  4005f8:	00000000 	nop
  4005fc:	0c10014e 	jal	400538 <__senderrstr>
  400600:	02802021 	move	a0,s4
  400604:	3c040040 	lui	a0,0x40
  400608:	8fbf0024 	lw	ra,36(sp)
  40060c:	8fb40020 	lw	s4,32(sp)
  400610:	8fb3001c 	lw	s3,28(sp)
  400614:	8fb20018 	lw	s2,24(sp)
  400618:	8fb10014 	lw	s1,20(sp)
  40061c:	8fb00010 	lw	s0,16(sp)
  400620:	2484196c 	addiu	a0,a0,6508
  400624:	0810014e 	j	400538 <__senderrstr>
  400628:	27bd0028 	addiu	sp,sp,40
  40062c:	3c020040 	lui	v0,0x40
  400630:	08100171 	j	4005c4 <__printerr+0x5c>
  400634:	24441950 	addiu	a0,v0,6480

00400638 <verrx>:
  400638:	27bdffe8 	addiu	sp,sp,-24
  40063c:	afb00010 	sw	s0,16(sp)
  400640:	00808021 	move	s0,a0
  400644:	afbf0014 	sw	ra,20(sp)
  400648:	0c10015a 	jal	400568 <__printerr>
  40064c:	00002021 	move	a0,zero
  400650:	0c10008d 	jal	400234 <exit>
  400654:	02002021 	move	a0,s0

00400658 <errx>:
  400658:	27bdffe0 	addiu	sp,sp,-32
  40065c:	27a20028 	addiu	v0,sp,40
  400660:	afa60028 	sw	a2,40(sp)
  400664:	00403021 	move	a2,v0
  400668:	afbf0018 	sw	ra,24(sp)
  40066c:	afa7002c 	sw	a3,44(sp)
  400670:	0c10018e 	jal	400638 <verrx>
  400674:	afa20010 	sw	v0,16(sp)
  400678:	8fbf0018 	lw	ra,24(sp)
  40067c:	00000000 	nop
  400680:	03e00008 	jr	ra
  400684:	27bd0020 	addiu	sp,sp,32

00400688 <verr>:
  400688:	27bdffe8 	addiu	sp,sp,-24
  40068c:	afb00010 	sw	s0,16(sp)
  400690:	00808021 	move	s0,a0
  400694:	afbf0014 	sw	ra,20(sp)
  400698:	0c10015a 	jal	400568 <__printerr>
  40069c:	24040001 	li	a0,1
  4006a0:	0c10008d 	jal	400234 <exit>
  4006a4:	02002021 	move	a0,s0

004006a8 <err>:
  4006a8:	27bdffe0 	addiu	sp,sp,-32
  4006ac:	27a20028 	addiu	v0,sp,40
  4006b0:	afa60028 	sw	a2,40(sp)
  4006b4:	00403021 	move	a2,v0
  4006b8:	afbf0018 	sw	ra,24(sp)
  4006bc:	afa7002c 	sw	a3,44(sp)
  4006c0:	0c1001a2 	jal	400688 <verr>
  4006c4:	afa20010 	sw	v0,16(sp)
  4006c8:	8fbf0018 	lw	ra,24(sp)
  4006cc:	00000000 	nop
  4006d0:	03e00008 	jr	ra
  4006d4:	27bd0020 	addiu	sp,sp,32

004006d8 <vwarnx>:
  4006d8:	00a03021 	move	a2,a1
  4006dc:	00802821 	move	a1,a0
  4006e0:	0810015a 	j	400568 <__printerr>
  4006e4:	00002021 	move	a0,zero

004006e8 <warnx>:
  4006e8:	27bdffe0 	addiu	sp,sp,-32
  4006ec:	27a20024 	addiu	v0,sp,36
  4006f0:	afa50024 	sw	a1,36(sp)
  4006f4:	00402821 	move	a1,v0
  4006f8:	afbf0018 	sw	ra,24(sp)
  4006fc:	afa60028 	sw	a2,40(sp)
  400700:	afa7002c 	sw	a3,44(sp)
  400704:	0c1001b6 	jal	4006d8 <vwarnx>
  400708:	afa20010 	sw	v0,16(sp)
  40070c:	8fbf0018 	lw	ra,24(sp)
  400710:	00000000 	nop
  400714:	03e00008 	jr	ra
  400718:	27bd0020 	addiu	sp,sp,32

0040071c <vwarn>:
  40071c:	00a03021 	move	a2,a1
  400720:	00802821 	move	a1,a0
  400724:	0810015a 	j	400568 <__printerr>
  400728:	24040001 	li	a0,1

0040072c <warn>:
  40072c:	27bdffe0 	addiu	sp,sp,-32
  400730:	27a20024 	addiu	v0,sp,36
  400734:	afa50024 	sw	a1,36(sp)
  400738:	00402821 	move	a1,v0
  40073c:	afbf0018 	sw	ra,24(sp)
  400740:	afa60028 	sw	a2,40(sp)
  400744:	afa7002c 	sw	a3,44(sp)
  400748:	0c1001c7 	jal	40071c <vwarn>
  40074c:	afa20010 	sw	v0,16(sp)
  400750:	8fbf0018 	lw	ra,24(sp)
  400754:	00000000 	nop
  400758:	03e00008 	jr	ra
  40075c:	27bd0020 	addiu	sp,sp,32

00400760 <__pf_print>:
  400760:	27bdffe0 	addiu	sp,sp,-32
  400764:	afbf0018 	sw	ra,24(sp)
  400768:	afb10014 	sw	s1,20(sp)
  40076c:	afb00010 	sw	s0,16(sp)
  400770:	8c830000 	lw	v1,0(a0)
  400774:	00808021 	move	s0,a0
  400778:	8c840004 	lw	a0,4(a0)
  40077c:	0060f809 	jalr	v1
  400780:	00c08821 	move	s1,a2
  400784:	8e02000c 	lw	v0,12(s0)
  400788:	00000000 	nop
  40078c:	00511021 	addu	v0,v0,s1
  400790:	ae02000c 	sw	v0,12(s0)
  400794:	8fbf0018 	lw	ra,24(sp)
  400798:	8fb10014 	lw	s1,20(sp)
  40079c:	8fb00010 	lw	s0,16(sp)
  4007a0:	03e00008 	jr	ra
  4007a4:	27bd0020 	addiu	sp,sp,32

004007a8 <__pf_endfield>:
  4007a8:	24020020 	li	v0,32
  4007ac:	ac82002c 	sw	v0,44(a0)
  4007b0:	00001821 	move	v1,zero
  4007b4:	00001021 	move	v0,zero
  4007b8:	ac800038 	sw	zero,56(a0)
  4007bc:	ac800010 	sw	zero,16(a0)
  4007c0:	ac800014 	sw	zero,20(a0)
  4007c4:	ac83001c 	sw	v1,28(a0)
  4007c8:	ac820018 	sw	v0,24(a0)
  4007cc:	ac800020 	sw	zero,32(a0)
  4007d0:	ac800024 	sw	zero,36(a0)
  4007d4:	ac800028 	sw	zero,40(a0)
  4007d8:	ac800030 	sw	zero,48(a0)
  4007dc:	03e00008 	jr	ra
  4007e0:	ac800034 	sw	zero,52(a0)

004007e4 <__pf_fill>:
  4007e4:	27bdffd0 	addiu	sp,sp,-48
  4007e8:	afb30024 	sw	s3,36(sp)
  4007ec:	afb20020 	sw	s2,32(sp)
  4007f0:	afbf0028 	sw	ra,40(sp)
  4007f4:	afb1001c 	sw	s1,28(sp)
  4007f8:	afb00018 	sw	s0,24(sp)
  4007fc:	00809821 	move	s3,a0
  400800:	8c82002c 	lw	v0,44(a0)
  400804:	18a0000b 	blez	a1,400834 <__pf_fill+0x50>
  400808:	00a09021 	move	s2,a1
  40080c:	a3a20010 	sb	v0,16(sp)
  400810:	00008021 	move	s0,zero
  400814:	27b10010 	addiu	s1,sp,16
  400818:	26100001 	addiu	s0,s0,1
  40081c:	02602021 	move	a0,s3
  400820:	02202821 	move	a1,s1
  400824:	0c1001d8 	jal	400760 <__pf_print>
  400828:	24060001 	li	a2,1
  40082c:	1650fffb 	bne	s2,s0,40081c <__pf_fill+0x38>
  400830:	26100001 	addiu	s0,s0,1
  400834:	8fbf0028 	lw	ra,40(sp)
  400838:	8fb30024 	lw	s3,36(sp)
  40083c:	8fb20020 	lw	s2,32(sp)
  400840:	8fb1001c 	lw	s1,28(sp)
  400844:	8fb00018 	lw	s0,24(sp)
  400848:	03e00008 	jr	ra
  40084c:	27bd0030 	addiu	sp,sp,48

00400850 <__pf_printstuff>:
  400850:	27bdffd0 	addiu	sp,sp,-48
  400854:	afbf0028 	sw	ra,40(sp)
  400858:	afb50024 	sw	s5,36(sp)
  40085c:	afb40020 	sw	s4,32(sp)
  400860:	afb3001c 	sw	s3,28(sp)
  400864:	afb20018 	sw	s2,24(sp)
  400868:	00c09821 	move	s3,a2
  40086c:	afb10014 	sw	s1,20(sp)
  400870:	afb00010 	sw	s0,16(sp)
  400874:	00808821 	move	s1,a0
  400878:	00a02021 	move	a0,a1
  40087c:	00a0a021 	move	s4,a1
  400880:	0c100404 	jal	401010 <strlen>
  400884:	00e0a821 	move	s5,a3
  400888:	02602021 	move	a0,s3
  40088c:	0c100404 	jal	401010 <strlen>
  400890:	00409021 	move	s2,v0
  400894:	02a02021 	move	a0,s5
  400898:	0c100404 	jal	401010 <strlen>
  40089c:	02428021 	addu	s0,s2,v0
  4008a0:	8e230024 	lw	v1,36(s1)
  4008a4:	02022821 	addu	a1,s0,v0
  4008a8:	00a3102a 	slt	v0,a1,v1
  4008ac:	10400040 	beqz	v0,4009b0 <__pf_printstuff+0x160>
  4008b0:	00658023 	subu	s0,v1,a1
  4008b4:	1a000056 	blez	s0,400a10 <__pf_printstuff+0x1c0>
  4008b8:	02403021 	move	a2,s2
  4008bc:	8e220028 	lw	v0,40(s1)
  4008c0:	00000000 	nop
  4008c4:	10400028 	beqz	v0,400968 <__pf_printstuff+0x118>
  4008c8:	24020030 	li	v0,48
  4008cc:	0c100404 	jal	401010 <strlen>
  4008d0:	02802021 	move	a0,s4
  4008d4:	00403021 	move	a2,v0
  4008d8:	02802821 	move	a1,s4
  4008dc:	0c1001d8 	jal	400760 <__pf_print>
  4008e0:	02202021 	move	a0,s1
  4008e4:	0c100404 	jal	401010 <strlen>
  4008e8:	02602021 	move	a0,s3
  4008ec:	00403021 	move	a2,v0
  4008f0:	02202021 	move	a0,s1
  4008f4:	0c1001d8 	jal	400760 <__pf_print>
  4008f8:	02602821 	move	a1,s3
  4008fc:	8e220028 	lw	v0,40(s1)
  400900:	00000000 	nop
  400904:	14400005 	bnez	v0,40091c <__pf_printstuff+0xcc>
  400908:	24020030 	li	v0,48
  40090c:	8e23002c 	lw	v1,44(s1)
  400910:	00000000 	nop
  400914:	1062004b 	beq	v1,v0,400a44 <__pf_printstuff+0x1f4>
  400918:	02202021 	move	a0,s1
  40091c:	0c100404 	jal	401010 <strlen>
  400920:	02a02021 	move	a0,s5
  400924:	00403021 	move	a2,v0
  400928:	02202021 	move	a0,s1
  40092c:	0c1001d8 	jal	400760 <__pf_print>
  400930:	02a02821 	move	a1,s5
  400934:	8e220028 	lw	v0,40(s1)
  400938:	00000000 	nop
  40093c:	14400012 	bnez	v0,400988 <__pf_printstuff+0x138>
  400940:	02202021 	move	a0,s1
  400944:	8fbf0028 	lw	ra,40(sp)
  400948:	8fb50024 	lw	s5,36(sp)
  40094c:	8fb40020 	lw	s4,32(sp)
  400950:	8fb3001c 	lw	s3,28(sp)
  400954:	8fb20018 	lw	s2,24(sp)
  400958:	8fb10014 	lw	s1,20(sp)
  40095c:	8fb00010 	lw	s0,16(sp)
  400960:	03e00008 	jr	ra
  400964:	27bd0030 	addiu	sp,sp,48
  400968:	8e23002c 	lw	v1,44(s1)
  40096c:	00000000 	nop
  400970:	1062ffd6 	beq	v1,v0,4008cc <__pf_printstuff+0x7c>
  400974:	02202021 	move	a0,s1
  400978:	0c1001f9 	jal	4007e4 <__pf_fill>
  40097c:	02002821 	move	a1,s0
  400980:	08100233 	j	4008cc <__pf_printstuff+0x7c>
  400984:	00000000 	nop
  400988:	02002821 	move	a1,s0
  40098c:	8fbf0028 	lw	ra,40(sp)
  400990:	8fb50024 	lw	s5,36(sp)
  400994:	8fb40020 	lw	s4,32(sp)
  400998:	8fb3001c 	lw	s3,28(sp)
  40099c:	8fb20018 	lw	s2,24(sp)
  4009a0:	8fb10014 	lw	s1,20(sp)
  4009a4:	8fb00010 	lw	s0,16(sp)
  4009a8:	081001f9 	j	4007e4 <__pf_fill>
  4009ac:	27bd0030 	addiu	sp,sp,48
  4009b0:	02802821 	move	a1,s4
  4009b4:	02403021 	move	a2,s2
  4009b8:	0c1001d8 	jal	400760 <__pf_print>
  4009bc:	02202021 	move	a0,s1
  4009c0:	0c100404 	jal	401010 <strlen>
  4009c4:	02602021 	move	a0,s3
  4009c8:	00403021 	move	a2,v0
  4009cc:	02202021 	move	a0,s1
  4009d0:	0c1001d8 	jal	400760 <__pf_print>
  4009d4:	02602821 	move	a1,s3
  4009d8:	0c100404 	jal	401010 <strlen>
  4009dc:	02a02021 	move	a0,s5
  4009e0:	02202021 	move	a0,s1
  4009e4:	02a02821 	move	a1,s5
  4009e8:	8fbf0028 	lw	ra,40(sp)
  4009ec:	8fb50024 	lw	s5,36(sp)
  4009f0:	8fb40020 	lw	s4,32(sp)
  4009f4:	8fb3001c 	lw	s3,28(sp)
  4009f8:	8fb20018 	lw	s2,24(sp)
  4009fc:	8fb10014 	lw	s1,20(sp)
  400a00:	8fb00010 	lw	s0,16(sp)
  400a04:	00403021 	move	a2,v0
  400a08:	081001d8 	j	400760 <__pf_print>
  400a0c:	27bd0030 	addiu	sp,sp,48
  400a10:	02802821 	move	a1,s4
  400a14:	0c1001d8 	jal	400760 <__pf_print>
  400a18:	02202021 	move	a0,s1
  400a1c:	0c100404 	jal	401010 <strlen>
  400a20:	02602021 	move	a0,s3
  400a24:	00403021 	move	a2,v0
  400a28:	02202021 	move	a0,s1
  400a2c:	0c1001d8 	jal	400760 <__pf_print>
  400a30:	02602821 	move	a1,s3
  400a34:	0c100404 	jal	401010 <strlen>
  400a38:	02a02021 	move	a0,s5
  400a3c:	08100279 	j	4009e4 <__pf_printstuff+0x194>
  400a40:	02202021 	move	a0,s1
  400a44:	0c1001f9 	jal	4007e4 <__pf_fill>
  400a48:	02002821 	move	a1,s0
  400a4c:	08100247 	j	40091c <__pf_printstuff+0xcc>
  400a50:	00000000 	nop

00400a54 <__vprintf>:
  400a54:	27bdff68 	addiu	sp,sp,-152
  400a58:	afbe0090 	sw	s8,144(sp)
  400a5c:	27be0030 	addiu	s8,sp,48
  400a60:	afb10074 	sw	s1,116(sp)
  400a64:	afa40030 	sw	a0,48(sp)
  400a68:	00c08821 	move	s1,a2
  400a6c:	03c02021 	move	a0,s8
  400a70:	afb00070 	sw	s0,112(sp)
  400a74:	afbf0094 	sw	ra,148(sp)
  400a78:	afb7008c 	sw	s7,140(sp)
  400a7c:	afb60088 	sw	s6,136(sp)
  400a80:	afb50084 	sw	s5,132(sp)
  400a84:	afb40080 	sw	s4,128(sp)
  400a88:	afb3007c 	sw	s3,124(sp)
  400a8c:	afb20078 	sw	s2,120(sp)
  400a90:	afa50034 	sw	a1,52(sp)
  400a94:	afa70038 	sw	a3,56(sp)
  400a98:	0c1001ea 	jal	4007a8 <__pf_endfield>
  400a9c:	afa0003c 	sw	zero,60(sp)
  400aa0:	82300000 	lb	s0,0(s1)
  400aa4:	00000000 	nop
  400aa8:	12000017 	beqz	s0,400b08 <__vprintf+0xb4>
  400aac:	0220a021 	move	s4,s1
  400ab0:	081002b6 	j	400ad8 <__vprintf+0x84>
  400ab4:	00000000 	nop
  400ab8:	27a50010 	addiu	a1,sp,16
  400abc:	24060001 	li	a2,1
  400ac0:	0c1001d8 	jal	400760 <__pf_print>
  400ac4:	a3b00010 	sb	s0,16(sp)
  400ac8:	82900001 	lb	s0,1(s4)
  400acc:	00000000 	nop
  400ad0:	1200000d 	beqz	s0,400b08 <__vprintf+0xb4>
  400ad4:	26940001 	addiu	s4,s4,1
  400ad8:	8fa20040 	lw	v0,64(sp)
  400adc:	00000000 	nop
  400ae0:	14400016 	bnez	v0,400b3c <__vprintf+0xe8>
  400ae4:	24020025 	li	v0,37
  400ae8:	1602fff3 	bne	s0,v0,400ab8 <__vprintf+0x64>
  400aec:	03c02021 	move	a0,s8
  400af0:	24020001 	li	v0,1
  400af4:	afa20040 	sw	v0,64(sp)
  400af8:	82900001 	lb	s0,1(s4)
  400afc:	00000000 	nop
  400b00:	1600fff5 	bnez	s0,400ad8 <__vprintf+0x84>
  400b04:	26940001 	addiu	s4,s4,1
  400b08:	8fa2003c 	lw	v0,60(sp)
  400b0c:	8fbf0094 	lw	ra,148(sp)
  400b10:	8fbe0090 	lw	s8,144(sp)
  400b14:	8fb7008c 	lw	s7,140(sp)
  400b18:	8fb60088 	lw	s6,136(sp)
  400b1c:	8fb50084 	lw	s5,132(sp)
  400b20:	8fb40080 	lw	s4,128(sp)
  400b24:	8fb3007c 	lw	s3,124(sp)
  400b28:	8fb20078 	lw	s2,120(sp)
  400b2c:	8fb10074 	lw	s1,116(sp)
  400b30:	8fb00070 	lw	s0,112(sp)
  400b34:	03e00008 	jr	ra
  400b38:	27bd0098 	addiu	sp,sp,152
  400b3c:	3c040040 	lui	a0,0x40
  400b40:	2484197c 	addiu	a0,a0,6524
  400b44:	0c1003e0 	jal	400f80 <strchr>
  400b48:	02002821 	move	a1,s0
  400b4c:	10400031 	beqz	v0,400c14 <__vprintf+0x1c0>
  400b50:	24020030 	li	v0,48
  400b54:	1202001d 	beq	s0,v0,400bcc <__vprintf+0x178>
  400b58:	2a020031 	slti	v0,s0,49
  400b5c:	10400013 	beqz	v0,400bac <__vprintf+0x158>
  400b60:	2402006c 	li	v0,108
  400b64:	24020023 	li	v0,35
  400b68:	12020027 	beq	s0,v0,400c08 <__vprintf+0x1b4>
  400b6c:	2402002d 	li	v0,45
  400b70:	1202004a 	beq	s0,v0,400c9c <__vprintf+0x248>
  400b74:	24020001 	li	v0,1
  400b78:	2602ffcf 	addiu	v0,s0,-49
  400b7c:	2c420009 	sltiu	v0,v0,9
  400b80:	1040001a 	beqz	v0,400bec <__vprintf+0x198>
  400b84:	3c040040 	lui	a0,0x40
  400b88:	8fa20054 	lw	v0,84(sp)
  400b8c:	00000000 	nop
  400b90:	000218c0 	sll	v1,v0,0x3
  400b94:	00021040 	sll	v0,v0,0x1
  400b98:	00431021 	addu	v0,v0,v1
  400b9c:	02021021 	addu	v0,s0,v0
  400ba0:	2442ffd0 	addiu	v0,v0,-48
  400ba4:	081002b2 	j	400ac8 <__vprintf+0x74>
  400ba8:	afa20054 	sw	v0,84(sp)
  400bac:	1602fff3 	bne	s0,v0,400b7c <__vprintf+0x128>
  400bb0:	2602ffcf 	addiu	v0,s0,-49
  400bb4:	8fa20044 	lw	v0,68(sp)
  400bb8:	24030001 	li	v1,1
  400bbc:	10430039 	beq	v0,v1,400ca4 <__vprintf+0x250>
  400bc0:	24020002 	li	v0,2
  400bc4:	081002b2 	j	400ac8 <__vprintf+0x74>
  400bc8:	afa30044 	sw	v1,68(sp)
  400bcc:	8fa20054 	lw	v0,84(sp)
  400bd0:	00000000 	nop
  400bd4:	1840008c 	blez	v0,400e08 <__vprintf+0x3b4>
  400bd8:	000218c0 	sll	v1,v0,0x3
  400bdc:	00021040 	sll	v0,v0,0x1
  400be0:	00431021 	addu	v0,v0,v1
  400be4:	081002b2 	j	400ac8 <__vprintf+0x74>
  400be8:	afa20054 	sw	v0,84(sp)
  400bec:	3c060040 	lui	a2,0x40
  400bf0:	2484198c 	addiu	a0,a0,6540
  400bf4:	24c619b4 	addiu	a2,a2,6580
  400bf8:	0c100428 	jal	4010a0 <__bad_assert>
  400bfc:	240500dc 	li	a1,220
  400c00:	081002e2 	j	400b88 <__vprintf+0x134>
  400c04:	00000000 	nop
  400c08:	24020001 	li	v0,1
  400c0c:	081002b2 	j	400ac8 <__vprintf+0x74>
  400c10:	afa20068 	sw	v0,104(sp)
  400c14:	3c040040 	lui	a0,0x40
  400c18:	248419c8 	addiu	a0,a0,6600
  400c1c:	0c1003e0 	jal	400f80 <strchr>
  400c20:	02002821 	move	a1,s0
  400c24:	10400091 	beqz	v0,400e6c <__vprintf+0x418>
  400c28:	24020070 	li	v0,112
  400c2c:	1202001f 	beq	s0,v0,400cac <__vprintf+0x258>
  400c30:	24020064 	li	v0,100
  400c34:	1202009e 	beq	s0,v0,400eb0 <__vprintf+0x45c>
  400c38:	24020001 	li	v0,1
  400c3c:	8fa30044 	lw	v1,68(sp)
  400c40:	00000000 	nop
  400c44:	10620003 	beq	v1,v0,400c54 <__vprintf+0x200>
  400c48:	00000000 	nop
  400c4c:	14600074 	bnez	v1,400e20 <__vprintf+0x3cc>
  400c50:	24020002 	li	v0,2
  400c54:	8fa20038 	lw	v0,56(sp)
  400c58:	afa00048 	sw	zero,72(sp)
  400c5c:	8c430000 	lw	v1,0(v0)
  400c60:	24420004 	addiu	v0,v0,4
  400c64:	afa20038 	sw	v0,56(sp)
  400c68:	afa3004c 	sw	v1,76(sp)
  400c6c:	2602ff9c 	addiu	v0,s0,-100
  400c70:	304200ff 	andi	v0,v0,0xff
  400c74:	2c430015 	sltiu	v1,v0,21
  400c78:	10600015 	beqz	v1,400cd0 <__vprintf+0x27c>
  400c7c:	3c030040 	lui	v1,0x40
  400c80:	00021080 	sll	v0,v0,0x2
  400c84:	246317c0 	addiu	v1,v1,6080
  400c88:	00431021 	addu	v0,v0,v1
  400c8c:	8c440000 	lw	a0,0(v0)
  400c90:	00000000 	nop
  400c94:	00800008 	jr	a0
  400c98:	00000000 	nop
  400c9c:	081002b2 	j	400ac8 <__vprintf+0x74>
  400ca0:	afa20058 	sw	v0,88(sp)
  400ca4:	081002b2 	j	400ac8 <__vprintf+0x74>
  400ca8:	afa20044 	sw	v0,68(sp)
  400cac:	8fa20038 	lw	v0,56(sp)
  400cb0:	afa00048 	sw	zero,72(sp)
  400cb4:	24430004 	addiu	v1,v0,4
  400cb8:	afa30038 	sw	v1,56(sp)
  400cbc:	8c440000 	lw	a0,0(v0)
  400cc0:	00000000 	nop
  400cc4:	afa4004c 	sw	a0,76(sp)
  400cc8:	24020010 	li	v0,16
  400ccc:	afa20060 	sw	v0,96(sp)
  400cd0:	8fa20068 	lw	v0,104(sp)
  400cd4:	00000000 	nop
  400cd8:	1440004d 	bnez	v0,400e10 <__vprintf+0x3bc>
  400cdc:	24020001 	li	v0,1
  400ce0:	24020070 	li	v0,112
  400ce4:	1202004a 	beq	s0,v0,400e10 <__vprintf+0x3bc>
  400ce8:	24020001 	li	v0,1
  400cec:	8fb60060 	lw	s6,96(sp)
  400cf0:	3c020040 	lui	v0,0x40
  400cf4:	8fb1004c 	lw	s1,76(sp)
  400cf8:	8fb00048 	lw	s0,72(sp)
  400cfc:	a3a00029 	sb	zero,41(sp)
  400d00:	245719d0 	addiu	s7,v0,6608
  400d04:	27b50028 	addiu	s5,sp,40
  400d08:	02c09821 	move	s3,s6
  400d0c:	001697c3 	sra	s2,s6,0x1f
  400d10:	02202821 	move	a1,s1
  400d14:	02002021 	move	a0,s0
  400d18:	02603821 	move	a3,s3
  400d1c:	0c10041c 	jal	401070 <__umoddi3>
  400d20:	02403021 	move	a2,s2
  400d24:	02e31821 	addu	v1,s7,v1
  400d28:	90620000 	lbu	v0,0(v1)
  400d2c:	02202821 	move	a1,s1
  400d30:	02002021 	move	a0,s0
  400d34:	02603821 	move	a3,s3
  400d38:	02403021 	move	a2,s2
  400d3c:	0c100414 	jal	401050 <__udivdi3>
  400d40:	a2a20000 	sb	v0,0(s5)
  400d44:	00408021 	move	s0,v0
  400d48:	02031025 	or	v0,s0,v1
  400d4c:	00608821 	move	s1,v1
  400d50:	1440ffef 	bnez	v0,400d10 <__vprintf+0x2bc>
  400d54:	26b5ffff 	addiu	s5,s5,-1
  400d58:	8fa20064 	lw	v0,100(sp)
  400d5c:	00000000 	nop
  400d60:	10400006 	beqz	v0,400d7c <__vprintf+0x328>
  400d64:	3c020040 	lui	v0,0x40
  400d68:	24020010 	li	v0,16
  400d6c:	12c2005e 	beq	s6,v0,400ee8 <__vprintf+0x494>
  400d70:	24020008 	li	v0,8
  400d74:	12c20037 	beq	s6,v0,400e54 <__vprintf+0x400>
  400d78:	3c020040 	lui	v0,0x40
  400d7c:	24461a98 	addiu	a2,v0,6808
  400d80:	8fa20050 	lw	v0,80(sp)
  400d84:	00000000 	nop
  400d88:	10400023 	beqz	v0,400e18 <__vprintf+0x3c4>
  400d8c:	3c020040 	lui	v0,0x40
  400d90:	3c020040 	lui	v0,0x40
  400d94:	24451970 	addiu	a1,v0,6512
  400d98:	03c02021 	move	a0,s8
  400d9c:	0c100214 	jal	400850 <__pf_printstuff>
  400da0:	26a70001 	addiu	a3,s5,1
  400da4:	0c1001ea 	jal	4007a8 <__pf_endfield>
  400da8:	03c02021 	move	a0,s8
  400dac:	081002b2 	j	400ac8 <__vprintf+0x74>
  400db0:	00000000 	nop
  400db4:	8fa20038 	lw	v0,56(sp)
  400db8:	2403fff8 	li	v1,-8
  400dbc:	24420007 	addiu	v0,v0,7
  400dc0:	00431024 	and	v0,v0,v1
  400dc4:	8c470004 	lw	a3,4(v0)
  400dc8:	8c460000 	lw	a2,0(v0)
  400dcc:	24420008 	addiu	v0,v0,8
  400dd0:	afa20038 	sw	v0,56(sp)
  400dd4:	04c10040 	bgez	a2,400ed8 <__vprintf+0x484>
  400dd8:	2402000a 	li	v0,10
  400ddc:	00071823 	negu	v1,a3
  400de0:	0003282b 	sltu	a1,zero,v1
  400de4:	00061023 	negu	v0,a2
  400de8:	00451023 	subu	v0,v0,a1
  400dec:	2404ffff 	li	a0,-1
  400df0:	afa40050 	sw	a0,80(sp)
  400df4:	afa3004c 	sw	v1,76(sp)
  400df8:	afa20048 	sw	v0,72(sp)
  400dfc:	2402000a 	li	v0,10
  400e00:	08100334 	j	400cd0 <__vprintf+0x27c>
  400e04:	afa20060 	sw	v0,96(sp)
  400e08:	081002b2 	j	400ac8 <__vprintf+0x74>
  400e0c:	afb0005c 	sw	s0,92(sp)
  400e10:	0810033b 	j	400cec <__vprintf+0x298>
  400e14:	afa20064 	sw	v0,100(sp)
  400e18:	08100366 	j	400d98 <__vprintf+0x344>
  400e1c:	24451a98 	addiu	a1,v0,6808
  400e20:	1462ff93 	bne	v1,v0,400c70 <__vprintf+0x21c>
  400e24:	2602ff9c 	addiu	v0,s0,-100
  400e28:	8fa20038 	lw	v0,56(sp)
  400e2c:	2403fff8 	li	v1,-8
  400e30:	24420007 	addiu	v0,v0,7
  400e34:	00431024 	and	v0,v0,v1
  400e38:	8c450004 	lw	a1,4(v0)
  400e3c:	8c440000 	lw	a0,0(v0)
  400e40:	24420008 	addiu	v0,v0,8
  400e44:	afa20038 	sw	v0,56(sp)
  400e48:	afa5004c 	sw	a1,76(sp)
  400e4c:	0810031b 	j	400c6c <__vprintf+0x218>
  400e50:	afa40048 	sw	a0,72(sp)
  400e54:	3c020040 	lui	v0,0x40
  400e58:	08100360 	j	400d80 <__vprintf+0x32c>
  400e5c:	244619e8 	addiu	a2,v0,6632
  400e60:	24020008 	li	v0,8
  400e64:	08100334 	j	400cd0 <__vprintf+0x27c>
  400e68:	afa20060 	sw	v0,96(sp)
  400e6c:	24020073 	li	v0,115
  400e70:	12020028 	beq	s0,v0,400f14 <__vprintf+0x4c0>
  400e74:	24020063 	li	v0,99
  400e78:	12020037 	beq	s0,v0,400f58 <__vprintf+0x504>
  400e7c:	00000000 	nop
  400e80:	a3b00011 	sb	s0,17(sp)
  400e84:	3c050040 	lui	a1,0x40
  400e88:	24a51a98 	addiu	a1,a1,6808
  400e8c:	03c02021 	move	a0,s8
  400e90:	00a03021 	move	a2,a1
  400e94:	27a70011 	addiu	a3,sp,17
  400e98:	0c100214 	jal	400850 <__pf_printstuff>
  400e9c:	a3a00012 	sb	zero,18(sp)
  400ea0:	0c1001ea 	jal	4007a8 <__pf_endfield>
  400ea4:	03c02021 	move	a0,s8
  400ea8:	081002b2 	j	400ac8 <__vprintf+0x74>
  400eac:	00000000 	nop
  400eb0:	8fa30044 	lw	v1,68(sp)
  400eb4:	00000000 	nop
  400eb8:	1062000e 	beq	v1,v0,400ef4 <__vprintf+0x4a0>
  400ebc:	00000000 	nop
  400ec0:	1060000c 	beqz	v1,400ef4 <__vprintf+0x4a0>
  400ec4:	24020002 	li	v0,2
  400ec8:	1062ffba 	beq	v1,v0,400db4 <__vprintf+0x360>
  400ecc:	00003821 	move	a3,zero
  400ed0:	00003021 	move	a2,zero
  400ed4:	2402000a 	li	v0,10
  400ed8:	afa7004c 	sw	a3,76(sp)
  400edc:	afa60048 	sw	a2,72(sp)
  400ee0:	08100334 	j	400cd0 <__vprintf+0x27c>
  400ee4:	afa20060 	sw	v0,96(sp)
  400ee8:	3c020040 	lui	v0,0x40
  400eec:	08100360 	j	400d80 <__vprintf+0x32c>
  400ef0:	244619e4 	addiu	a2,v0,6628
  400ef4:	8fa20038 	lw	v0,56(sp)
  400ef8:	00000000 	nop
  400efc:	8c430000 	lw	v1,0(v0)
  400f00:	24420004 	addiu	v0,v0,4
  400f04:	00603821 	move	a3,v1
  400f08:	000337c3 	sra	a2,v1,0x1f
  400f0c:	08100375 	j	400dd4 <__vprintf+0x380>
  400f10:	afa20038 	sw	v0,56(sp)
  400f14:	8fa30038 	lw	v1,56(sp)
  400f18:	00000000 	nop
  400f1c:	8c670000 	lw	a3,0(v1)
  400f20:	00000000 	nop
  400f24:	10e00013 	beqz	a3,400f74 <__vprintf+0x520>
  400f28:	3c020040 	lui	v0,0x40
  400f2c:	3c050040 	lui	a1,0x40
  400f30:	24a51a98 	addiu	a1,a1,6808
  400f34:	24620004 	addiu	v0,v1,4
  400f38:	03c02021 	move	a0,s8
  400f3c:	00a03021 	move	a2,a1
  400f40:	0c100214 	jal	400850 <__pf_printstuff>
  400f44:	afa20038 	sw	v0,56(sp)
  400f48:	0c1001ea 	jal	4007a8 <__pf_endfield>
  400f4c:	03c02021 	move	a0,s8
  400f50:	081002b2 	j	400ac8 <__vprintf+0x74>
  400f54:	00000000 	nop
  400f58:	8fa20038 	lw	v0,56(sp)
  400f5c:	00000000 	nop
  400f60:	8c430000 	lw	v1,0(v0)
  400f64:	24420004 	addiu	v0,v0,4
  400f68:	afa20038 	sw	v0,56(sp)
  400f6c:	081003a1 	j	400e84 <__vprintf+0x430>
  400f70:	a3a30011 	sb	v1,17(sp)
  400f74:	081003cb 	j	400f2c <__vprintf+0x4d8>
  400f78:	24471974 	addiu	a3,v0,6516
  400f7c:	00000000 	nop

00400f80 <strchr>:
  400f80:	80830000 	lb	v1,0(a0)
  400f84:	00052e00 	sll	a1,a1,0x18
  400f88:	00801021 	move	v0,a0
  400f8c:	1060000c 	beqz	v1,400fc0 <strchr+0x40>
  400f90:	00052e03 	sra	a1,a1,0x18
  400f94:	14a30006 	bne	a1,v1,400fb0 <strchr+0x30>
  400f98:	24420001 	addiu	v0,v0,1
  400f9c:	03e00008 	jr	ra
  400fa0:	2442ffff 	addiu	v0,v0,-1
  400fa4:	10a3000c 	beq	a1,v1,400fd8 <strchr+0x58>
  400fa8:	00000000 	nop
  400fac:	24420001 	addiu	v0,v0,1
  400fb0:	80430000 	lb	v1,0(v0)
  400fb4:	00000000 	nop
  400fb8:	1460fffa 	bnez	v1,400fa4 <strchr+0x24>
  400fbc:	00000000 	nop
  400fc0:	14a00003 	bnez	a1,400fd0 <strchr+0x50>
  400fc4:	00000000 	nop
  400fc8:	03e00008 	jr	ra
  400fcc:	00000000 	nop
  400fd0:	03e00008 	jr	ra
  400fd4:	00001021 	move	v0,zero
  400fd8:	03e00008 	jr	ra
  400fdc:	00000000 	nop

00400fe0 <strerror>:
  400fe0:	3c020040 	lui	v0,0x40
  400fe4:	00042880 	sll	a1,a0,0x2
  400fe8:	24421820 	addiu	v0,v0,6176
  400fec:	3c030040 	lui	v1,0x40
  400ff0:	2c840041 	sltiu	a0,a0,65
  400ff4:	00a22821 	addu	a1,a1,v0
  400ff8:	10800002 	beqz	a0,401004 <strerror+0x24>
  400ffc:	246219ec 	addiu	v0,v1,6636
  401000:	8ca20000 	lw	v0,0(a1)
  401004:	03e00008 	jr	ra
  401008:	00000000 	nop
  40100c:	00000000 	nop

00401010 <strlen>:
  401010:	80820000 	lb	v0,0(a0)
  401014:	00000000 	nop
  401018:	1040000a 	beqz	v0,401044 <strlen+0x34>
  40101c:	00002821 	move	a1,zero
  401020:	24a50001 	addiu	a1,a1,1
  401024:	00851021 	addu	v0,a0,a1
  401028:	80430000 	lb	v1,0(v0)
  40102c:	00000000 	nop
  401030:	1460fffc 	bnez	v1,401024 <strlen+0x14>
  401034:	24a50001 	addiu	a1,a1,1
  401038:	24a5ffff 	addiu	a1,a1,-1
  40103c:	03e00008 	jr	ra
  401040:	00a01021 	move	v0,a1
  401044:	03e00008 	jr	ra
  401048:	00a01021 	move	v0,a1
  40104c:	00000000 	nop

00401050 <__udivdi3>:
  401050:	27bdffe0 	addiu	sp,sp,-32
  401054:	afbf0018 	sw	ra,24(sp)
  401058:	0c1004a3 	jal	40128c <__qdivrem>
  40105c:	afa00010 	sw	zero,16(sp)
  401060:	8fbf0018 	lw	ra,24(sp)
  401064:	00000000 	nop
  401068:	03e00008 	jr	ra
  40106c:	27bd0020 	addiu	sp,sp,32

00401070 <__umoddi3>:
  401070:	27bdffd8 	addiu	sp,sp,-40
  401074:	27a20018 	addiu	v0,sp,24
  401078:	afbf0020 	sw	ra,32(sp)
  40107c:	0c1004a3 	jal	40128c <__qdivrem>
  401080:	afa20010 	sw	v0,16(sp)
  401084:	8fa3001c 	lw	v1,28(sp)
  401088:	8fa20018 	lw	v0,24(sp)
  40108c:	8fbf0020 	lw	ra,32(sp)
  401090:	00000000 	nop
  401094:	03e00008 	jr	ra
  401098:	27bd0028 	addiu	sp,sp,40
  40109c:	00000000 	nop

004010a0 <__bad_assert>:
  4010a0:	27bdfee0 	addiu	sp,sp,-288
  4010a4:	00c03821 	move	a3,a2
  4010a8:	afb00118 	sw	s0,280(sp)
  4010ac:	3c060040 	lui	a2,0x40
  4010b0:	27b00018 	addiu	s0,sp,24
  4010b4:	24c61ff0 	addiu	a2,a2,8176
  4010b8:	afa40010 	sw	a0,16(sp)
  4010bc:	afa50014 	sw	a1,20(sp)
  4010c0:	02002021 	move	a0,s0
  4010c4:	afbf011c 	sw	ra,284(sp)
  4010c8:	0c100474 	jal	4011d0 <snprintf>
  4010cc:	24050100 	li	a1,256
  4010d0:	0c100404 	jal	401010 <strlen>
  4010d4:	02002021 	move	a0,s0
  4010d8:	00403021 	move	a2,v0
  4010dc:	02002821 	move	a1,s0
  4010e0:	0c1000e3 	jal	40038c <write>
  4010e4:	24040002 	li	a0,2
  4010e8:	0c100480 	jal	401200 <abort>
  4010ec:	00000000 	nop

004010f0 <__snprintf_send>:
  4010f0:	10c00012 	beqz	a2,40113c <__snprintf_send+0x4c>
  4010f4:	00004021 	move	t0,zero
  4010f8:	8c870008 	lw	a3,8(a0)
  4010fc:	8c820004 	lw	v0,4(a0)
  401100:	00a81821 	addu	v1,a1,t0
  401104:	00e2102b 	sltu	v0,a3,v0
  401108:	1040000a 	beqz	v0,401134 <__snprintf_send+0x44>
  40110c:	25080001 	addiu	t0,t0,1
  401110:	8c820000 	lw	v0,0(a0)
  401114:	90630000 	lbu	v1,0(v1)
  401118:	00471021 	addu	v0,v0,a3
  40111c:	a0430000 	sb	v1,0(v0)
  401120:	8c870008 	lw	a3,8(a0)
  401124:	00000000 	nop
  401128:	24e20001 	addiu	v0,a3,1
  40112c:	00403821 	move	a3,v0
  401130:	ac820008 	sw	v0,8(a0)
  401134:	14c8fff1 	bne	a2,t0,4010fc <__snprintf_send+0xc>
  401138:	00000000 	nop
  40113c:	03e00008 	jr	ra
  401140:	00000000 	nop

00401144 <vsnprintf>:
  401144:	27bdffd8 	addiu	sp,sp,-40
  401148:	afb00020 	sw	s0,32(sp)
  40114c:	00a01021 	move	v0,a1
  401150:	00808021 	move	s0,a0
  401154:	3c040040 	lui	a0,0x40
  401158:	24a3ffff 	addiu	v1,a1,-1
  40115c:	afbf0024 	sw	ra,36(sp)
  401160:	248410f0 	addiu	a0,a0,4336
  401164:	27a50010 	addiu	a1,sp,16
  401168:	1440000c 	bnez	v0,40119c <vsnprintf+0x58>
  40116c:	afb00010 	sw	s0,16(sp)
  401170:	3c040040 	lui	a0,0x40
  401174:	248410f0 	addiu	a0,a0,4336
  401178:	afa00014 	sw	zero,20(sp)
  40117c:	0c100295 	jal	400a54 <__vprintf>
  401180:	afa00018 	sw	zero,24(sp)
  401184:	00401821 	move	v1,v0
  401188:	8fbf0024 	lw	ra,36(sp)
  40118c:	8fb00020 	lw	s0,32(sp)
  401190:	00601021 	move	v0,v1
  401194:	03e00008 	jr	ra
  401198:	27bd0028 	addiu	sp,sp,40
  40119c:	afa30014 	sw	v1,20(sp)
  4011a0:	0c100295 	jal	400a54 <__vprintf>
  4011a4:	afa00018 	sw	zero,24(sp)
  4011a8:	00401821 	move	v1,v0
  4011ac:	8fa20018 	lw	v0,24(sp)
  4011b0:	00000000 	nop
  4011b4:	02021021 	addu	v0,s0,v0
  4011b8:	a0400000 	sb	zero,0(v0)
  4011bc:	8fbf0024 	lw	ra,36(sp)
  4011c0:	8fb00020 	lw	s0,32(sp)
  4011c4:	00601021 	move	v0,v1
  4011c8:	03e00008 	jr	ra
  4011cc:	27bd0028 	addiu	sp,sp,40

004011d0 <snprintf>:
  4011d0:	27bdffe0 	addiu	sp,sp,-32
  4011d4:	27a2002c 	addiu	v0,sp,44
  4011d8:	afa7002c 	sw	a3,44(sp)
  4011dc:	00403821 	move	a3,v0
  4011e0:	afbf0018 	sw	ra,24(sp)
  4011e4:	0c100451 	jal	401144 <vsnprintf>
  4011e8:	afa20010 	sw	v0,16(sp)
  4011ec:	8fbf0018 	lw	ra,24(sp)
  4011f0:	00000000 	nop
  4011f4:	03e00008 	jr	ra
  4011f8:	27bd0020 	addiu	sp,sp,32
  4011fc:	00000000 	nop

00401200 <abort>:
  401200:	27bdffe8 	addiu	sp,sp,-24
  401204:	afbf0010 	sw	ra,16(sp)
  401208:	0c1000a3 	jal	40028c <_exit>
  40120c:	240400ff 	li	a0,255

00401210 <shl>:
  401210:	18a00016 	blez	a1,40126c <shl+0x5c>
  401214:	24020010 	li	v0,16
  401218:	00464823 	subu	t1,v0,a2
  40121c:	00803821 	move	a3,a0
  401220:	00004021 	move	t0,zero
  401224:	8ce20000 	lw	v0,0(a3)
  401228:	8ce30004 	lw	v1,4(a3)
  40122c:	00c21004 	sllv	v0,v0,a2
  401230:	3042ffff 	andi	v0,v0,0xffff
  401234:	01231806 	srlv	v1,v1,t1
  401238:	00431025 	or	v0,v0,v1
  40123c:	25080001 	addiu	t0,t0,1
  401240:	ace20000 	sw	v0,0(a3)
  401244:	14a8fff7 	bne	a1,t0,401224 <shl+0x14>
  401248:	24e70004 	addiu	a3,a3,4
  40124c:	00051880 	sll	v1,a1,0x2
  401250:	00831821 	addu	v1,a0,v1
  401254:	8c620000 	lw	v0,0(v1)
  401258:	00000000 	nop
  40125c:	00c21004 	sllv	v0,v0,a2
  401260:	3042ffff 	andi	v0,v0,0xffff
  401264:	03e00008 	jr	ra
  401268:	ac620000 	sw	v0,0(v1)
  40126c:	00001821 	move	v1,zero
  401270:	00831821 	addu	v1,a0,v1
  401274:	8c620000 	lw	v0,0(v1)
  401278:	00000000 	nop
  40127c:	00c21004 	sllv	v0,v0,a2
  401280:	3042ffff 	andi	v0,v0,0xffff
  401284:	03e00008 	jr	ra
  401288:	ac620000 	sw	v0,0(v1)

0040128c <__qdivrem>:
  40128c:	27bdff80 	addiu	sp,sp,-128
  401290:	00c71025 	or	v0,a2,a3
  401294:	afb20060 	sw	s2,96(sp)
  401298:	afbf007c 	sw	ra,124(sp)
  40129c:	afbe0078 	sw	s8,120(sp)
  4012a0:	afb70074 	sw	s7,116(sp)
  4012a4:	afb60070 	sw	s6,112(sp)
  4012a8:	afb5006c 	sw	s5,108(sp)
  4012ac:	afb40068 	sw	s4,104(sp)
  4012b0:	afb30064 	sw	s3,100(sp)
  4012b4:	afb1005c 	sw	s1,92(sp)
  4012b8:	afb00058 	sw	s0,88(sp)
  4012bc:	00a04821 	move	t1,a1
  4012c0:	8fb20090 	lw	s2,144(sp)
  4012c4:	14400018 	bnez	v0,401328 <__qdivrem+0x9c>
  4012c8:	00804021 	move	t0,a0
  4012cc:	3c031000 	lui	v1,0x1000
  4012d0:	8c640000 	lw	a0,0(v1)
  4012d4:	24020001 	li	v0,1
  4012d8:	14800002 	bnez	a0,4012e4 <__qdivrem+0x58>
  4012dc:	0044001b 	divu	zero,v0,a0
  4012e0:	0007000d 	break	0x7
  4012e4:	00001012 	mflo	v0
  4012e8:	12400003 	beqz	s2,4012f8 <__qdivrem+0x6c>
  4012ec:	00401821 	move	v1,v0
  4012f0:	ae450004 	sw	a1,4(s2)
  4012f4:	ae480000 	sw	t0,0(s2)
  4012f8:	8fbf007c 	lw	ra,124(sp)
  4012fc:	8fbe0078 	lw	s8,120(sp)
  401300:	8fb70074 	lw	s7,116(sp)
  401304:	8fb60070 	lw	s6,112(sp)
  401308:	8fb5006c 	lw	s5,108(sp)
  40130c:	8fb40068 	lw	s4,104(sp)
  401310:	8fb30064 	lw	s3,100(sp)
  401314:	8fb20060 	lw	s2,96(sp)
  401318:	8fb1005c 	lw	s1,92(sp)
  40131c:	8fb00058 	lw	s0,88(sp)
  401320:	03e00008 	jr	ra
  401324:	27bd0080 	addiu	sp,sp,128
  401328:	0086102b 	sltu	v0,a0,a2
  40132c:	10400008 	beqz	v0,401350 <__qdivrem+0xc4>
  401330:	00000000 	nop
  401334:	1240010c 	beqz	s2,401768 <__qdivrem+0x4dc>
  401338:	00000000 	nop
  40133c:	00001821 	move	v1,zero
  401340:	00001021 	move	v0,zero
  401344:	ae490004 	sw	t1,4(s2)
  401348:	081004be 	j	4012f8 <__qdivrem+0x6c>
  40134c:	ae480000 	sw	t0,0(s2)
  401350:	10860046 	beq	a0,a2,40146c <__qdivrem+0x1e0>
  401354:	00a7102b 	sltu	v0,a1,a3
  401358:	00e08821 	move	s1,a3
  40135c:	01001821 	move	v1,t0
  401360:	00c08021 	move	s0,a2
  401364:	30c7ffff 	andi	a3,a2,0xffff
  401368:	3108ffff 	andi	t0,t0,0xffff
  40136c:	312affff 	andi	t2,t1,0xffff
  401370:	3226ffff 	andi	a2,s1,0xffff
  401374:	00031c02 	srl	v1,v1,0x10
  401378:	00092c02 	srl	a1,t1,0x10
  40137c:	00101402 	srl	v0,s0,0x10
  401380:	00112402 	srl	a0,s1,0x10
  401384:	afa00010 	sw	zero,16(sp)
  401388:	afa30014 	sw	v1,20(sp)
  40138c:	afa80018 	sw	t0,24(sp)
  401390:	afa5001c 	sw	a1,28(sp)
  401394:	afaa0020 	sw	t2,32(sp)
  401398:	afa20028 	sw	v0,40(sp)
  40139c:	afa7002c 	sw	a3,44(sp)
  4013a0:	afa40030 	sw	a0,48(sp)
  4013a4:	144000f6 	bnez	v0,401780 <__qdivrem+0x4f4>
  4013a8:	afa60034 	sw	a2,52(sp)
  4013ac:	14e00033 	bnez	a3,40147c <__qdivrem+0x1f0>
  4013b0:	27a20028 	addiu	v0,sp,40
  4013b4:	148000f7 	bnez	a0,401794 <__qdivrem+0x508>
  4013b8:	27a2002c 	addiu	v0,sp,44
  4013bc:	14c00002 	bnez	a2,4013c8 <__qdivrem+0x13c>
  4013c0:	0066001b 	divu	zero,v1,a2
  4013c4:	0007000d 	break	0x7
  4013c8:	00001010 	mfhi	v0
  4013cc:	00021400 	sll	v0,v0,0x10
  4013d0:	00481025 	or	v0,v0,t0
  4013d4:	00004812 	mflo	t1
	...
  4013e0:	14c00002 	bnez	a2,4013ec <__qdivrem+0x160>
  4013e4:	0046001b 	divu	zero,v0,a2
  4013e8:	0007000d 	break	0x7
  4013ec:	00001810 	mfhi	v1
  4013f0:	00031c00 	sll	v1,v1,0x10
  4013f4:	00651825 	or	v1,v1,a1
  4013f8:	00003812 	mflo	a3
	...
  401404:	14c00002 	bnez	a2,401410 <__qdivrem+0x184>
  401408:	0066001b 	divu	zero,v1,a2
  40140c:	0007000d 	break	0x7
  401410:	00001010 	mfhi	v0
  401414:	00021400 	sll	v0,v0,0x10
  401418:	00001812 	mflo	v1
  40141c:	12400008 	beqz	s2,401440 <__qdivrem+0x1b4>
  401420:	01422025 	or	a0,t2,v0
  401424:	14c00002 	bnez	a2,401430 <__qdivrem+0x1a4>
  401428:	0086001b 	divu	zero,a0,a2
  40142c:	0007000d 	break	0x7
  401430:	ae400000 	sw	zero,0(s2)
  401434:	00001010 	mfhi	v0
  401438:	ae420004 	sw	v0,4(s2)
  40143c:	00000000 	nop
  401440:	14c00002 	bnez	a2,40144c <__qdivrem+0x1c0>
  401444:	0086001b 	divu	zero,a0,a2
  401448:	0007000d 	break	0x7
  40144c:	00091400 	sll	v0,t1,0x10
  401450:	00031c00 	sll	v1,v1,0x10
  401454:	00e28025 	or	s0,a3,v0
  401458:	02001021 	move	v0,s0
  40145c:	00002012 	mflo	a0
  401460:	00838825 	or	s1,a0,v1
  401464:	081004be 	j	4012f8 <__qdivrem+0x6c>
  401468:	02201821 	move	v1,s1
  40146c:	1040ffbb 	beqz	v0,40135c <__qdivrem+0xd0>
  401470:	00e08821 	move	s1,a3
  401474:	081004cd 	j	401334 <__qdivrem+0xa8>
  401478:	00000000 	nop
  40147c:	afa20050 	sw	v0,80(sp)
  401480:	24170003 	li	s7,3
  401484:	27be002c 	addiu	s8,sp,44
  401488:	8fa30014 	lw	v1,20(sp)
  40148c:	24020004 	li	v0,4
  401490:	146000c4 	bnez	v1,4017a4 <__qdivrem+0x518>
  401494:	00579823 	subu	s3,v0,s7
  401498:	08100529 	j	4014a4 <__qdivrem+0x218>
  40149c:	27b40014 	addiu	s4,sp,20
  4014a0:	0060a021 	move	s4,v1
  4014a4:	8e820004 	lw	v0,4(s4)
  4014a8:	2673ffff 	addiu	s3,s3,-1
  4014ac:	1040fffc 	beqz	v0,4014a0 <__qdivrem+0x214>
  4014b0:	26830004 	addiu	v1,s4,4
  4014b4:	24020004 	li	v0,4
  4014b8:	00532023 	subu	a0,v0,s3
  4014bc:	2483ffff 	addiu	v1,a0,-1
  4014c0:	046000bc 	bltz	v1,4017b4 <__qdivrem+0x528>
  4014c4:	00001821 	move	v1,zero
  4014c8:	27a60038 	addiu	a2,sp,56
  4014cc:	00042880 	sll	a1,a0,0x2
  4014d0:	00c51021 	addu	v0,a2,a1
  4014d4:	2442fffc 	addiu	v0,v0,-4
  4014d8:	24630001 	addiu	v1,v1,1
  4014dc:	ac400000 	sw	zero,0(v0)
  4014e0:	1464fffd 	bne	v1,a0,4014d8 <__qdivrem+0x24c>
  4014e4:	2442fffc 	addiu	v0,v0,-4
  4014e8:	8fcb0000 	lw	t3,0(s8)
  4014ec:	34028000 	li	v0,0x8000
  4014f0:	0162102b 	sltu	v0,t3,v0
  4014f4:	00c5b021 	addu	s6,a2,a1
  4014f8:	104000ac 	beqz	v0,4017ac <__qdivrem+0x520>
  4014fc:	01601821 	move	v1,t3
  401500:	0000a821 	move	s5,zero
  401504:	34048000 	li	a0,0x8000
  401508:	00031840 	sll	v1,v1,0x1
  40150c:	0064102b 	sltu	v0,v1,a0
  401510:	1440fffd 	bnez	v0,401508 <__qdivrem+0x27c>
  401514:	26b50001 	addiu	s5,s5,1
  401518:	1aa00009 	blez	s5,401540 <__qdivrem+0x2b4>
  40151c:	02f32821 	addu	a1,s7,s3
  401520:	02a03021 	move	a2,s5
  401524:	0c100484 	jal	401210 <shl>
  401528:	02802021 	move	a0,s4
  40152c:	03c02021 	move	a0,s8
  401530:	26e5ffff 	addiu	a1,s7,-1
  401534:	0c100484 	jal	401210 <shl>
  401538:	02a03021 	move	a2,s5
  40153c:	8fcb0000 	lw	t3,0(s8)
  401540:	8fa20050 	lw	v0,80(sp)
  401544:	00177080 	sll	t6,s7,0x2
  401548:	8c580008 	lw	t8,8(v0)
  40154c:	02c06821 	move	t5,s6
  401550:	02804821 	move	t1,s4
  401554:	028e6021 	addu	t4,s4,t6
  401558:	00007821 	move	t7,zero
  40155c:	3416ffff 	li	s6,0xffff
  401560:	8d240000 	lw	a0,0(t1)
  401564:	8d230004 	lw	v1,4(t1)
  401568:	8d260008 	lw	a2,8(t1)
  40156c:	11640081 	beq	t3,a0,401774 <__qdivrem+0x4e8>
  401570:	00041400 	sll	v0,a0,0x10
  401574:	00621025 	or	v0,v1,v0
  401578:	15600002 	bnez	t3,401584 <__qdivrem+0x2f8>
  40157c:	004b001b 	divu	zero,v0,t3
  401580:	0007000d 	break	0x7
  401584:	00002810 	mfhi	a1
  401588:	00003812 	mflo	a3
	...
  401594:	00f80018 	mult	a3,t8
  401598:	00051400 	sll	v0,a1,0x10
  40159c:	00c21025 	or	v0,a2,v0
  4015a0:	00001812 	mflo	v1
  4015a4:	0043182b 	sltu	v1,v0,v1
  4015a8:	10600006 	beqz	v1,4015c4 <__qdivrem+0x338>
  4015ac:	00000000 	nop
  4015b0:	24e7ffff 	addiu	a3,a3,-1
  4015b4:	00ab2821 	addu	a1,a1,t3
  4015b8:	02c5102b 	sltu	v0,s6,a1
  4015bc:	1040fff6 	beqz	v0,401598 <__qdivrem+0x30c>
  4015c0:	00f80018 	mult	a3,t8
  4015c4:	1ae00017 	blez	s7,401624 <__qdivrem+0x398>
  4015c8:	00004021 	move	t0,zero
  4015cc:	8fa20050 	lw	v0,80(sp)
  4015d0:	01802021 	move	a0,t4
  4015d4:	004e3021 	addu	a2,v0,t6
  4015d8:	02e02821 	move	a1,s7
  4015dc:	3c0a0001 	lui	t2,0x1
  4015e0:	8cc20000 	lw	v0,0(a2)
  4015e4:	8c830000 	lw	v1,0(a0)
  4015e8:	00e20018 	mult	a3,v0
  4015ec:	24a5ffff 	addiu	a1,a1,-1
  4015f0:	24c6fffc 	addiu	a2,a2,-4
  4015f4:	00001012 	mflo	v0
  4015f8:	00621823 	subu	v1,v1,v0
  4015fc:	00681823 	subu	v1,v1,t0
  401600:	00031402 	srl	v0,v1,0x10
  401604:	01421023 	subu	v0,t2,v0
  401608:	3063ffff 	andi	v1,v1,0xffff
  40160c:	ac830000 	sw	v1,0(a0)
  401610:	3048ffff 	andi	t0,v0,0xffff
  401614:	14a0fff2 	bnez	a1,4015e0 <__qdivrem+0x354>
  401618:	2484fffc 	addiu	a0,a0,-4
  40161c:	8d240000 	lw	a0,0(t1)
  401620:	00000000 	nop
  401624:	00881023 	subu	v0,a0,t0
  401628:	3044ffff 	andi	a0,v0,0xffff
  40162c:	00021c02 	srl	v1,v0,0x10
  401630:	10600018 	beqz	v1,401694 <__qdivrem+0x408>
  401634:	ad240000 	sw	a0,0(t1)
  401638:	1ae00012 	blez	s7,401684 <__qdivrem+0x3f8>
  40163c:	00004021 	move	t0,zero
  401640:	8fa20050 	lw	v0,80(sp)
  401644:	01802021 	move	a0,t4
  401648:	004e3021 	addu	a2,v0,t6
  40164c:	02e02821 	move	a1,s7
  401650:	8c820000 	lw	v0,0(a0)
  401654:	8cc30000 	lw	v1,0(a2)
  401658:	01021021 	addu	v0,t0,v0
  40165c:	00431021 	addu	v0,v0,v1
  401660:	3043ffff 	andi	v1,v0,0xffff
  401664:	24a5ffff 	addiu	a1,a1,-1
  401668:	ac830000 	sw	v1,0(a0)
  40166c:	00024402 	srl	t0,v0,0x10
  401670:	2484fffc 	addiu	a0,a0,-4
  401674:	14a0fff6 	bnez	a1,401650 <__qdivrem+0x3c4>
  401678:	24c6fffc 	addiu	a2,a2,-4
  40167c:	8d240000 	lw	a0,0(t1)
  401680:	00000000 	nop
  401684:	01041021 	addu	v0,t0,a0
  401688:	3042ffff 	andi	v0,v0,0xffff
  40168c:	ad220000 	sw	v0,0(t1)
  401690:	24e7ffff 	addiu	a3,a3,-1
  401694:	25ef0001 	addiu	t7,t7,1
  401698:	026f102a 	slt	v0,s3,t7
  40169c:	ada70000 	sw	a3,0(t5)
  4016a0:	25290004 	addiu	t1,t1,4
  4016a4:	25ad0004 	addiu	t5,t5,4
  4016a8:	1040ffad 	beqz	v0,401560 <__qdivrem+0x2d4>
  4016ac:	258c0004 	addiu	t4,t4,4
  4016b0:	12400022 	beqz	s2,40173c <__qdivrem+0x4b0>
  4016b4:	00000000 	nop
  4016b8:	12a00016 	beqz	s5,401714 <__qdivrem+0x488>
  4016bc:	02f32821 	addu	a1,s7,s3
  4016c0:	0265102a 	slt	v0,s3,a1
  4016c4:	10400011 	beqz	v0,40170c <__qdivrem+0x480>
  4016c8:	00051080 	sll	v0,a1,0x2
  4016cc:	00051880 	sll	v1,a1,0x2
  4016d0:	24020010 	li	v0,16
  4016d4:	00553823 	subu	a3,v0,s5
  4016d8:	02833021 	addu	a2,s4,v1
  4016dc:	8cc2fffc 	lw	v0,-4(a2)
  4016e0:	8cc30000 	lw	v1,0(a2)
  4016e4:	00e21004 	sllv	v0,v0,a3
  4016e8:	02a31806 	srlv	v1,v1,s5
  4016ec:	3042ffff 	andi	v0,v0,0xffff
  4016f0:	24a5ffff 	addiu	a1,a1,-1
  4016f4:	00621825 	or	v1,v1,v0
  4016f8:	0265202a 	slt	a0,s3,a1
  4016fc:	acc30000 	sw	v1,0(a2)
  401700:	1480fff6 	bnez	a0,4016dc <__qdivrem+0x450>
  401704:	24c6fffc 	addiu	a2,a2,-4
  401708:	00051080 	sll	v0,a1,0x2
  40170c:	00541021 	addu	v0,v0,s4
  401710:	ac400000 	sw	zero,0(v0)
  401714:	8fa20014 	lw	v0,20(sp)
  401718:	8fa40018 	lw	a0,24(sp)
  40171c:	00021400 	sll	v0,v0,0x10
  401720:	8fa3001c 	lw	v1,28(sp)
  401724:	00448025 	or	s0,v0,a0
  401728:	8fa20020 	lw	v0,32(sp)
  40172c:	00031c00 	sll	v1,v1,0x10
  401730:	00628825 	or	s1,v1,v0
  401734:	ae510004 	sw	s1,4(s2)
  401738:	ae500000 	sw	s0,0(s2)
  40173c:	8fa2003c 	lw	v0,60(sp)
  401740:	8fa40040 	lw	a0,64(sp)
  401744:	00021400 	sll	v0,v0,0x10
  401748:	8fa30044 	lw	v1,68(sp)
  40174c:	00448025 	or	s0,v0,a0
  401750:	8fa20048 	lw	v0,72(sp)
  401754:	00031c00 	sll	v1,v1,0x10
  401758:	00628825 	or	s1,v1,v0
  40175c:	02201821 	move	v1,s1
  401760:	081004be 	j	4012f8 <__qdivrem+0x6c>
  401764:	02001021 	move	v0,s0
  401768:	00001821 	move	v1,zero
  40176c:	081004be 	j	4012f8 <__qdivrem+0x6c>
  401770:	00001021 	move	v0,zero
  401774:	00602821 	move	a1,v1
  401778:	0810056d 	j	4015b4 <__qdivrem+0x328>
  40177c:	3407ffff 	li	a3,0xffff
  401780:	27a20024 	addiu	v0,sp,36
  401784:	24170004 	li	s7,4
  401788:	27be0028 	addiu	s8,sp,40
  40178c:	08100522 	j	401488 <__qdivrem+0x1fc>
  401790:	afa20050 	sw	v0,80(sp)
  401794:	24170002 	li	s7,2
  401798:	27be0030 	addiu	s8,sp,48
  40179c:	08100522 	j	401488 <__qdivrem+0x1fc>
  4017a0:	afa20050 	sw	v0,80(sp)
  4017a4:	0810052d 	j	4014b4 <__qdivrem+0x228>
  4017a8:	27b40010 	addiu	s4,sp,16
  4017ac:	08100550 	j	401540 <__qdivrem+0x2b4>
  4017b0:	0000a821 	move	s5,zero
  4017b4:	00042880 	sll	a1,a0,0x2
  4017b8:	0810053a 	j	4014e8 <__qdivrem+0x25c>
  4017bc:	27a60038 	addiu	a2,sp,56
