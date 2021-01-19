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
110 xl=0:yl=1:xg=16:se=21:xy=23:xx=29
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
470 if a$="S" then r=0:c=0:goto 340
480 if a$="S" then gosub 1150:goto 340
490 if a$="+" then 580
500 if a$="-" then 730
510 if a$="M" then 1210
520 if a$="B" then 1450
530 if a$="C" then 1400
540 if a$="X" then 900
550 if a$="N" and no-223<31 then no=no+1:goto 130
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
810 loc=sp*64
820 for i=loc to loc+62
830 read a:poke i,a
840 next i
850 goto 50
854 rem
855 rem set array with powers of two
856 rem
860 for i=0 to 7
870 a%(i)=2^i
880 next i
890 return
894 rem
895 rem input for expand
896 rem
900 print "SQQQQQQQQQQQQQQQQQ]]]]]]]]]]]]]]Renter x or y"
910 get a$:if a$<>"x" and a$<>"y" then 900
920 if a$="x" then 960
930 if peek(v+xy)=1 then poke v+xy,0:goto 980
940 poke v+xy,1
950 goto 980
960 if peek(v+xx)>=1 then poke v+xx,0:goto 980
970 poke v+xx,1
980 print "SQQQQQQQQQQQQQQQQ]]]]]]]]]]]       "
990 goto 340
994 rem
995 rem display control options
996 rem
1000 print "S"spc(26)"Rcontrols{cm @}"
1005 print spc(25)"sprite #R{cm @}" no-223
1010 print:print spc(25)"ERe{cm @}dit sprite #"
1020 print spc(25)"Rn{cm @}ext sprite #"
1030 print spc(25)"Rm{cm @}ove sprite"
1040 print spc(25)"Rc{cm @}olour change"
1050 print spc(25)"Rx{cm @}pand"
1060 print spc(25)"R+{cm @} add dot"
1070 print spc(25)"R-{cm @} remove dot"
1080 print spc(25)"Rb{cm @}asic data"
1090 print spc(25)"Rq{cm @}uit"
1100 print:print spc(25)"use cursor"
1110 print spc(25)"control to"
1120 print spc(25)"position"
1130 print spc(25)"cursor. "
1140 return
1144 rem
1145 rem clear present sprite
1146 rem
1150 for i=0 to 62:poke no*64+i,0:next i
1160 for i=0 to 20
1170 for j=0 to 23
1180 poke 1064+i*40+j,46
1190 next j,i:r=0:c=0
1200 return
1204 rem
1205 rem move sprite around screen
1206 rem
1210 print "SQQQQQQQQQQQQQQQQQQQQQQQQQRuse cursor keys to move the sprite"
1220 print "Rreturn to return to editing"
1230 get a$:if a$="" then 1230
1240 if a$="]" and x<319 then x=x+2
1250 if a$="]" and x>1 then x=x-2
1260 if a$="Q" and y<254 then y=y+2
1270 if a$="W" and y>1 then y=y-2
1280 poke v+yl,V
1290 poke v+xg,in(x/255)
1300 poke v+xl,x-int(x/255)*255
1310 if a$=chr$(13) then 1330
1320 goto 1210
1330 poke v+xl,255
1340 poke v+yl,190
1350 poke v+xg,0
1360 x=255:y=190
1370 print "SQQQQQQQQQQQQQQQQQQQQQQ                     "
1380 print "                                           S"
1390 goto 340
1394 rem
1395 rem change sprite colour
1396 rem
1400 input "SQQQQQQQQQQQQQQQQQQQQQQ]]]]]]]]]]]]]]]]Rcolour (0-15)      IIIII";co
1410 if co<0 or co>15 then 1400
1420 poke v+sc,co
1430 print "SQQQQQQQQQQQQQQQQQQQQQ                     S";
1440 goto 340
1444 rem
1445 rem create data statements for
1446 rem present sprite
1447 rem
1450 print "SQQQ";peek(828)+30000;"data"right$(str$(no),len(str$(no))-1)
1460 poke 828,peek(828)+1:for i=0 to 8
1470 print peek(828)+30000"data";
1480 for j=0 to 6
1490 bb=peek(no*64+i*7+j)
1500 bb$=right$(str$(bb),len(str$(bb))-1)
1510 print bb$;",";
1520 next j
1530 print "I ":poke 828,peek(828)+1
1540 next i
1550 print peek(828)+30000;"data -1"
1560 print "run80S"
1570 poke 198,12
1580 for i=0 to 11:poke 631+i,13:next i
1590 poke 829,no:end
20000 data 223
20001 data 238,231,119,138,146,36,238
20002 data 226,38,40,162,36,232,151
20003 data 39,0,0,0,236,238,238
20004 data 138,68,169,202,68,174,138
20005 data 68,170,236,228,233,0,0
20006 data 0,0,0,0,0,234,0
20007 data 0,138,0,14,238,0,0
20008 data 162,0,0,226,0,0,0
20009 data 0,0,0,0,255,255,255
29997 rem
29998 rem sprint data stored from here
29999 rem
30001 data -1