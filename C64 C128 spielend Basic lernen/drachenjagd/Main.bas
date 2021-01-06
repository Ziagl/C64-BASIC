10 REM *******************
20 REM ***             ***
30 REM *** DRACHENJAGD ***
40 REM ***             ***
50 REM *******************
60 REM
70 GOSUB 1000
80 GOSUB 2000
90 END
1000 REM
1010 REM *** VORBEREITUNGEN ***
1020 REM
1030 PRINT "{clear}{down*2}";TAB(14);"drachenjagd"
1040 DIM MA(15,15)
1050 DEF FN R(X)=INT(RND(1)*X)+1
1060 DEF FN A(X)=0.001*INT(X*1000+0.5)
1100 REM ************** BETRETEN UNMOEGLICH
1110 FOR I=1 TO 20
1120 :X=FN R(15):Y=FN R(15)
1130 :IF MA(X,Y)<>0 THEN GOTO 1120
1140 :MA(X,Y)=1
1150 NEXT I 
1200 REM *********************** VERSETZUNG
1210 FOR I=1 TO 20
1220 :X=FN R(15):Y=FN R(15)
1230 :IF MA(X,Y)<>0 THEN GOTO 1220
1240 :MA(X,Y)=2
1250 NEXT I
1300 REM ************************** DYNAMIT
1310 X=FN R(15):Y=FN R(15)
1320 IF MA(X,Y)<>0 THEN GOTO 1310
1330 MA(X,Y)=3
1400 REM ************************** AUSGANG
1410 XN=FN R(15):YN=FN R(15)
1420 IF MA(XN,YN)<>0 THEN GOTO 1410
1430 MA(XN,YN)=4
1500 REM *************************** GRUSLI
1510 XG=FN R(15):YG=FN R(15)
1520 IF MA(XG,YG)<>0 THEN GOTO 1510
1530 MA(XG,YG)=5
1600 REM ************************** SPIELER
1610 XS=FN R(15):YS=FN R(15)
1620 IF MA(XS,YS)<>0 THEN GOTO 1610
1630 MA(XS,YS)=5
1640 SP=0:GR=0
1650 RETURN
2000 REM
2010 REM *** SPIEL ***
2020 REM
2030 GOSUB 3000
2040 GOSUB 3100
2050 IF WL THEN RETURN
2060 PRINT
2070 AN$="":INPUT "ziehen oder schiessen (z/s) ";AN$
2080 IF AN$<>"z" AND AN$<>"s" THEN GOTO 2070
2090 PRINT "vorwaerts, rueckwaerts,"
2100 INPUT "rechts oder links (v/u/l/r) ";RI$
2110 IF RI$<>"v" AND RI$<>"u" AND RI$<>"r" AND RI$<>"l" THEN GOTO 2100
2120 IF RI$="v" THEN X=0:Y=-1:GOTO 2160
2130 IF RI$="u" THEN X=0:Y=1:GOTO 2160
2140 IF RI$="r" THEN X=1:Y=0:GOTO 2160
2150 IF RI$="l" THEN X=-1:Y=0
2160 IF AN$="s" THEN GOTO 2500
2170 X=X+XS:Y=Y+YS
2180 IF X>=1 AND X<=15 AND Y>=1 AND Y<=15 THEN GOTO 2210
2190 PRINT "dieser zug liegt ausserhalb des bereichs."
2200 GOTO 2800
2210 IF MA(X,Y)<>1 THEN GOTO 2240
2220 PRINT "diese stelle koennen sie nicht betreten."
2230 GOTO 2800
2240 IF MA(X,Y)<>2 THEN GOTO 2280
2250 PRINT "sie werden irgendwohin versetzt ..."
2260 X=FN R(15):Y=FN R(15)
2265 IF MA(X,Y)=1 THEN GOTO 2260
2270 GOTO 2240
2280 IF MA(X,Y)<>3 THEN GOTO 2320
2290 PRINT "der zug ist zwar erlaubt, aber er kostet";
2300 PRINT "sie ihr leben, tja dynamit !"
2310 RETURN
2320 IF MA(X,Y)<>4 THEN GOTO 2370
2330 PRINT "zug ist erlaubt."
2340 PRINT "sie fanden den ausgang !"
2350 PRINT "somit sind sie endlich wieder frei !!!"
2360 RETURN
2370 IF MA(X,Y)<>5 THEN GOTO 2410
2380 PRINT "zug ist erlaubt."
2390 GOSUB 3110
2400 RETURN
2410 PRINT "zug ist erlaubt."
2420 MA(XS,YS)=SP
2430 XS=X:YS=Y
2440 SP=MA(XS,YS):MA(XS,YS)=6
2450 GOTO 2800
2500 SX=XS:SY=YS
2510 SX=SX+X:SY=SY+Y
2520 PRINT "zischhhhhhhhhhh";
2530 IF SX>=1 AND SX<=15 AND SY>=1 AND SY<=15 THEN GOTO 2570
2540 PRINT "wuschhhhhhhhhhh";
2550 PRINT "der schuss verliess das labyrinth."
2560 GOTO 2800
2570 IF MA(SX,SY)=0 OR MA(SX,SY)=2 OR MA(SX,SY)=3 OR MA(SX,SY)=4 THEN GOTO 2510
2580 IF MA(SX,SY)<>1 THEN GOTO 2630
2590 PRINT "duschhhhhhhhh !";
2600 PRINT "der pfeil prallte gegen eine mauer !"
2610 PRINT "grusi wurde nicht getroffen."
2620 GOTO 2800
2630 PRINT "ahhhhhhhhhhhh !"
2640 PRINT "sie haben grusi verletzt und von diesem feld gejagd."
2650 MA(SX,SY)=GR
2660 XG=FN R(15):YG=FN R(15)
2670 GR=MA(XG,YG):MA(XG,YG)=5
2800 REM ************************* GRUSI ZIEHT SELBER
2810 GOSUB 3000
2820 PRINT "{down}grusi zieht jetzt ..."
2830 GOSUB 3100
2840 IF WL THEN RETURN
2850 IF XS<XG THEN X=-1:Y=0:GOTO 2890
2860 IF XS>XG THEN X=1:Y=0:GOTO 2890
2870 IF YS<YG THEN X=0:Y=-1:GOTO 2890
2880 IF YS>YG THEN X=0:Y=1
2890 MA(XG,YG)=GR
2900 XG=XG+X:YG=YG+Y
2910 GR=MA(XG,YG):MA(XG,YG)=5
2920 GOTO 2030
3000 AG=FN A(SQR((XG-XS)^2 + (YG-YS)^2))
3010 AA=FN A(SQR((XS-XN)^2 + (YS-YN)^2))
3020 PRINT "{down}grusi ist";AG;"m weit weg."
3030 PRINT "{down}der ausgang ist";AA;"m weit weg."
3040 RETURN
3100 IF AG>=2 THEN RETURN
3110 PRINT "{down}{space}<<< schlabber >>>"
3120 PRINT "grusi wurde seinem namen gerecht und hat";
3130 PRINT "sie ganz gruselig aufgesaugt !"
3140 PRINT "sie haben wohl verloren !"
3150 WL=1:RETURN 
 