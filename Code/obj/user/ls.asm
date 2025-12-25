
obj/__user_ls.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <opendir>:
  800020:	7139                	addi	sp,sp,-64
  800022:	f822                	sd	s0,48(sp)
  800024:	00001417          	auipc	s0,0x1
  800028:	fdc40413          	addi	s0,s0,-36 # 801000 <dirp>
  80002c:	f426                	sd	s1,40(sp)
  80002e:	6004                	ld	s1,0(s0)
  800030:	4581                	li	a1,0
  800032:	fc06                	sd	ra,56(sp)
  800034:	066000ef          	jal	ra,80009a <open>
  800038:	c088                	sw	a0,0(s1)
  80003a:	02054663          	bltz	a0,800066 <opendir+0x46>
  80003e:	601c                	ld	a5,0(s0)
  800040:	858a                	mv	a1,sp
  800042:	4388                	lw	a0,0(a5)
  800044:	060000ef          	jal	ra,8000a4 <fstat>
  800048:	ed19                	bnez	a0,800066 <opendir+0x46>
  80004a:	4782                	lw	a5,0(sp)
  80004c:	669d                	lui	a3,0x7
  80004e:	6709                	lui	a4,0x2
  800050:	8ff5                	and	a5,a5,a3
  800052:	00e79a63          	bne	a5,a4,800066 <opendir+0x46>
  800056:	6008                	ld	a0,0(s0)
  800058:	70e2                	ld	ra,56(sp)
  80005a:	7442                	ld	s0,48(sp)
  80005c:	00053423          	sd	zero,8(a0)
  800060:	74a2                	ld	s1,40(sp)
  800062:	6121                	addi	sp,sp,64
  800064:	8082                	ret
  800066:	70e2                	ld	ra,56(sp)
  800068:	7442                	ld	s0,48(sp)
  80006a:	74a2                	ld	s1,40(sp)
  80006c:	4501                	li	a0,0
  80006e:	6121                	addi	sp,sp,64
  800070:	8082                	ret

0000000000800072 <readdir>:
  800072:	1141                	addi	sp,sp,-16
  800074:	e022                	sd	s0,0(sp)
  800076:	842a                	mv	s0,a0
  800078:	4108                	lw	a0,0(a0)
  80007a:	0421                	addi	s0,s0,8
  80007c:	85a2                	mv	a1,s0
  80007e:	e406                	sd	ra,8(sp)
  800080:	1ba000ef          	jal	ra,80023a <sys_getdirentry>
  800084:	00153513          	seqz	a0,a0
  800088:	40a00533          	neg	a0,a0
  80008c:	60a2                	ld	ra,8(sp)
  80008e:	8d61                	and	a0,a0,s0
  800090:	6402                	ld	s0,0(sp)
  800092:	0141                	addi	sp,sp,16
  800094:	8082                	ret

0000000000800096 <closedir>:
  800096:	4108                	lw	a0,0(a0)
  800098:	a021                	j	8000a0 <close>

000000000080009a <open>:
  80009a:	1582                	slli	a1,a1,0x20
  80009c:	9181                	srli	a1,a1,0x20
  80009e:	aa95                	j	800212 <sys_open>

00000000008000a0 <close>:
  8000a0:	aab5                	j	80021c <sys_close>

00000000008000a2 <write>:
  8000a2:	a249                	j	800224 <sys_write>

00000000008000a4 <fstat>:
  8000a4:	a271                	j	800230 <sys_fstat>

00000000008000a6 <dup2>:
  8000a6:	aa79                	j	800244 <sys_dup>

00000000008000a8 <_start>:
  8000a8:	200000ef          	jal	ra,8002a8 <umain>
  8000ac:	a001                	j	8000ac <_start+0x4>

00000000008000ae <__warn>:
  8000ae:	715d                	addi	sp,sp,-80
  8000b0:	832e                	mv	t1,a1
  8000b2:	e822                	sd	s0,16(sp)
  8000b4:	85aa                	mv	a1,a0
  8000b6:	8432                	mv	s0,a2
  8000b8:	fc3e                	sd	a5,56(sp)
  8000ba:	861a                	mv	a2,t1
  8000bc:	103c                	addi	a5,sp,40
  8000be:	00001517          	auipc	a0,0x1
  8000c2:	81250513          	addi	a0,a0,-2030 # 8008d0 <main+0x72>
  8000c6:	ec06                	sd	ra,24(sp)
  8000c8:	f436                	sd	a3,40(sp)
  8000ca:	f83a                	sd	a4,48(sp)
  8000cc:	e0c2                	sd	a6,64(sp)
  8000ce:	e4c6                	sd	a7,72(sp)
  8000d0:	e43e                	sd	a5,8(sp)
  8000d2:	08a000ef          	jal	ra,80015c <cprintf>
  8000d6:	65a2                	ld	a1,8(sp)
  8000d8:	8522                	mv	a0,s0
  8000da:	05c000ef          	jal	ra,800136 <vcprintf>
  8000de:	00001517          	auipc	a0,0x1
  8000e2:	cd250513          	addi	a0,a0,-814 # 800db0 <error_string+0xd8>
  8000e6:	076000ef          	jal	ra,80015c <cprintf>
  8000ea:	60e2                	ld	ra,24(sp)
  8000ec:	6442                	ld	s0,16(sp)
  8000ee:	6161                	addi	sp,sp,80
  8000f0:	8082                	ret

00000000008000f2 <cputch>:
  8000f2:	1141                	addi	sp,sp,-16
  8000f4:	e022                	sd	s0,0(sp)
  8000f6:	e406                	sd	ra,8(sp)
  8000f8:	842e                	mv	s0,a1
  8000fa:	112000ef          	jal	ra,80020c <sys_putc>
  8000fe:	401c                	lw	a5,0(s0)
  800100:	60a2                	ld	ra,8(sp)
  800102:	2785                	addiw	a5,a5,1
  800104:	c01c                	sw	a5,0(s0)
  800106:	6402                	ld	s0,0(sp)
  800108:	0141                	addi	sp,sp,16
  80010a:	8082                	ret

000000000080010c <fputch>:
  80010c:	1101                	addi	sp,sp,-32
  80010e:	8732                	mv	a4,a2
  800110:	e822                	sd	s0,16(sp)
  800112:	87aa                	mv	a5,a0
  800114:	842e                	mv	s0,a1
  800116:	4605                	li	a2,1
  800118:	00f10593          	addi	a1,sp,15
  80011c:	853a                	mv	a0,a4
  80011e:	ec06                	sd	ra,24(sp)
  800120:	00f107a3          	sb	a5,15(sp)
  800124:	f7fff0ef          	jal	ra,8000a2 <write>
  800128:	401c                	lw	a5,0(s0)
  80012a:	60e2                	ld	ra,24(sp)
  80012c:	2785                	addiw	a5,a5,1
  80012e:	c01c                	sw	a5,0(s0)
  800130:	6442                	ld	s0,16(sp)
  800132:	6105                	addi	sp,sp,32
  800134:	8082                	ret

0000000000800136 <vcprintf>:
  800136:	1101                	addi	sp,sp,-32
  800138:	872e                	mv	a4,a1
  80013a:	75dd                	lui	a1,0xffff7
  80013c:	86aa                	mv	a3,a0
  80013e:	0070                	addi	a2,sp,12
  800140:	00000517          	auipc	a0,0x0
  800144:	fb250513          	addi	a0,a0,-78 # 8000f2 <cputch>
  800148:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <dir+0xffffffffff7f5ad1>
  80014c:	ec06                	sd	ra,24(sp)
  80014e:	c602                	sw	zero,12(sp)
  800150:	242000ef          	jal	ra,800392 <vprintfmt>
  800154:	60e2                	ld	ra,24(sp)
  800156:	4532                	lw	a0,12(sp)
  800158:	6105                	addi	sp,sp,32
  80015a:	8082                	ret

000000000080015c <cprintf>:
  80015c:	711d                	addi	sp,sp,-96
  80015e:	02810313          	addi	t1,sp,40
  800162:	8e2a                	mv	t3,a0
  800164:	f42e                	sd	a1,40(sp)
  800166:	75dd                	lui	a1,0xffff7
  800168:	f832                	sd	a2,48(sp)
  80016a:	fc36                	sd	a3,56(sp)
  80016c:	e0ba                	sd	a4,64(sp)
  80016e:	00000517          	auipc	a0,0x0
  800172:	f8450513          	addi	a0,a0,-124 # 8000f2 <cputch>
  800176:	0050                	addi	a2,sp,4
  800178:	871a                	mv	a4,t1
  80017a:	86f2                	mv	a3,t3
  80017c:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <dir+0xffffffffff7f5ad1>
  800180:	ec06                	sd	ra,24(sp)
  800182:	e4be                	sd	a5,72(sp)
  800184:	e8c2                	sd	a6,80(sp)
  800186:	ecc6                	sd	a7,88(sp)
  800188:	e41a                	sd	t1,8(sp)
  80018a:	c202                	sw	zero,4(sp)
  80018c:	206000ef          	jal	ra,800392 <vprintfmt>
  800190:	60e2                	ld	ra,24(sp)
  800192:	4512                	lw	a0,4(sp)
  800194:	6125                	addi	sp,sp,96
  800196:	8082                	ret

0000000000800198 <fprintf>:
  800198:	715d                	addi	sp,sp,-80
  80019a:	02010313          	addi	t1,sp,32
  80019e:	8e2a                	mv	t3,a0
  8001a0:	f032                	sd	a2,32(sp)
  8001a2:	f436                	sd	a3,40(sp)
  8001a4:	f83a                	sd	a4,48(sp)
  8001a6:	00000517          	auipc	a0,0x0
  8001aa:	f6650513          	addi	a0,a0,-154 # 80010c <fputch>
  8001ae:	86ae                	mv	a3,a1
  8001b0:	0050                	addi	a2,sp,4
  8001b2:	871a                	mv	a4,t1
  8001b4:	85f2                	mv	a1,t3
  8001b6:	ec06                	sd	ra,24(sp)
  8001b8:	fc3e                	sd	a5,56(sp)
  8001ba:	e0c2                	sd	a6,64(sp)
  8001bc:	e4c6                	sd	a7,72(sp)
  8001be:	e41a                	sd	t1,8(sp)
  8001c0:	c202                	sw	zero,4(sp)
  8001c2:	1d0000ef          	jal	ra,800392 <vprintfmt>
  8001c6:	60e2                	ld	ra,24(sp)
  8001c8:	4512                	lw	a0,4(sp)
  8001ca:	6161                	addi	sp,sp,80
  8001cc:	8082                	ret

00000000008001ce <syscall>:
  8001ce:	7175                	addi	sp,sp,-144
  8001d0:	f8ba                	sd	a4,112(sp)
  8001d2:	e0ba                	sd	a4,64(sp)
  8001d4:	0118                	addi	a4,sp,128
  8001d6:	e42a                	sd	a0,8(sp)
  8001d8:	ecae                	sd	a1,88(sp)
  8001da:	f0b2                	sd	a2,96(sp)
  8001dc:	f4b6                	sd	a3,104(sp)
  8001de:	fcbe                	sd	a5,120(sp)
  8001e0:	e142                	sd	a6,128(sp)
  8001e2:	e546                	sd	a7,136(sp)
  8001e4:	f42e                	sd	a1,40(sp)
  8001e6:	f832                	sd	a2,48(sp)
  8001e8:	fc36                	sd	a3,56(sp)
  8001ea:	f03a                	sd	a4,32(sp)
  8001ec:	e4be                	sd	a5,72(sp)
  8001ee:	4522                	lw	a0,8(sp)
  8001f0:	55a2                	lw	a1,40(sp)
  8001f2:	5642                	lw	a2,48(sp)
  8001f4:	56e2                	lw	a3,56(sp)
  8001f6:	4706                	lw	a4,64(sp)
  8001f8:	47a6                	lw	a5,72(sp)
  8001fa:	00000073          	ecall
  8001fe:	ce2a                	sw	a0,28(sp)
  800200:	4572                	lw	a0,28(sp)
  800202:	6149                	addi	sp,sp,144
  800204:	8082                	ret

0000000000800206 <sys_exit>:
  800206:	85aa                	mv	a1,a0
  800208:	4505                	li	a0,1
  80020a:	b7d1                	j	8001ce <syscall>

000000000080020c <sys_putc>:
  80020c:	85aa                	mv	a1,a0
  80020e:	4579                	li	a0,30
  800210:	bf7d                	j	8001ce <syscall>

0000000000800212 <sys_open>:
  800212:	862e                	mv	a2,a1
  800214:	85aa                	mv	a1,a0
  800216:	06400513          	li	a0,100
  80021a:	bf55                	j	8001ce <syscall>

000000000080021c <sys_close>:
  80021c:	85aa                	mv	a1,a0
  80021e:	06500513          	li	a0,101
  800222:	b775                	j	8001ce <syscall>

0000000000800224 <sys_write>:
  800224:	86b2                	mv	a3,a2
  800226:	862e                	mv	a2,a1
  800228:	85aa                	mv	a1,a0
  80022a:	06700513          	li	a0,103
  80022e:	b745                	j	8001ce <syscall>

0000000000800230 <sys_fstat>:
  800230:	862e                	mv	a2,a1
  800232:	85aa                	mv	a1,a0
  800234:	06e00513          	li	a0,110
  800238:	bf59                	j	8001ce <syscall>

000000000080023a <sys_getdirentry>:
  80023a:	862e                	mv	a2,a1
  80023c:	85aa                	mv	a1,a0
  80023e:	08000513          	li	a0,128
  800242:	b771                	j	8001ce <syscall>

0000000000800244 <sys_dup>:
  800244:	862e                	mv	a2,a1
  800246:	85aa                	mv	a1,a0
  800248:	08200513          	li	a0,130
  80024c:	b749                	j	8001ce <syscall>

000000000080024e <exit>:
  80024e:	1141                	addi	sp,sp,-16
  800250:	e406                	sd	ra,8(sp)
  800252:	fb5ff0ef          	jal	ra,800206 <sys_exit>
  800256:	00000517          	auipc	a0,0x0
  80025a:	69a50513          	addi	a0,a0,1690 # 8008f0 <main+0x92>
  80025e:	effff0ef          	jal	ra,80015c <cprintf>
  800262:	a001                	j	800262 <exit+0x14>

0000000000800264 <initfd>:
  800264:	1101                	addi	sp,sp,-32
  800266:	87ae                	mv	a5,a1
  800268:	e426                	sd	s1,8(sp)
  80026a:	85b2                	mv	a1,a2
  80026c:	84aa                	mv	s1,a0
  80026e:	853e                	mv	a0,a5
  800270:	e822                	sd	s0,16(sp)
  800272:	ec06                	sd	ra,24(sp)
  800274:	e27ff0ef          	jal	ra,80009a <open>
  800278:	842a                	mv	s0,a0
  80027a:	00054463          	bltz	a0,800282 <initfd+0x1e>
  80027e:	00951863          	bne	a0,s1,80028e <initfd+0x2a>
  800282:	60e2                	ld	ra,24(sp)
  800284:	8522                	mv	a0,s0
  800286:	6442                	ld	s0,16(sp)
  800288:	64a2                	ld	s1,8(sp)
  80028a:	6105                	addi	sp,sp,32
  80028c:	8082                	ret
  80028e:	8526                	mv	a0,s1
  800290:	e11ff0ef          	jal	ra,8000a0 <close>
  800294:	85a6                	mv	a1,s1
  800296:	8522                	mv	a0,s0
  800298:	e0fff0ef          	jal	ra,8000a6 <dup2>
  80029c:	84aa                	mv	s1,a0
  80029e:	8522                	mv	a0,s0
  8002a0:	e01ff0ef          	jal	ra,8000a0 <close>
  8002a4:	8426                	mv	s0,s1
  8002a6:	bff1                	j	800282 <initfd+0x1e>

00000000008002a8 <umain>:
  8002a8:	1101                	addi	sp,sp,-32
  8002aa:	e822                	sd	s0,16(sp)
  8002ac:	e426                	sd	s1,8(sp)
  8002ae:	842a                	mv	s0,a0
  8002b0:	84ae                	mv	s1,a1
  8002b2:	4601                	li	a2,0
  8002b4:	00000597          	auipc	a1,0x0
  8002b8:	65458593          	addi	a1,a1,1620 # 800908 <main+0xaa>
  8002bc:	4501                	li	a0,0
  8002be:	ec06                	sd	ra,24(sp)
  8002c0:	fa5ff0ef          	jal	ra,800264 <initfd>
  8002c4:	02054263          	bltz	a0,8002e8 <umain+0x40>
  8002c8:	4605                	li	a2,1
  8002ca:	00000597          	auipc	a1,0x0
  8002ce:	67e58593          	addi	a1,a1,1662 # 800948 <main+0xea>
  8002d2:	4505                	li	a0,1
  8002d4:	f91ff0ef          	jal	ra,800264 <initfd>
  8002d8:	02054563          	bltz	a0,800302 <umain+0x5a>
  8002dc:	85a6                	mv	a1,s1
  8002de:	8522                	mv	a0,s0
  8002e0:	57e000ef          	jal	ra,80085e <main>
  8002e4:	f6bff0ef          	jal	ra,80024e <exit>
  8002e8:	86aa                	mv	a3,a0
  8002ea:	00000617          	auipc	a2,0x0
  8002ee:	62660613          	addi	a2,a2,1574 # 800910 <main+0xb2>
  8002f2:	45e9                	li	a1,26
  8002f4:	00000517          	auipc	a0,0x0
  8002f8:	63c50513          	addi	a0,a0,1596 # 800930 <main+0xd2>
  8002fc:	db3ff0ef          	jal	ra,8000ae <__warn>
  800300:	b7e1                	j	8002c8 <umain+0x20>
  800302:	86aa                	mv	a3,a0
  800304:	00000617          	auipc	a2,0x0
  800308:	64c60613          	addi	a2,a2,1612 # 800950 <main+0xf2>
  80030c:	45f5                	li	a1,29
  80030e:	00000517          	auipc	a0,0x0
  800312:	62250513          	addi	a0,a0,1570 # 800930 <main+0xd2>
  800316:	d99ff0ef          	jal	ra,8000ae <__warn>
  80031a:	b7c9                	j	8002dc <umain+0x34>

000000000080031c <printnum>:
  80031c:	02071893          	slli	a7,a4,0x20
  800320:	7139                	addi	sp,sp,-64
  800322:	0208d893          	srli	a7,a7,0x20
  800326:	e456                	sd	s5,8(sp)
  800328:	0316fab3          	remu	s5,a3,a7
  80032c:	f822                	sd	s0,48(sp)
  80032e:	f426                	sd	s1,40(sp)
  800330:	f04a                	sd	s2,32(sp)
  800332:	ec4e                	sd	s3,24(sp)
  800334:	fc06                	sd	ra,56(sp)
  800336:	e852                	sd	s4,16(sp)
  800338:	84aa                	mv	s1,a0
  80033a:	89ae                	mv	s3,a1
  80033c:	8932                	mv	s2,a2
  80033e:	fff7841b          	addiw	s0,a5,-1
  800342:	2a81                	sext.w	s5,s5
  800344:	0516f163          	bgeu	a3,a7,800386 <printnum+0x6a>
  800348:	8a42                	mv	s4,a6
  80034a:	00805863          	blez	s0,80035a <printnum+0x3e>
  80034e:	347d                	addiw	s0,s0,-1
  800350:	864e                	mv	a2,s3
  800352:	85ca                	mv	a1,s2
  800354:	8552                	mv	a0,s4
  800356:	9482                	jalr	s1
  800358:	f87d                	bnez	s0,80034e <printnum+0x32>
  80035a:	1a82                	slli	s5,s5,0x20
  80035c:	00000797          	auipc	a5,0x0
  800360:	61478793          	addi	a5,a5,1556 # 800970 <main+0x112>
  800364:	020ada93          	srli	s5,s5,0x20
  800368:	9abe                	add	s5,s5,a5
  80036a:	7442                	ld	s0,48(sp)
  80036c:	000ac503          	lbu	a0,0(s5)
  800370:	70e2                	ld	ra,56(sp)
  800372:	6a42                	ld	s4,16(sp)
  800374:	6aa2                	ld	s5,8(sp)
  800376:	864e                	mv	a2,s3
  800378:	85ca                	mv	a1,s2
  80037a:	69e2                	ld	s3,24(sp)
  80037c:	7902                	ld	s2,32(sp)
  80037e:	87a6                	mv	a5,s1
  800380:	74a2                	ld	s1,40(sp)
  800382:	6121                	addi	sp,sp,64
  800384:	8782                	jr	a5
  800386:	0316d6b3          	divu	a3,a3,a7
  80038a:	87a2                	mv	a5,s0
  80038c:	f91ff0ef          	jal	ra,80031c <printnum>
  800390:	b7e9                	j	80035a <printnum+0x3e>

0000000000800392 <vprintfmt>:
  800392:	7119                	addi	sp,sp,-128
  800394:	f4a6                	sd	s1,104(sp)
  800396:	f0ca                	sd	s2,96(sp)
  800398:	ecce                	sd	s3,88(sp)
  80039a:	e8d2                	sd	s4,80(sp)
  80039c:	e4d6                	sd	s5,72(sp)
  80039e:	e0da                	sd	s6,64(sp)
  8003a0:	fc5e                	sd	s7,56(sp)
  8003a2:	ec6e                	sd	s11,24(sp)
  8003a4:	fc86                	sd	ra,120(sp)
  8003a6:	f8a2                	sd	s0,112(sp)
  8003a8:	f862                	sd	s8,48(sp)
  8003aa:	f466                	sd	s9,40(sp)
  8003ac:	f06a                	sd	s10,32(sp)
  8003ae:	89aa                	mv	s3,a0
  8003b0:	892e                	mv	s2,a1
  8003b2:	84b2                	mv	s1,a2
  8003b4:	8db6                	mv	s11,a3
  8003b6:	8aba                	mv	s5,a4
  8003b8:	02500a13          	li	s4,37
  8003bc:	5bfd                	li	s7,-1
  8003be:	00000b17          	auipc	s6,0x0
  8003c2:	5e6b0b13          	addi	s6,s6,1510 # 8009a4 <main+0x146>
  8003c6:	000dc503          	lbu	a0,0(s11)
  8003ca:	001d8413          	addi	s0,s11,1
  8003ce:	01450b63          	beq	a0,s4,8003e4 <vprintfmt+0x52>
  8003d2:	c129                	beqz	a0,800414 <vprintfmt+0x82>
  8003d4:	864a                	mv	a2,s2
  8003d6:	85a6                	mv	a1,s1
  8003d8:	0405                	addi	s0,s0,1
  8003da:	9982                	jalr	s3
  8003dc:	fff44503          	lbu	a0,-1(s0)
  8003e0:	ff4519e3          	bne	a0,s4,8003d2 <vprintfmt+0x40>
  8003e4:	00044583          	lbu	a1,0(s0)
  8003e8:	02000813          	li	a6,32
  8003ec:	4d01                	li	s10,0
  8003ee:	4301                	li	t1,0
  8003f0:	5cfd                	li	s9,-1
  8003f2:	5c7d                	li	s8,-1
  8003f4:	05500513          	li	a0,85
  8003f8:	48a5                	li	a7,9
  8003fa:	fdd5861b          	addiw	a2,a1,-35
  8003fe:	0ff67613          	zext.b	a2,a2
  800402:	00140d93          	addi	s11,s0,1
  800406:	04c56263          	bltu	a0,a2,80044a <vprintfmt+0xb8>
  80040a:	060a                	slli	a2,a2,0x2
  80040c:	965a                	add	a2,a2,s6
  80040e:	4214                	lw	a3,0(a2)
  800410:	96da                	add	a3,a3,s6
  800412:	8682                	jr	a3
  800414:	70e6                	ld	ra,120(sp)
  800416:	7446                	ld	s0,112(sp)
  800418:	74a6                	ld	s1,104(sp)
  80041a:	7906                	ld	s2,96(sp)
  80041c:	69e6                	ld	s3,88(sp)
  80041e:	6a46                	ld	s4,80(sp)
  800420:	6aa6                	ld	s5,72(sp)
  800422:	6b06                	ld	s6,64(sp)
  800424:	7be2                	ld	s7,56(sp)
  800426:	7c42                	ld	s8,48(sp)
  800428:	7ca2                	ld	s9,40(sp)
  80042a:	7d02                	ld	s10,32(sp)
  80042c:	6de2                	ld	s11,24(sp)
  80042e:	6109                	addi	sp,sp,128
  800430:	8082                	ret
  800432:	882e                	mv	a6,a1
  800434:	00144583          	lbu	a1,1(s0)
  800438:	846e                	mv	s0,s11
  80043a:	00140d93          	addi	s11,s0,1
  80043e:	fdd5861b          	addiw	a2,a1,-35
  800442:	0ff67613          	zext.b	a2,a2
  800446:	fcc572e3          	bgeu	a0,a2,80040a <vprintfmt+0x78>
  80044a:	864a                	mv	a2,s2
  80044c:	85a6                	mv	a1,s1
  80044e:	02500513          	li	a0,37
  800452:	9982                	jalr	s3
  800454:	fff44783          	lbu	a5,-1(s0)
  800458:	8da2                	mv	s11,s0
  80045a:	f74786e3          	beq	a5,s4,8003c6 <vprintfmt+0x34>
  80045e:	ffedc783          	lbu	a5,-2(s11)
  800462:	1dfd                	addi	s11,s11,-1
  800464:	ff479de3          	bne	a5,s4,80045e <vprintfmt+0xcc>
  800468:	bfb9                	j	8003c6 <vprintfmt+0x34>
  80046a:	fd058c9b          	addiw	s9,a1,-48
  80046e:	00144583          	lbu	a1,1(s0)
  800472:	846e                	mv	s0,s11
  800474:	fd05869b          	addiw	a3,a1,-48
  800478:	0005861b          	sext.w	a2,a1
  80047c:	02d8e463          	bltu	a7,a3,8004a4 <vprintfmt+0x112>
  800480:	00144583          	lbu	a1,1(s0)
  800484:	002c969b          	slliw	a3,s9,0x2
  800488:	0196873b          	addw	a4,a3,s9
  80048c:	0017171b          	slliw	a4,a4,0x1
  800490:	9f31                	addw	a4,a4,a2
  800492:	fd05869b          	addiw	a3,a1,-48
  800496:	0405                	addi	s0,s0,1
  800498:	fd070c9b          	addiw	s9,a4,-48
  80049c:	0005861b          	sext.w	a2,a1
  8004a0:	fed8f0e3          	bgeu	a7,a3,800480 <vprintfmt+0xee>
  8004a4:	f40c5be3          	bgez	s8,8003fa <vprintfmt+0x68>
  8004a8:	8c66                	mv	s8,s9
  8004aa:	5cfd                	li	s9,-1
  8004ac:	b7b9                	j	8003fa <vprintfmt+0x68>
  8004ae:	fffc4693          	not	a3,s8
  8004b2:	96fd                	srai	a3,a3,0x3f
  8004b4:	00dc77b3          	and	a5,s8,a3
  8004b8:	00144583          	lbu	a1,1(s0)
  8004bc:	00078c1b          	sext.w	s8,a5
  8004c0:	846e                	mv	s0,s11
  8004c2:	bf25                	j	8003fa <vprintfmt+0x68>
  8004c4:	000aac83          	lw	s9,0(s5)
  8004c8:	00144583          	lbu	a1,1(s0)
  8004cc:	0aa1                	addi	s5,s5,8
  8004ce:	846e                	mv	s0,s11
  8004d0:	bfd1                	j	8004a4 <vprintfmt+0x112>
  8004d2:	4705                	li	a4,1
  8004d4:	008a8613          	addi	a2,s5,8
  8004d8:	00674463          	blt	a4,t1,8004e0 <vprintfmt+0x14e>
  8004dc:	1c030c63          	beqz	t1,8006b4 <vprintfmt+0x322>
  8004e0:	000ab683          	ld	a3,0(s5)
  8004e4:	4741                	li	a4,16
  8004e6:	8ab2                	mv	s5,a2
  8004e8:	2801                	sext.w	a6,a6
  8004ea:	87e2                	mv	a5,s8
  8004ec:	8626                	mv	a2,s1
  8004ee:	85ca                	mv	a1,s2
  8004f0:	854e                	mv	a0,s3
  8004f2:	e2bff0ef          	jal	ra,80031c <printnum>
  8004f6:	bdc1                	j	8003c6 <vprintfmt+0x34>
  8004f8:	000aa503          	lw	a0,0(s5)
  8004fc:	864a                	mv	a2,s2
  8004fe:	85a6                	mv	a1,s1
  800500:	0aa1                	addi	s5,s5,8
  800502:	9982                	jalr	s3
  800504:	b5c9                	j	8003c6 <vprintfmt+0x34>
  800506:	4705                	li	a4,1
  800508:	008a8613          	addi	a2,s5,8
  80050c:	00674463          	blt	a4,t1,800514 <vprintfmt+0x182>
  800510:	18030d63          	beqz	t1,8006aa <vprintfmt+0x318>
  800514:	000ab683          	ld	a3,0(s5)
  800518:	4729                	li	a4,10
  80051a:	8ab2                	mv	s5,a2
  80051c:	b7f1                	j	8004e8 <vprintfmt+0x156>
  80051e:	00144583          	lbu	a1,1(s0)
  800522:	4d05                	li	s10,1
  800524:	846e                	mv	s0,s11
  800526:	bdd1                	j	8003fa <vprintfmt+0x68>
  800528:	864a                	mv	a2,s2
  80052a:	85a6                	mv	a1,s1
  80052c:	02500513          	li	a0,37
  800530:	9982                	jalr	s3
  800532:	bd51                	j	8003c6 <vprintfmt+0x34>
  800534:	00144583          	lbu	a1,1(s0)
  800538:	2305                	addiw	t1,t1,1
  80053a:	846e                	mv	s0,s11
  80053c:	bd7d                	j	8003fa <vprintfmt+0x68>
  80053e:	4705                	li	a4,1
  800540:	008a8613          	addi	a2,s5,8
  800544:	00674463          	blt	a4,t1,80054c <vprintfmt+0x1ba>
  800548:	14030c63          	beqz	t1,8006a0 <vprintfmt+0x30e>
  80054c:	000ab683          	ld	a3,0(s5)
  800550:	4721                	li	a4,8
  800552:	8ab2                	mv	s5,a2
  800554:	bf51                	j	8004e8 <vprintfmt+0x156>
  800556:	03000513          	li	a0,48
  80055a:	864a                	mv	a2,s2
  80055c:	85a6                	mv	a1,s1
  80055e:	e042                	sd	a6,0(sp)
  800560:	9982                	jalr	s3
  800562:	864a                	mv	a2,s2
  800564:	85a6                	mv	a1,s1
  800566:	07800513          	li	a0,120
  80056a:	9982                	jalr	s3
  80056c:	0aa1                	addi	s5,s5,8
  80056e:	6802                	ld	a6,0(sp)
  800570:	4741                	li	a4,16
  800572:	ff8ab683          	ld	a3,-8(s5)
  800576:	bf8d                	j	8004e8 <vprintfmt+0x156>
  800578:	000ab403          	ld	s0,0(s5)
  80057c:	008a8793          	addi	a5,s5,8
  800580:	e03e                	sd	a5,0(sp)
  800582:	14040c63          	beqz	s0,8006da <vprintfmt+0x348>
  800586:	11805063          	blez	s8,800686 <vprintfmt+0x2f4>
  80058a:	02d00693          	li	a3,45
  80058e:	0cd81963          	bne	a6,a3,800660 <vprintfmt+0x2ce>
  800592:	00044683          	lbu	a3,0(s0)
  800596:	0006851b          	sext.w	a0,a3
  80059a:	ce8d                	beqz	a3,8005d4 <vprintfmt+0x242>
  80059c:	00140a93          	addi	s5,s0,1
  8005a0:	05e00413          	li	s0,94
  8005a4:	000cc563          	bltz	s9,8005ae <vprintfmt+0x21c>
  8005a8:	3cfd                	addiw	s9,s9,-1
  8005aa:	037c8363          	beq	s9,s7,8005d0 <vprintfmt+0x23e>
  8005ae:	864a                	mv	a2,s2
  8005b0:	85a6                	mv	a1,s1
  8005b2:	100d0663          	beqz	s10,8006be <vprintfmt+0x32c>
  8005b6:	3681                	addiw	a3,a3,-32
  8005b8:	10d47363          	bgeu	s0,a3,8006be <vprintfmt+0x32c>
  8005bc:	03f00513          	li	a0,63
  8005c0:	9982                	jalr	s3
  8005c2:	000ac683          	lbu	a3,0(s5)
  8005c6:	3c7d                	addiw	s8,s8,-1
  8005c8:	0a85                	addi	s5,s5,1
  8005ca:	0006851b          	sext.w	a0,a3
  8005ce:	faf9                	bnez	a3,8005a4 <vprintfmt+0x212>
  8005d0:	01805a63          	blez	s8,8005e4 <vprintfmt+0x252>
  8005d4:	3c7d                	addiw	s8,s8,-1
  8005d6:	864a                	mv	a2,s2
  8005d8:	85a6                	mv	a1,s1
  8005da:	02000513          	li	a0,32
  8005de:	9982                	jalr	s3
  8005e0:	fe0c1ae3          	bnez	s8,8005d4 <vprintfmt+0x242>
  8005e4:	6a82                	ld	s5,0(sp)
  8005e6:	b3c5                	j	8003c6 <vprintfmt+0x34>
  8005e8:	4705                	li	a4,1
  8005ea:	008a8d13          	addi	s10,s5,8
  8005ee:	00674463          	blt	a4,t1,8005f6 <vprintfmt+0x264>
  8005f2:	0a030463          	beqz	t1,80069a <vprintfmt+0x308>
  8005f6:	000ab403          	ld	s0,0(s5)
  8005fa:	0c044463          	bltz	s0,8006c2 <vprintfmt+0x330>
  8005fe:	86a2                	mv	a3,s0
  800600:	8aea                	mv	s5,s10
  800602:	4729                	li	a4,10
  800604:	b5d5                	j	8004e8 <vprintfmt+0x156>
  800606:	000aa783          	lw	a5,0(s5)
  80060a:	46e1                	li	a3,24
  80060c:	0aa1                	addi	s5,s5,8
  80060e:	41f7d71b          	sraiw	a4,a5,0x1f
  800612:	8fb9                	xor	a5,a5,a4
  800614:	40e7873b          	subw	a4,a5,a4
  800618:	02e6c663          	blt	a3,a4,800644 <vprintfmt+0x2b2>
  80061c:	00371793          	slli	a5,a4,0x3
  800620:	00000697          	auipc	a3,0x0
  800624:	6b868693          	addi	a3,a3,1720 # 800cd8 <error_string>
  800628:	97b6                	add	a5,a5,a3
  80062a:	639c                	ld	a5,0(a5)
  80062c:	cf81                	beqz	a5,800644 <vprintfmt+0x2b2>
  80062e:	873e                	mv	a4,a5
  800630:	00000697          	auipc	a3,0x0
  800634:	37068693          	addi	a3,a3,880 # 8009a0 <main+0x142>
  800638:	8626                	mv	a2,s1
  80063a:	85ca                	mv	a1,s2
  80063c:	854e                	mv	a0,s3
  80063e:	0d4000ef          	jal	ra,800712 <printfmt>
  800642:	b351                	j	8003c6 <vprintfmt+0x34>
  800644:	00000697          	auipc	a3,0x0
  800648:	34c68693          	addi	a3,a3,844 # 800990 <main+0x132>
  80064c:	8626                	mv	a2,s1
  80064e:	85ca                	mv	a1,s2
  800650:	854e                	mv	a0,s3
  800652:	0c0000ef          	jal	ra,800712 <printfmt>
  800656:	bb85                	j	8003c6 <vprintfmt+0x34>
  800658:	00000417          	auipc	s0,0x0
  80065c:	33040413          	addi	s0,s0,816 # 800988 <main+0x12a>
  800660:	85e6                	mv	a1,s9
  800662:	8522                	mv	a0,s0
  800664:	e442                	sd	a6,8(sp)
  800666:	0ca000ef          	jal	ra,800730 <strnlen>
  80066a:	40ac0c3b          	subw	s8,s8,a0
  80066e:	01805c63          	blez	s8,800686 <vprintfmt+0x2f4>
  800672:	6822                	ld	a6,8(sp)
  800674:	00080a9b          	sext.w	s5,a6
  800678:	3c7d                	addiw	s8,s8,-1
  80067a:	864a                	mv	a2,s2
  80067c:	85a6                	mv	a1,s1
  80067e:	8556                	mv	a0,s5
  800680:	9982                	jalr	s3
  800682:	fe0c1be3          	bnez	s8,800678 <vprintfmt+0x2e6>
  800686:	00044683          	lbu	a3,0(s0)
  80068a:	00140a93          	addi	s5,s0,1
  80068e:	0006851b          	sext.w	a0,a3
  800692:	daa9                	beqz	a3,8005e4 <vprintfmt+0x252>
  800694:	05e00413          	li	s0,94
  800698:	b731                	j	8005a4 <vprintfmt+0x212>
  80069a:	000aa403          	lw	s0,0(s5)
  80069e:	bfb1                	j	8005fa <vprintfmt+0x268>
  8006a0:	000ae683          	lwu	a3,0(s5)
  8006a4:	4721                	li	a4,8
  8006a6:	8ab2                	mv	s5,a2
  8006a8:	b581                	j	8004e8 <vprintfmt+0x156>
  8006aa:	000ae683          	lwu	a3,0(s5)
  8006ae:	4729                	li	a4,10
  8006b0:	8ab2                	mv	s5,a2
  8006b2:	bd1d                	j	8004e8 <vprintfmt+0x156>
  8006b4:	000ae683          	lwu	a3,0(s5)
  8006b8:	4741                	li	a4,16
  8006ba:	8ab2                	mv	s5,a2
  8006bc:	b535                	j	8004e8 <vprintfmt+0x156>
  8006be:	9982                	jalr	s3
  8006c0:	b709                	j	8005c2 <vprintfmt+0x230>
  8006c2:	864a                	mv	a2,s2
  8006c4:	85a6                	mv	a1,s1
  8006c6:	02d00513          	li	a0,45
  8006ca:	e042                	sd	a6,0(sp)
  8006cc:	9982                	jalr	s3
  8006ce:	6802                	ld	a6,0(sp)
  8006d0:	8aea                	mv	s5,s10
  8006d2:	408006b3          	neg	a3,s0
  8006d6:	4729                	li	a4,10
  8006d8:	bd01                	j	8004e8 <vprintfmt+0x156>
  8006da:	03805163          	blez	s8,8006fc <vprintfmt+0x36a>
  8006de:	02d00693          	li	a3,45
  8006e2:	f6d81be3          	bne	a6,a3,800658 <vprintfmt+0x2c6>
  8006e6:	00000417          	auipc	s0,0x0
  8006ea:	2a240413          	addi	s0,s0,674 # 800988 <main+0x12a>
  8006ee:	02800693          	li	a3,40
  8006f2:	02800513          	li	a0,40
  8006f6:	00140a93          	addi	s5,s0,1
  8006fa:	b55d                	j	8005a0 <vprintfmt+0x20e>
  8006fc:	00000a97          	auipc	s5,0x0
  800700:	28da8a93          	addi	s5,s5,653 # 800989 <main+0x12b>
  800704:	02800513          	li	a0,40
  800708:	02800693          	li	a3,40
  80070c:	05e00413          	li	s0,94
  800710:	bd51                	j	8005a4 <vprintfmt+0x212>

0000000000800712 <printfmt>:
  800712:	7139                	addi	sp,sp,-64
  800714:	02010313          	addi	t1,sp,32
  800718:	f03a                	sd	a4,32(sp)
  80071a:	871a                	mv	a4,t1
  80071c:	ec06                	sd	ra,24(sp)
  80071e:	f43e                	sd	a5,40(sp)
  800720:	f842                	sd	a6,48(sp)
  800722:	fc46                	sd	a7,56(sp)
  800724:	e41a                	sd	t1,8(sp)
  800726:	c6dff0ef          	jal	ra,800392 <vprintfmt>
  80072a:	60e2                	ld	ra,24(sp)
  80072c:	6121                	addi	sp,sp,64
  80072e:	8082                	ret

0000000000800730 <strnlen>:
  800730:	4781                	li	a5,0
  800732:	e589                	bnez	a1,80073c <strnlen+0xc>
  800734:	a811                	j	800748 <strnlen+0x18>
  800736:	0785                	addi	a5,a5,1
  800738:	00f58863          	beq	a1,a5,800748 <strnlen+0x18>
  80073c:	00f50733          	add	a4,a0,a5
  800740:	00074703          	lbu	a4,0(a4) # 2000 <opendir-0x7fe020>
  800744:	fb6d                	bnez	a4,800736 <strnlen+0x6>
  800746:	85be                	mv	a1,a5
  800748:	852e                	mv	a0,a1
  80074a:	8082                	ret

000000000080074c <ls>:
  80074c:	7119                	addi	sp,sp,-128
  80074e:	fc86                	sd	ra,120(sp)
  800750:	f8a2                	sd	s0,112(sp)
  800752:	f4a6                	sd	s1,104(sp)
  800754:	f0ca                	sd	s2,96(sp)
  800756:	ecce                	sd	s3,88(sp)
  800758:	e8d2                	sd	s4,80(sp)
  80075a:	e4d6                	sd	s5,72(sp)
  80075c:	e0da                	sd	s6,64(sp)
  80075e:	fc5e                	sd	s7,56(sp)
  800760:	f862                	sd	s8,48(sp)
  800762:	f466                	sd	s9,40(sp)
  800764:	f06a                	sd	s10,32(sp)
  800766:	8bbff0ef          	jal	ra,800020 <opendir>
  80076a:	c579                	beqz	a0,800838 <ls+0xec>
  80076c:	84aa                	mv	s1,a0
  80076e:	00000b17          	auipc	s6,0x0
  800772:	232b0b13          	addi	s6,s6,562 # 8009a0 <main+0x142>
  800776:	6a9d                	lui	s5,0x7
  800778:	6a09                	lui	s4,0x2
  80077a:	00000997          	auipc	s3,0x0
  80077e:	63698993          	addi	s3,s3,1590 # 800db0 <error_string+0xd8>
  800782:	00000917          	auipc	s2,0x0
  800786:	65e90913          	addi	s2,s2,1630 # 800de0 <error_string+0x108>
  80078a:	00000c17          	auipc	s8,0x0
  80078e:	64ec0c13          	addi	s8,s8,1614 # 800dd8 <error_string+0x100>
  800792:	00000b97          	auipc	s7,0x0
  800796:	626b8b93          	addi	s7,s7,1574 # 800db8 <error_string+0xe0>
  80079a:	8526                	mv	a0,s1
  80079c:	8d7ff0ef          	jal	ra,800072 <readdir>
  8007a0:	87aa                	mv	a5,a0
  8007a2:	00850c93          	addi	s9,a0,8
  8007a6:	4581                	li	a1,0
  8007a8:	8566                	mv	a0,s9
  8007aa:	cfa1                	beqz	a5,800802 <ls+0xb6>
  8007ac:	8efff0ef          	jal	ra,80009a <open>
  8007b0:	858a                	mv	a1,sp
  8007b2:	842a                	mv	s0,a0
  8007b4:	06054863          	bltz	a0,800824 <ls+0xd8>
  8007b8:	8edff0ef          	jal	ra,8000a4 <fstat>
  8007bc:	8d2a                	mv	s10,a0
  8007be:	8522                	mv	a0,s0
  8007c0:	8e1ff0ef          	jal	ra,8000a0 <close>
  8007c4:	8666                	mv	a2,s9
  8007c6:	85da                	mv	a1,s6
  8007c8:	4505                	li	a0,1
  8007ca:	040d1d63          	bnez	s10,800824 <ls+0xd8>
  8007ce:	9cbff0ef          	jal	ra,800198 <fprintf>
  8007d2:	4782                	lw	a5,0(sp)
  8007d4:	85ca                	mv	a1,s2
  8007d6:	4505                	li	a0,1
  8007d8:	0157f7b3          	and	a5,a5,s5
  8007dc:	2781                	sext.w	a5,a5
  8007de:	05478963          	beq	a5,s4,800830 <ls+0xe4>
  8007e2:	6662                	ld	a2,24(sp)
  8007e4:	9b5ff0ef          	jal	ra,800198 <fprintf>
  8007e8:	85ce                	mv	a1,s3
  8007ea:	4505                	li	a0,1
  8007ec:	9adff0ef          	jal	ra,800198 <fprintf>
  8007f0:	8526                	mv	a0,s1
  8007f2:	881ff0ef          	jal	ra,800072 <readdir>
  8007f6:	87aa                	mv	a5,a0
  8007f8:	00850c93          	addi	s9,a0,8
  8007fc:	4581                	li	a1,0
  8007fe:	8566                	mv	a0,s9
  800800:	f7d5                	bnez	a5,8007ac <ls+0x60>
  800802:	8526                	mv	a0,s1
  800804:	893ff0ef          	jal	ra,800096 <closedir>
  800808:	70e6                	ld	ra,120(sp)
  80080a:	7446                	ld	s0,112(sp)
  80080c:	74a6                	ld	s1,104(sp)
  80080e:	7906                	ld	s2,96(sp)
  800810:	69e6                	ld	s3,88(sp)
  800812:	6a46                	ld	s4,80(sp)
  800814:	6aa6                	ld	s5,72(sp)
  800816:	6b06                	ld	s6,64(sp)
  800818:	7be2                	ld	s7,56(sp)
  80081a:	7c42                	ld	s8,48(sp)
  80081c:	7ca2                	ld	s9,40(sp)
  80081e:	7d02                	ld	s10,32(sp)
  800820:	6109                	addi	sp,sp,128
  800822:	8082                	ret
  800824:	8666                	mv	a2,s9
  800826:	85de                	mv	a1,s7
  800828:	4505                	li	a0,1
  80082a:	96fff0ef          	jal	ra,800198 <fprintf>
  80082e:	b7b5                	j	80079a <ls+0x4e>
  800830:	85e2                	mv	a1,s8
  800832:	967ff0ef          	jal	ra,800198 <fprintf>
  800836:	bf4d                	j	8007e8 <ls+0x9c>
  800838:	7446                	ld	s0,112(sp)
  80083a:	70e6                	ld	ra,120(sp)
  80083c:	74a6                	ld	s1,104(sp)
  80083e:	7906                	ld	s2,96(sp)
  800840:	69e6                	ld	s3,88(sp)
  800842:	6a46                	ld	s4,80(sp)
  800844:	6aa6                	ld	s5,72(sp)
  800846:	6b06                	ld	s6,64(sp)
  800848:	7be2                	ld	s7,56(sp)
  80084a:	7c42                	ld	s8,48(sp)
  80084c:	7ca2                	ld	s9,40(sp)
  80084e:	7d02                	ld	s10,32(sp)
  800850:	00000597          	auipc	a1,0x0
  800854:	55058593          	addi	a1,a1,1360 # 800da0 <error_string+0xc8>
  800858:	4505                	li	a0,1
  80085a:	6109                	addi	sp,sp,128
  80085c:	ba35                	j	800198 <fprintf>

000000000080085e <main>:
  80085e:	1101                	addi	sp,sp,-32
  800860:	ec06                	sd	ra,24(sp)
  800862:	e822                	sd	s0,16(sp)
  800864:	e426                	sd	s1,8(sp)
  800866:	4785                	li	a5,1
  800868:	02f50b63          	beq	a0,a5,80089e <main+0x40>
  80086c:	02a7d363          	bge	a5,a0,800892 <main+0x34>
  800870:	ffe5049b          	addiw	s1,a0,-2
  800874:	02049793          	slli	a5,s1,0x20
  800878:	01d7d493          	srli	s1,a5,0x1d
  80087c:	01058793          	addi	a5,a1,16
  800880:	00858413          	addi	s0,a1,8
  800884:	94be                	add	s1,s1,a5
  800886:	6008                	ld	a0,0(s0)
  800888:	0421                	addi	s0,s0,8
  80088a:	ec3ff0ef          	jal	ra,80074c <ls>
  80088e:	fe941ce3          	bne	s0,s1,800886 <main+0x28>
  800892:	60e2                	ld	ra,24(sp)
  800894:	6442                	ld	s0,16(sp)
  800896:	64a2                	ld	s1,8(sp)
  800898:	4501                	li	a0,0
  80089a:	6105                	addi	sp,sp,32
  80089c:	8082                	ret
  80089e:	00000517          	auipc	a0,0x0
  8008a2:	54a50513          	addi	a0,a0,1354 # 800de8 <error_string+0x110>
  8008a6:	ea7ff0ef          	jal	ra,80074c <ls>
  8008aa:	b7e5                	j	800892 <main+0x34>
