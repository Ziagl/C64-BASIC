1000 rem ****************************************
1010 rem * this program is a sketching multi-   *
1020 rem * colour pallet. it allows you to plot *
1030 rem * points on the screen using the       *
1040 rem * cursor keys in multi colout mode.    *
1050 rem * there are two sections of the program*
1060 rem * they are as follows:                 *
1070 rem *   command section: in this section,  *
1080 rem * the user can define which colour to  *
1090 rem * which 'paint brush', exit program, or*
1100 rem * choose to plot points.               *
1110 rem *   define colours is selected by      *
1120 rem * pressing 'f1', move the cursor over  *
1130 rem * the pallet using the keys            *
1140 rem * cursor right to move it to the richt *
1150 rem * cursor down  to move it to the left  *
1160 rem * when the cursor is in position,      *
1170 rem * pressing 'f3' selects that colour.   *
1180 rem * then one of keys 1,2,3 are pressed to*
1190 rem * set that colout ot that brush.       *
1200 rem *   the second section is the plot     *
1210 rem *   to plot points, press the key 'p'  *
1220 rem * points section.                      *
1230 rem * a brush may be selected at any time  *
1240 rem * by pressing the corresponding key.   *
1250 rem * the cursor keys move the hires cursor*
1260 rem * to exit plot mode, press the return  *
1270 rem * key.                                 *
1280 rem *   to exit the program completely,    *
1290 rem * press return when in command mode    *
1300 rem *                                      *
1310 rem * this program uses multi-colour       *
1320 rem * hi-res machine code routines.        *
1330 rem ****************************************
1340 b=8192
1350 input "screen colour";n
1360 sys(28672),n,n
1370 def fn p(zz)=b+int(x/8)*8+int(y/8)*320+(y and 7)
1380 def fn k(zz)=55296+int(x/8)+int(y/8)*40
1390 gosub 1970:gosub 1870
1395 print "test"
1400 get a$:if a$="" then 1400
1410 if a$="{f1}" then 1490
1420 if a$=chr$(13) then 1950
1430 if a$="0" then br=0
1440 if a$="1" then br=1
1450 if a$="2" then br=2
1460 if a$="3" then br=3
1470 if a$="p" then 1670
1480 goto 1400
1490 i=0
1500 y=192:x=i*16+40
1510 poke fn k(0),n
1520 for j=1 to 50
1530 get a$:if a$<>"" then 1550
1540 next j
1550 poke fn k(0),i
1560 if a$="{left}" then i=i-1
1570 if a$="{right}" then i=i+1
1580 if a$="{f3}" then cl=i:poke fn k(0),i:goto 1620
1590 if i<0 then i=0
1600 if i>15 then i=15
1610 goto 1500
1620 get a$:if a$="" then 1620
1630 if a$="1" then col(1)=cl
1640 if a$="2" then col(2)=cl
1650 if a$="3" then col(3)=cl
1660 gosub 1870:goto 1400
1670 x=xx:y=yy
1680 poke 828,0:sys(28928),x,y
1690 get a$
1700 poke 828,br:poke 829,col(br):sys(28928),x,y
1710 if a$="" then 1680
1720 if a$="0" then br=0:goto 1680
1730 if a$="1" then br=1:goto 1680
1740 if a$="2" then br=2:goto 1680
1750 if a$="3" then br=3:goto 1680
1760 if a$="{up}" then y=y+1
1770 if y>183 then y=183
1780 if a$="{down}" then y=y-1
1790 if y<0 then y=0
1800 if a$="{right}" then x=x+2
1810 if x>319 then x=319
1820 if a$="{left}" then x=x-2
1830 if x<0 then x=0
1840 if a$=chr$(13) then xx=x:yy=y:goto 1400
1850 poke 828,br:poke 829,col(br):sys(28928),x,y
1860 goto 1680
1870 for i=1 to 3
1880 y=184:x=16*i+48
1890 poke fn r(0),col(i)
1900 for j=0 to 7
1910 poke fn p(0),255
1920 y=y+1:next j
1930 next i
1940 return
1950 poke 53265,27:poke 53272,21
1960 poke 53270,200:poke 53281,6:print "S":end
1970 for i=0 to 15
1980 x=16*i+40
1990 y=192:poke fn k(0),i
2000 for j=0 to 7
2010 poke fn p(0),255
2020 y=y+1
2030 next j
2040 next i
2050 return