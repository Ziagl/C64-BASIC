10 REM ***************
20 REM ***         ***
30 REM *** WUERMLI ***
40 REM ***         ***
50 REM ***************
60 REM
70 GOSUB 1000
80 GOSUB 2000
90 GOSUB 3000
100 END
1000 REM
1010 REM *** VORBEREITUNGEN ***
1020 REM
1025 POKE 53280,0:POKE 53281,0
1030 PRINT "{clear}{blue}{reverse on}{space*40}{reverse off}";
1035 PRINT "{black}{space*40}";
1040 FOR I=1 TO 19
1050 :PRINT "{blue}{reverse on}{space}{reverse off}{black}{space*38}{blue}{reverse on}{space}";
1060 NEXT I
1070 PRINT "{reverse on}{space*40}";
1080 PRINT "{white}{reverse on}p)osition r)echts{space*3}l)inks h)och t)ief ";
1090 PRINT "{reverse on}z)eichnen w)loeschen n)neu a)usgang g)0{space}{home}";
1100 POKE 650,128
1110 FA$="{black}{white}{red}{cyan}{purple}{green}{blue}{yellow}{orange}{brown}{pink}{dark gray}{gray}{light green}{light blue}{light gray}"
1120 IX=1:IY=1:X2=1:Y2=1
1130 POKE 211,IX:POKE 214,IY:SYS 58640
1140 PRINT "{reverse on}{cyan}{space}";
1150 FR$="":FB$="{reverse on}{black}"
1160 GET AN$:IF AN$="" THEN GOTO 1160
1170 IF AN$="g" THEN GOTO 1300
1180 IF AN$="z" THEN GOTO 1350
1190 IF AN$="p" THEN GOTO 1400
1200 IF AN$="w" THEN GOTO 1450
1210 IF AN$="n" THEN GOTO 1500
1220 IF AN$="a" THEN GOTO 1550
1230 GOTO 1110
1300 REM ******************************************** GO
1310 RETURN
1350 REM ************************************** ZEICHNEN
1360 FR$="{blue}":GOTO 1600
1370 RETURN
1400 REM ************************************** POSITION
1410 FR$="":GOTO 1600
1450 REM ************************************** LOESCHEN
1460 FR$="{black}":GOTO1600
1500 REM ******************************************* NEU
1510 GOTO 1000
1550 REM *************************************** AUSGANG
1560 GOSUB 4000
1570 PRINT "moechten sie das spiel beenden (j/n) ?"
1580 GET AN$:IF AN$="" THEN GOTO 1580
1590 IF AN$="j" THEN END
1595 GOSUB 4000:GOTO 1080
1600 REM ************************************ RICHTUNGEN
1610 GET AN$:IF AN$="" THEN GOTO 1610
1620 IF AN$="r" THEN GOTO 1700
1630 IF AN$="t" THEN GOTO 1750
1640 IF AN$="l" THEN GOTO 1800
1650 IF AN$="h" THEN GOTO 1850
1660 GOTO 1170
1700 REM **************************************** RECHTS
1710 X2=IX+1:IF X2<39 THEN GOTO 1900
1720 X2=38:GOTO 1900
1750 REM ****************************************** TIEF
1760 Y2=IY+1:IF Y2<21 THEN GOTO 1900
1770 Y2=20:GOTO 1900
1800 REM ***************************************** LINKS
1810 X2=IX-1:IF X2>0 THEN GOTO 1900
1820 X2=1:GOTO 1900
1850 REM ****************************************** HOCH
1860 Y2=IY-1:IF Y2>0 THEN GOTO 1900
1870 Y2=1
1900 PRINT FR$;:IF FR$="" THEN PRINT FB$
1910 POKE 211,IX:POKE 214,IY:SYS 58640
1920 PRINT "{reverse on}{space}";
1930 FB$=MID$(FA$,1+(PEEK(55296+X2+40*Y2) AND 15),1)
1940 POKE 211,X2:POKE 214,Y2:SYS 58640
1950 PRINT "{cyan}{reverse on}{space}";
1960 IX=X2:IY=Y2:GOTO 1600
2000 REM
2010 REM *** SPIEL ***
2020 REM
2030 GOSUB 4000
2040 PRINT " <<< wuermli sucht sich seinen weg >>>";
2050 X2=1:Y2=1
2060 POKE 211,X2:POKE 214,Y2:SYS 58640
2070 PRINT "{green}S";
2080 PRINT FR$;:IF FR$="" THEN PRINT FB$
2090 POKE 211,IX:POKE 214,IY:SYS 58640
2100 PRINT "{reverse on}{space}";
2110 X3=1:Y3=0:RI=4
2120 XX=X2+X3:YY=Y2+Y3
2130 IF XX=0 AND YY=1 THEN RETURN
2140 IF XX=39 AND YY=1 THEN RETURN
2150 IF XX<1 OR XX>38 OR YY<1 OR YY>20 THEN GOTO 2180
2160 FA=PEEK(55296+XX+40*YY) AND 15
2170 IF FA=0 THEN GOTO 2230
2180 RI=RI-1:IF RI<1 THEN RI=4
2190 IF RI=4 THEN X3=1:Y3=0:GOTO 2120
2200 IF RI=3 THEN X3=0:Y3=1:GOTO 2120
2210 IF RI=2 THEN X3=-1:Y3=0:GOTO 2120
2220 IF RI=1 THEN X3=0:Y3=-1:GOTO 2120
2230 POKE 211,X2:POKE 214,Y2:SYS 58640
2240 PRINT "{reverse off}{white}{space}";
2250 X2=X2+X3:Y2=Y2+Y3
2260 POKE 211,X2:POKE 214,Y2:SYS 58640
2270 PRINT "{reverse off}{green}S";
2280 CL=CL+1:RI=RI+1:IF RI>4 THEN RI=1
2290 GOTO 2190
3000 REM
3010 REM *** ENDE ***
3020 REM
3030 POKE 211,X2:POKE 214,Y2:SYS 58640
3040 PRINT "{reverse on}{black}{space}";
3050 X2=X2+X3:Y2=Y2+Y3
3060 FOR K=1 TO 10
3070 :POKE 211,X2:POKE 214,Y2:SYS 58640
3080 :PRINT "{green}{reverse off}S";
3090 :PRINT "{left}{black}{space}";
3100 NEXT K
3120 GOSUB 4000
3130 IF X2<>39 THEN GOTO 3170
3140 PRINT "{down}{white}{space}<<< wuermli hat den weg gefunden >>>"
3150 PRINT "er fand den ausgang in";CL;"click ..."
3160 RETURN
3170 PRINT "wuermli findet den ausgang nicht."
3180 PRINT "er steht wieder am anfang ..."
3190 return
4000 REM
4010 REM *** LOESCHEN DER UNTEREN ZEILEN ***
4020 REM 
4030 POKE 211,0:POKE214,22:SYS 58640
4040 PRINT "{space*40}";
4050 PRINT "{space*40}";
4060 PRINT "{up*2}";
4070 RETURN