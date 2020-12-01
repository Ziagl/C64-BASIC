10 REM ****************
20 REM ***          ***
30 REM *** MINIGOLF ***
40 REM ***          ***
50 REM ****************
60 REM
70 GOSUB 1000
80 GOSUB 2500
90 GOSUB 3700
100 END
1000 REM
1010 REM *** VORBEREITUNGEN ***
1020 REM
1030 DIM HA(5,5)
1040 FOR I=1 TO 5
1050 :FOR J=1 TO 5
1060 : READ HA(I,J)
1070 :NEXT J
1080 NEXT I
1090 DATA 0,0,0,0,2
1100 DATA 1,0,0,0,3
1110 DATA 0,1,0,0,3
1120 DATA 1,1,0,0,3
1130 DATA 1,0,1,0,3
1180 DIM RI(8,2)
1190 FOR I=1 TO 8
1200 :READ RI(I,1), RI(I,2)
1210 NEXT I
1220 DATA 0,-1,-1,-1,-1,0,-1,1
1230 DATA 0,1,1,1,1,0,1,-1
1240 DIM V(8)
1250 FOR I=1 TO 8
1260 :READ V(I)
1270 NEXT I
1280 DATA -40,-41,-1,39,40,41,1,-39
1300 DEF FN FA(X)=PEEK(55296+BX+40*BY+X) AND 15
1310 DEF FN BS(X)=PEEK(1024+BX+40*BY+X)
1320 RETURN
1350 REM ***************** PLATZ 1
1360 GOSUB 1300
1370 PRINT "{home}"
1380 PRINT TAB(10);"{black)DIIIIIIIIIIIIIIIIIIIIIF"
1390 FOR I=1 TO 15
1400 :PRINT TAB(10);"{reverse on}K{green}{space*18}{reverse off}{black}K"
1410 NEXT I
1420 PRINT TAB(10);"C{reverse on}IIIIIIIIIIIIIIIIIIIII{reverse off}V"
1430 PRINT "{home}{down*4}";TAB(19);"{reverse on}{space}"
1440 BX=INT(RND(1)*17)+11:BY=16
1450 POKE 211,BX:POKE 214,BY:SYS 58640
1460 PRINT "{reverse on}{green}Q";
1470 RETURN
1480 REM ***************** PLATZ 2
1490 GOSUB 1300
1500 PRINT "{home)"
1510 PRINT TAB(8);"{black}DIIIIIIIIIIIIIIIIIIIIIF"
1520 FOR I=1 TO 5
1530 :PRINT TAB(8);"{reverse on}K{green}{space*24}{reverse off}{black)Y"
1540 NEXT I
1550 PRINT TAB(8);"{reverse on}K{green}{space*9}{blue}{space*3}{black}{space}IIIIIIIIIII{reverse off}V"
1560 PRINT TAB(8);"{reverse on}K{green}{space*8}{blue}{space*4}{reverse off}{black}K"
1570 PRINT TAB(8);"{reverse on}K{green}{space*7}{blue}{space*5}{reverse off}{black}K"
1580 PRINT TAB(8);"{reverse on}K{green}{space*8}{blue}{space*4}{black}{space}{reverse off}K"
1590 PRINT TAB(8);"{reverse on}K{green}{space*13}{reverse off}{black}K"
1600 FOR I=1 TO 6
1610 :PRINTTAB(8);"{reverse on}K{green}{space*13}{reverse off}{black}K"
1620 NEXT I
1630 PRINT TAB(8);'"C{reverse on}IIIIIIIIIIIIIII{reverse off}V"
1640 BX=INT(RND(1)*13)+9:BY=17
1650 POKE 211,BX:POKE 214,BY:SYS 58640
1660 PRINT "(reverse on){green}Q"
1670 PRINT "(home}{down*4}";TAB(30);"(reverse on}{black}{space}"
1680 RETURN
1690 REM ***************** PLATZ 3
1700 PRINT "(home)"
1710 PRINT TAB(20);"{black}DIIIIIIIIIIIIIIIIIIIIIF"
1720 FOR I=1 TO 5
1730 :PRINT TAB(20);"{reverse on}K{green}{space*13}{reverse off}{black}K"
1740 NEXT I
1750 PRINT TAB(8);"{reverse off}DIIIIIIIIIIIIII{reverse on}Y{green}{space*13}{reverse off}{black}K"
1760 PRINT TAB(8);"{reverse on}K{green}{space*22}{reverse off}{black}K"
1770 PRINT TAB(8);"{reverse on}K{green}{space*12}{yellow}{space*10}{reverse off}{black}K"
1780 PRINT TAB(8);"{reverse on}K{green}{space*11}{yellow}{space*11}{reverse off}{black}K"
1790 PRINT TAB(8);"{reverse on}K{green}{space*11}{yellow}{space*11}{reverse off}{black}K"
1800 PRINT TAB(8);"{reverse on}K{green}{space*12}{yellow}{space*4}{green}{space*6}{reverse off}{black}K"
1810 PRINT TAB(8);"{reverse on}K{green}{space*13}{black}IIIIIIII{reverse off}V"
1820 FOR I=1 TO 4
1830 :PRINT TAB(8)"{reverse on}K{green}{space*13}{reverse off}V"
1840 NEXT I
1850 PRINT TAB(8);"{reverse off}C{reverse on}IIIIIIIIIIIIIIIII{reverse off}V"
1860 PRINT "(home}{down*3}";TAB(32);"(reverse on){black}{space}"
1870 BX=INT(RND(1)*13)+9:BY=17
1880 POKE 211,BX:POKE 214,BY:SYS 58640
1890 PRINT "(green){reverse on}Q"
1900 RETURN
1910 REM ***************** PLATZ 4
1920 PRINT "(home)"
1930 PRINT TAB(7);"(black)DIIIIIIIIIIIIIIIIIIIIIIIIIIIIF"
1940 FOR I=1 TO 6
1950 :PRINT TAB(7);"{reverse on}K{green}{space*27}{reverse off}{black}K"
1960 NEXT I
1970 PRINT TAB(7);"{reverse on}K{green}{space*6}{black}DIIIIIIF{green}{space*14}{reverse off}{black}K"
1980 FOR I=1 TO 4
1990 :PRINT TAB(7);"{reverse on}K{green}{space*6}{black}{reverse off}{black}K{space*5}{reverse on}K{green}{space*14}{reverse off}{black}K"
2000 NEXT I
2010 PRINT TAB(7);"{reverse on}K{green}{space*6}{black}{reverse off}K{space*5}C{reverse on}IIIIIIIIIIIII{reverse off}V"
2100 FOR I=1 TO 3
2110 PRINT TAB(7);"{reverse on}K{green}{space*6}{black}{reverse off}K"
2120 NEXT I
2130 PRINT TAB(7);"C{reverse on}IIIIII{reverse off}V"
2140 PRINT "{home}{down*2}";TAB(18);"{yellow}{reverse on}{space*7}{down}{left*6}{space*6}{down}{left*4}{space}"
2150 PRINT TAB(25);"(blue}{reverse on}{space}{down}{left*3}{space*3}{down}{left*5}{space*6}"
2160 POKE 211,32:POKE 214,10:SYS 58640
2170 PRINT "(reverse on}{black}{space}"
2180 BX=INT(RND(1)*5)+9:BY=16
2190 POKE 211,BX:POKE 214,BY:SYS 58640
2200 PRINT "(reverse on}{green}Q"
2210 RETURN
2220 REM ********************** PLATZ 5
2230 PRINT "(home)"
2240 PRINT TAB(8);"{black}DIIIIIIIIIIIIIIF"
2250 FOR I=1 TO 4
2260 :PRINT TAB(8);"{reverse on}K{green}{space*12}{reverse off}{black}K"
2270 NEXT I
2280 PRINT TAB(8);"{reverse on}K{green}{space*12}{black}C{reverse off}IIIIIIIIIIIIIF"
2290 FOR I=1 TO 4
2300 :PRINT TAB(8);"{reverse on}K{green}{space*29}{black}{reverse off}K"
2310 NEXT I
2320 PRINT TAB(8);"{black}C{reverse on}IIIIIIIIIIIIIIF{green}{space*13}{black}{reverse off}K"
2330 FOR I=1 TO 5
2340 :PRINT TAB(24);"{reverse on}{black}K{green}{space*13}{black}{reverse off}K"
2350 NEXT I
2360 PRINT TAB(24);"{black}C{reverse on}IIIIIIIIIIIIII{reverse off}V"
2370 POKE 211,9:POKE 214,7:SYS 58640
2380 PRINT "{blue}{reverse on}{space*4}{down}{left*4}{space*4}{down}{left*4}{space*5}{down}{left*5}{space*6}"
2390 POKE 211,27:POKE 214,7:SYS 58640
2400 PRINT "{red}{reverse on}{space*7}{down}{left*6}{space*6}{down}{left*6}{space*7}{down}{left*7}{space*5}"
2410 POKE 211,13:POKE 214,4:SYS 58640
2420 PRINT "{reverse on}{black}{space}"
2430 BX=INT(RND(1)*13)+25:BY=16
2440 POKE 211,BX:POKE 214,BY:SYS 58640
2450 PRINT "{reverse on}{green}Q"
2460 RETURN
2500 REM
2510 REM *** SPIEL ***
2520 REM
2530 FOR HO=1 TO 5
2540 :BC$="(green)"
2550 :PRINT "{clr)";
2560 :ON HO GOSUB 1350,1480,1690,1910,2220
2570 :PRINT "{home}{reverse on}{light blue}loch #";HO;"PAR:";HA(HO,5);"schlaege:";SC
2580 :PRINT:PRINT "hindernis:"
2590 :IF HA(HO,1) THEN PRINT "wasser"
2600 :IF HA(HO,2) THEN PRINT "sand"
2610 :IF HA(HO,3) THEN PRINT "uneben"
2620 :IF HA(HO,4) THEN PRINT "bloecke"
2630 :PRINT:PRINT "{reverse on}{black}2 1 8"
2640 :PRINT "{reverse on)3 Q 7"
2650 :PRINT "{reverse on)4 5 6"
2660 :POKE 211,0:POKE 214,19:SYS 58640
2670 :FOR I=1 TO 5
2680 :PRINT "{space*39}"
2690 :NEXT I
2700 :POKE 211,0:POKE 214,20:SYS 58640
2710 :D$="":INPUT"richtung (1-8) ";D$
2720 :RI=VAL(D$)
2730 :IF RI>=1 AND RI<=8 THEN GOTO 2760
2740 :PRINT "bitte nur 1, 2, 3,..., 8 eingeben !"
2750 :GOTO 2700
2760 :POKE 211,0:POKE 214,19:SYS 58640
2770 :FOR I=1 TO 5
2780 :PRINT"{space*39}"
2790 :NEXT I
2800 :POKE 211,0:POKE 214,20:SYS 58640
2810 :D$="":INPUT "geschwindigkeit (0-5) ";D$
2820 :GS=VAL(D$)
2830 :IF GS>=0 AND GS<=5 THEN GOTO 2860
2840 :PRINT "bitte nur 0 bis 5 eingeben!"
2850 :GOTO 2800
2860 :UF=0
2870 :TF=0
2880 :X2=BX+RI(RI.1):Y2=BY+RI(RI.2)
2890 :D2=V(RI)
2900 :FA=FN FA(D2):IF FA<>5 OR FN BS(D2)<>160 THEN GOTO 2980
2910 :POKE 211,BX:POKE 214,BY:SYS 58640
2920 :PRINT BC$;"{reverse on}{space}";
2930 :BX=X2:BY=Y2
2940 :POKE 211,BX:POKE 214,BY:SYS 58640
2950 :PRINT "{reverse on}{green}Q";
2960 :BC$="{green}"
2970 :GOTO 3640
2980 :IF FA=0 AND FN BS(D2)<>160 THEN GOTO 3100
2990 :IF FA=6 THEN GOTO 3290
3000 :IF FA=7 THEN GOTO 3381
3010 :IF FA=2 THEN GOTO 3400
3020 :IF FA=0 THEN GOTO 3520
3100 :IF RI=1 OR RI=3 THEN RI=RI+4:GOTO 2880
3110 :IF RI=5 OR RI=7 THEN RI=RI-4:GOTO 2880
3120 :ON RI/2 GOTO 3130,3170,3210,3250
3130 :IF FN BS(D2+1)<>160 AND FN BS(D2+40)<>160 THEN RI=6:GOTO 2880
3140 :IF FN BS(D2+1)<>160 THEN RI=4:GOTO 2880
3150 :IF FN BS(D2+40)<>160THEN RI=8:GOTO 2880
3160 :RI=6:GOTO 2880
3170 :IF FN BS(D2+1)<>160 AND FN BS(D2-40)<>160 THEN RI=8:GOTO 2880
3180 :IF FN BS(D2+1)<>160 THEN RI=2:GOTO 2880
3190 :IF FN BS(D2-40)<>160 THEN RI=6:GOTO 2880
3200 :RI=8:GOTO 2880
3210 :IF FN BS(D2-1)<>160 AND FN BS(D2-40)<>160 THEN RI=2:GOTO 2880
3220 :IF FN BS(D2-1)<>160 THEN RI=8:GOTO 2880
3230 :IF FN BS(D2-40)<>160 THEN RI=4:GOTO 2880
3240 :RI=2:GOTO 2880
3250 :IF FN BS(D2-1)<>160 AND FN BS(D2+40)<>160 THEN RI=4:GOTO 2880
3260 :IF FN BS(D2-1)<>160 THEN RI=6:GOTO 2880
3270 :IF FN BS(D2+40)<>160 THEN RI=2:GOTO 2880
3280 :RI=4:GOTO 2880
3290 :IF TF THEN GOTO 3310
3300 :TF=3:SC=SC+1
3310 :POKE 211,BX:POKE 214,BY:SYS 58640
3320 :PRINT BC$;"{reverse on}{space}";
3340 :BX=X2:BY=Y2
3350 :POKE 211,BX:POKE 214,BY:SYS 58640
3360 :PRINT "{blue}{reverse on}Q";
3370 :BC$="{blue}"
3380 :GOTO 3640
3381 :IF TF THEN GOTO 3383
3382 :TF=3:SC=SC+1
3383 :POKE 211,BX:POKE 214,BY:SYS 58640
3384 :PRINT BC$;"{reverse on}{space}";
3385 :BX=X2:BY=Y2
3386 :POKE 211,BX:POKE 214,BY:SYS 58640
3387 :PRINT "{yellow}{reverse on}Q";
3388 :BC$="{yellow}"
3389 :GOTO 3640
3400 :IF UF THEN GOTO 3450
3410 :UF=1
3420 :RI=RI+INT(RND(1)*2)*2-1
3430 :IF RI=0 THEN RI=8
3440 :IF RI=9 THEN RI=1
3450 :POKE 211,BX:POKE 214,BY:SYS 58640
3460 :PRINTBC$;"{reverse on}{space}";
3470 :BX=X2:BY=Y2
3480 :POKE 211,BX:POKE 214,BY:SYS 58640
3490 :PRINT "{red}{reverse on}Q";
3500 :BC$="{red}"
3510 :GOTO 3640
3520 :POKE 211,BX:POKE 214,BY:SYS 58640
3530 :PRINT "{reverse on}{green}{space}"
3540 :POKE 211,X2:POKE 214,Y2: SYS58640
3550 :PRINT "{reverse on}{white}{space}";
3560 :PRINT "{left}{reverse on}{black}{space}";
3570 :RI=RI+INT(RND(1)*2)*2-1
3580 :IF RI=0 THEN RI=8
3590 :IF RI=9 THEN RI=1
3600 :GS=GS-0.5
3610 :IF GS>0 THEN X2=X2+RI(RI,1):Y2=Y2+RI(RI,2):GOTO 2890
3620 :SC=SC+1
3630 :GOTO3680
3640 :IF TF>0 THEN TF=TF-1:IF TF=0 THEN GOTO 3660
3650 :GS=GS-0.3:IF GS>0 THEN GOTO 2880
3660 :SC=SC+1:GOTO 2570
3670 :GET XS:IF XS="" THEN GOTO 3670
3680 NEXT HO
3690 RETURN
3700 REM
3710 REM *** ENDE ***
3720 REM
3730 PRINT "{clear}{down*3}{light blue}"
3740 PRINT "das spiel ist beendet."
3750 PRINT "{down}sie haben alles in allem";SC
3760 PRINT "schlaege benoetigt."
3770 PRINT "das sind {space*2}durchschnittlich";INT(SC/5*100)/100
3780 PRINT "schlaege pro bahn."
3790 PRINT "bis zum naechsten mal !"
3800 RETURN