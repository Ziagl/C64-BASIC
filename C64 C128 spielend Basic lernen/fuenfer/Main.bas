10 REM ****************************
20 REM ***                      ***
30 REM *** FUENF-IN-EINER-REIHE ***
40 REM ***                      ***
50 REM ****************************
60 REM
70 GOSUB 1000
80 GOSUB 2000
90 GOSUB 3000
100 END
1000 REM
1010 REM *** VORBEREITUNGEN ***
1020 REM
1030 PRINT "{clear}";TAB(6);"{reverse on}{space*2}1{space*3}2{space*3}3{space*3}4{space*3}5{space*3}6{space*3}7{space*2}"
1040 FOR I=1 TO 7
1050 :FOR J=1 TO 2
1060 : PRINT TAB(6);"{reverse on}{space}{reverse off}{space*3}{reverse on}{space}{reverse off}{space*3}{reverse on}{space}{reverse off}{space*3}";
1070 : PRINT "{reverse on}{space}{reverse off}{space*3}{reverse on}{space}{reverse off}{space*3}{reverse on}{space}{reverse off}{space*3}";
1080 : PRINT "{reverse on}{space}{reverse off}{space*3}{reverse on}{space}{reverse off}"
1090 :NEXT J
1100 :PRINT TAB(6);"{reverse on}{space*29}"
1110 NEXT I
1120 PRINT "{up}";TAB(6);"{reverse on}{space*2}1{space*3}2{space*3}3{space*3}4{space*3}5{space*3}6{space*3}7{space*2}"
1130 Z$(1)="{Q*3}"
1140 Z$(2)="***"
1150 C(1)=15
1160 C(2)=42
1170 DEF FN X(X)=(X-1)*4+7
1180 DEF FN Y(X)=(X-1)*3+1
1190 DEF FN BS(X)=PEEK(1024+X)
1200 POKE 53280,14:POKE 53281,6
1210 RETURN
2000 REM
2010 REM *** SPIEL ***
2020 REM
2030 POKE 211,0:POKE 214,22:SYS 58640
2050 PRINT "{space*40}"
2070 P=1
2080 INPUT "{light blue}{up}ihr zug (spalte 1-7) ";AN
2090 IF AN>0 AND AN<8 THEN GOTO 2130
2110 PRINT "bitte eine zahl zwischen 1 und 7{up*2}"
2120 GOTO 2080
2130 SX=FN X(AN)
2140 IF FN BS(SX+40)=32 THEN GOTO 2180
2160 PRINT "diese zeile ist schon voll !{up*2}"
2170 GOTO 2080
2180 PRINT "{space*34}";
2185 FOR J=1 TO 7
2190 :PRINT MID$("{black}{white}",P,1);
2200 :SY=FN Y(J)
2220 :POKE 211,SX:POKE 214,SY:SYS 58640
2230 :PRINT Z$(P);"{down}{left*3}";
2240 :PRINT Z$(P)
2250 :IF J=7 THEN GOTO 2320
2260 :LX=FN Y(J+1)
2270 :IF FN BS(SX+LX*40)<>32 THEN J=7:GOTO 2320
2290 :POKE 211,SX:POKE 214,SY:SYS 58640
2300 :PRINT "{space*3}{down}{left*3}";
2310 :PRINT "{space*3}"
2320 NEXT J
2330 FOR I=1 TO 7
2340 :FOR J=1 TO 3
2350 : FOR K=J TO J+4
2360 :  IX=FN X(I)
2370 :  KX=FN Y(K)
2380 :  IF FN BS(IX+KX*40)<>C(P) THEN K=J+4:NEXT K:GOTO 2410
2390 : NEXT K
2400 : RETURN
2410 :NEXT J
2420 NEXT I
2430 FOR J=1 TO 7
2440 :FOR I=1 TO 3
2450 : FOR K=I TO I+4
2460 :  KX=FN X(K)
2470 :  JX=FN Y(J)
2480 :  IF FN BS(KX+JX*40)<>C(P) THEN K=I+4:NEXT K:GOTO 2510
2490 : NEXT K
2500 : RETURN
2510 :NEXT I
2520 NEXT J
2530 IF P=2 THEN P=1:GOTO 2030
2540 POKE 211,0:POKE 214,23:SYS 58640
2550 PRINT "{space*40}";
2570 PRINT "{up}{light blue}mein zug ..."
2580 P=2
2590 AN=INT (RND(1)*7)+1
2600 SX=FN X(AN)
2610 IF FN BS(SX+40)<>32 THEN GOTO 2590
2620 GOTO 2180
3000 REM
3010 REM *** ENDE ***
3020 REM
3030 POKE 211,0:POKE 214,22:SYS 58640
3040 PRINT "{space*40}"
3050 PRINT "{space*40}"
3060 PRINT "{up*3}{light blue}das spiel ist beendet !!!"
3070 PRINT "gewonnen"
3080 IF P=1 THEN PRINT "haben sie !"
3090 IF P=2 THEN PRINT "habe ich !"
3100 RETURN