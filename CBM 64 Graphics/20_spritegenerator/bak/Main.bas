10 rem sprite generator
12 rem
14 rem
20 poke 829,223
29 rem
30 rem if any sprite data, set up sprite
31 rem
40 poke 828,0
50 read sp
60 if sp>0 then 810
69 rem
70 rem no more sprite data
71 rem
80 gosub 860:poke 53281,2:poke 53280,2
90 def fn a(zz)=1064+r*40+c
100 v=53248:no=peek(829)
110 xl=0:yl=1:xg=16:se=21:xy=23:xx29
120 sc=39:print "S"
130 poke 2040,no:poke v+se,1:poke v+xy,1
140 poke v+xx,1:poke v+xl,255:poke v+yl,190
150 poke v+xg,0
160 x=255:y=190
169 rem
170 rem set up display
171 rem
180 print "                "
185 loc=64*no:print "s"
190 for i=loc to loc+62 step 3
200 for j=0 to 2
210 zz=peek(i+j)
220 for k=7 to 0 step -1
230 a=int((zz and a%(k))/a%(k))
240 if a=1 then print "***";:goto 260
250 print "*.";
260 next k
270 next j
280 print
290 next i
300 gosub 1000
309 rem
310 rem sprite set up on the screen
320 rem input changes
321 rem
330 r=0:c=0
340 z=fn a(0)
350 poke z+54272,0
360 get a$:if a$="" then 360
370 poke z+54272,1
380 if a$="q" then print "S":poke v+21,0:print "S";:end
390 if a$="*" and c=23 then c=0:goto 340
400 if a$="M" then c=c+1:goto 340
410 if a$="I" and c=0 then c=23:goto 340
420 if a$="I" then c=c-1:goto 340
430 if a$="M" and r=20 then r=0:goto 340
440 if a$="H" then r=r+1:goto 340
450 if a$="H" and r=0 then r=20:goto 340
460 if a$="r" then r=r-1:goto 340
470 if a$="«" then r=0:c=0:goto 340
480 if a$="S" then gosub 1150:goto 340
490 if a$="+" then 580
500 if a$="-" then 730
510 if a$="M" then 1210
520 if a$="B" then 1450
530 if a$="C" then 1400
540 if a$="X" then 900
550 if a$="N" and no-223<31 then no=no+l:goto 130
560 if a$="E" then 660
570 goto 340
574 rem
575 rem add point
576 rem
580 z=fn a(0)
590 z1=peek(z)
600 if z1-81 then 340
610 poke z,81
620 byte=int(c/8)+r*3
630 bit=7-(c-int(c/8)*8)
640 poke byte+no*64,peek(byte+no*64)or a%(bit)
650 goto 340
654 rem
655 rem input sprite # to edit
656 rem
660 input "***********************************sprite no.      ***";s
670 if s<0 or s>31 then 660
680 if no=223+s then zz=1:goto700
690 no=223+s
700 print "***********************                *";
710 if zz=1 then zz=0:goto 340
720 goto 130
724 rem
725 rem delete point
726 rem
730 z=fn a(0)
740 z1=peek(z)
750 if z1=46 then 340
760 poke z,46
770 byte=int(c/8)+r*3
780 bit=7-(c-int(c/8)*8)
790 poke byte+no*64,peek(byte+no*64) and (255-a%(bit))
800 goto 340
804 rem
805 rem if any data, set sprites up
806 rem
819 loc=sp*64
820 FOR I=LOC TO LOC+62
830 READ A: POKE I.fl
840 NEXT I
850 GOTO 50
854 REM
855 REM SET ARRAY WITH POWERS OF TWO
856 REM
860 FOR 1=0 TO 7
870 0X<I>=2TI
880 NEXT I
890 RETURN
894 REM
895 REM INPUT FOR EXPAND
111 PR I NT " ^«i!Mi!WW»MBW«««!WttI«"!WW«*t*»*|i»»l'"l:«H
tfk' y OR V"
910 GETA*:IFA*O"X"ANDA*<>"Y"THEN900
9P0 IFfl*="X"THEN960
930 IFPEEK<V+XV>-1THENP0KEV+XV .0 .00T0980
940 FOKEV+XV.l
96Q I FPEEK < V+XX > = 1 THENPOKEV+XX . ! 00T0980
980 PR I NT " WflOT««^!W««««««^™'WBWWJW'•**••,l•i*,,
990 GOTO 340
994 REM
995 REM D I SPAY CONTROL OPTIONS
996 REM
1000 PRINT ,, M,, SPC<26> ,, SC0NTR0LS«"
1005 PRINTSPC<25> "SPRITE
««"V?"f-PPTTF *••
1010 PRINTiPRINTSPC<25V'«flE"DIT SPRITE #
ioio PPTNT=:Pr<25>"S»4«EXT SPRITE #"
IS^S PRlfiTSPC<25V'»1«3VE SPRITE"
1040 PRINTSPC<25>"»:*:iL0UR CHANGE
"
1050 PRINTSPC<25V»«=PlND"
1060 PRINTSPCC25V3+* ADO DOT"
1070 PRINTSPC<25Vl»-« REMOVE DOT"
10R0 PRINTSPC<:25>"aB"fiSIC DATA"
109O PRINTSPC<25>"aa"JIT"
110R PR I NT : PR I NTSPC < 25 >" USE CURSOR"
1110 PP I NTSPC < 25 >" CONTROL TO"
1 1 20 PP I NTSPC < 25 > VOS I T I ON
"
1130 PR I NTSPC < 25 > "CURSOR. "
1140 RETURN