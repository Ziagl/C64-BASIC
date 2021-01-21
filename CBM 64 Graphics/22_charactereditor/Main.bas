1 rem character building
2 rem ***********************
3 rem
130 poke 53280,2:poke 53281,2
140 print "* character building *"
150 poke 828,0
160 run 170
170 cs=12288
175 poke 56334,peek(56334) and 254:poke 1,peek (1) and 251
180 for i=cs to cs+2047
190 poke i,peek(53248+i-cs)
200 next i
205 poke 1,peek (1) or 4:poke 56334,peek (56334) or 1
210 print "run 280"
220 print "run"
230 poke 198,3
240 poke 631,19
250 poke 632,13
260 poke 633,13
270 end
280 s=1024:cl=40
290 cs=12288
300 cr=0:ln=30000+peek(828)
310 p=24:bg=1:bg=1
320 poke 53280,2:poke 53281,2
330 def fn a(xx)=s+r*2*cl+2*c:rem screen poke location
340 def fn b(xx)=8*r+c:rem screen poke value for char
350 goto 1000
360 print "":gosub 1200
370 print "";:for i=0 to 7
380 print ". . . . . . . .";print
390 next i:f=0
400 print "S":r=0:c=0
410 z=fn a(0)
420 if f=0 then 460
430 if z=zl then 450
440 poke zl,il:zl=z:il=peek(zl)
450 poke z+54272,0
460 poke z+54272,0
470 get a$:if a$="" then 470
480 poke z+54272,1
490 rem
500 rem cursor control options
505 rem
510 if a$="q" then 1500
520 if a$="s" and c=7 then c=0:goto 410
530 if a$="v" then c=c+1:goto 410
540 if a$="!!" and c=0 then c=7:goto 410
550 if a$="" then c=c-1:goto 410
560 if a$="" and r=7 then r=0:goto 410
570 if a$="«" then r=r+1:goto 410
580 if a$="~l" and r=0 then r=7:goto 410
590 if a$="n" then r=r-1:goto 410
600 if a$="a" then 400
610 if f=1 then 600
695 rem
700 rem define new character options
705 rem
710 if a$="+" then poke z,81:goto 410
720 if a$="-" then POKE z,46:goto 410
730 if a$="=" then 1600
740 if a$="t" then 370
750 if a$="r" then 1000
768 if a$="b" then 2000
770 goto 410
795 rem
800 rem review character set options
805 rem
810 cr=fn b(0)
820 if a$="n" then poke 53272,21:goto 360
830 if a$="e" THEN POKE 53272,21:f=0:goto 1800
840 goto 410
995 rem
1000 rem display character set options
1005 rem
1010 poke 53272,(peek(53272) and 240)+12:r=4:c=0
1020 zl=fn a(0):il=32
1030 f=1:print " ";
1040 print " * a b c d e f g":print
1050 print "h i j k l m n o":print
1060 print "p q r s t u v w":print
1070 print "x y z [ {pound} ] ^ {arrow left}":print
1080 print "  ! "chr$(34)" # $ % & '":print
1090 print "< > * + , - . /":print
1100 print "0 1 2 3 4 5 6 7":print
1110 print "8 9 : ; < = > ?":print
1120 print " "spc(25)" options ":print
1130 print spc(22)" n new char ":print
1140 print spc(22)" e edit char ":print
1150 print spc(22)" q quit"
1160 bc=peek(55296)
1170 goto 410
1195 rem
1200 rem edit options
1205 rem
1210 print " "spc(25)" options ":print
1220 print
1230 print spc(p)" + add dot":print
1240 print spc(p)" - erase":print
1250 print spc(p)" = update":print
1260 print spc(p)" r review":print
1270 print spc(p)" q quit":print
1280 print spc(p)" b add data":print
1290 print spc(p+1)" statement"
1300 return
1495 rem
1500 rem quit
1505 rem
1510 rem
1520 poke 53272,21
1530 poke 53281,6:poke 53280,14
1540 print "bye!"
1550 end
1595 rem
1600 rem update
1605 rem
1610 print " ";
1620 x=cs+8*cr
1630 for r=0 to 7:sm=0
1640 for c=0 to 7:d=7-c
1650 sm=sm-2^d*(peek(fn a(0))=81)
1660 next c
1670 poke x+r,sm
1680 print src(17):sm:print
1690 next p:r=0:c=0
1700 goto 410
1795 rem
1800 rem edit char
1805 rem
1810 print " "
1820 x=cs+8*cr
1830 for r=0 to 7:y=peek(x+r)
1840 for c=0 to 7:z=fn a(0)
1850 q=46:y-y*2
1860 if y>255 then q=81:y=y-256
1870 poke z,q:poke z+54272,1
1880 next c,r
1890 r=0:c=0
1900 gosub 1200
1910 goto 410
1995 rem
2000 rem add data statements
2005 rem
2010 x=cs+8*cr
2020 print "QQQQQQQQQQQQQQ"
2030 print ln;"data";
2040 print right$(str$(x),len(str$(x))-1);
2050 for i=x to x+7
2060 print ",";
2070 print right$(str$(peek(i)),len(str$(peek(i)))-1);
2080 next i
2090 print:print "run"
2100 poke 828,peek(828)+1
2110 poke 198,9
2120 for i=0 to 8
2130 poke i+631,13
2140 next i
2160 end