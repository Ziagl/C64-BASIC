10 REM *********************
20 REM ***               ***
30 REM *** WORD SCRAMBLE ***
40 REM ***               ***
50 REM *********************
60 REM
70 GOSUB 1000
80 GOSUB 2000
90 GOSUB 3000
100 END
1000 REM
1010 REM *** VORBEREITUNGEN ***
1020 REM
1030 PRINT "{clear}{down*2}";TAB(13);"word scramble"
1040 PRINT "{down*2}sie kuennen waehlen zwischen :"
1050 PRINT "{down}{space*5}1) sehr leicht"
1060 PRINT "{space*5}2) leight"
1070 PRINT "{space*5}3) mittelschwer"
1080 PRINT "{space*5}4) schwer"
1090 PRINT "{space*5}5) sehr schwer"
1100 INPUT "{down*2}ihre wahl (1-5) ";AN
1110 IF AN<1 OR AN>5 THEN GOTO 1100
1120 DIM WO$(100)
1130 FOR I=1 TO 100
1140 :READ WO$(I)
1150 NEXT I
1170 DATA see, uhr, wut, mut, ihr, wand, sie, eis, bad, lid
1180 DATA name, rot, tor, weil, ich, tee, gut, tuer, drei, lieb
1185 REM ******************************
1190 DATA gras, bart, wind, rund, lied, blau, park, tief, ball, haar, hart
1200 DATA hoch, auge, grau, maus, raus, ring, sehr, bild, schild
1205 REM ******************************
1210 DATA fenster, garten, strauss, vogel, zange, hammer, schraube, platte
1220 DATA wolle, kleber, schere, feuer, stift, kaktus, blume, lanze
1230 DATA katze, pfeife, feuer, stift
1235 REM ******************************
1240 DATA original, computer, floppy, diskette, software, haushalt, magazine
1250 DATA pflanze, natur, schirme, naehfaden, telephon, schacht, armband
1260 DATA ueberschrift, apfelmus, kaesekuchen, system, aquarell, personal
1265 REM ******************************
1270 DATA kreisumfang, athleten, enthalten, taschenuhr, schatztruhe, buttermilch
1280 DATA blumenvase, mechanismus, projektion, wollknaeuel, kamillentee
1290 DATA computerpapier, asessor, heftklammer, tastatur, strausseneier
1300 DATA ueberweisung, bankrott, diskettenhuelle, hausschluessel
1310 DIM WR$(15), WF(15), WK$(15)
1320 RETURN
2000 REM
2010 REM *** SPIEL ***
2020 REM
2030 WO=(AN-1)*20+INT(RND(1)*20)+1
2040 WL=LEN(WO$(WO))
2050 FOR I=1 TO WL
2060 :WR$(I)=MID$(WO$(WO),I,1)
2070 :WF$(I)=WR$(I)
2080 NEXT I
2090 FOR I=1 TO WL
2100 :TX=INT(RND(1)*WL)+1
2110 :H$=WF$(I)
2120 :WF$(I)=WF$(TX)
2130 :WF$(TX)=H$
2140 NEXT I
2150 PRINT "{clear}{down*2}";TAB(13);"word scramble"
2160 PRINT "{down*3}hier ist ihr wort: :{down*2}"
2170 PRINT TAB(10);
2180 FOR I=1 TO WL
2190 :PRINT WF$(I);
2200 NEXT I
2210 PRINT:PRINT TAB(10);"{down}";
2220 FOR I=1 TO WL
2230 :PRINT "-";
2240 NEXT I
2250 PRINT:PRINT "{down*4}bitte ein buchstabe von a bis z"
2260 PRINT "{return}, wenn fertig ..."
2270 DG=DG+1
2280 FOR I=250*AN TO 1 STEP -1
2290 :IF PEEK(197)<>64 THEN GOTO 2350
2300 :IF INT(I/50)*50<>I THEN GOTO 2330
2310 :POKE 211,25:POKE 214,8:SYS 58640
2320 :PRINT "zeit :";INT(I/50);"{left}{space*2}"
2330 NEXT I
2340 RETURN
2350 POKE 211,9+DG:POKE 214,11:SYS 58640
2360 GET AN$:IF AN$="" THEN GOTO 2300
2370 IF ASC(AN$)=20 THEN GOTO 2460
2380 IF ASC(AN$)=21 THEN GOTO 2500
2390 IF ASC(AN$)=13 THEN GOTO RETURN
2400 IF AN$<"a" OR AN$>"z" THEN AN$="-"
2410 WK$(DG)=AN$
2420 PRINT AN$;
2430 DG=DG+1
2440 IF DG>WL THEN DG=1
2450 GOTO 2300
2460 IF WK$(DG)="" THEN PRINT "-";:GOTO 2480
2470 PRINT WK$(DG)
2480 DG=DG-1:IF DG-1 THEN DG=WL
2490 GOTO 2300
2500 IF WK$(DG)="" THEN PRINT "-";:GOTO 2520
2510 PRINT WK$(DG);
2520 DG=DG+1:IF DG>WL THEN DG=1
2530 GOTO 2300
3000 REM
3010 REM *** ENDE ***
3020 REM
3030 FOR I=1 TO WL
3040 :POKE 211,9+I:POKE 214,11:SYS 58640
3050 :PRINT WR$(I);
3060 :IF WK$(I)=WR$(I) THEN WK=WK+1
3070 NEXT I
3080 IF WK<>WL THEN GOTO 3130
3090 PRINT:PRINT "{down*4}gratuliere !!{space*18}"
3100 PRINT "sie haben das wort erraten !"
3120 GOTO 3160
3130 PRINT:PRINT "{down*4}das spiel ist beendet. ende der";WL
3140 PRINT "buchstaben.{space*14}{down}"
3150 PRINT WK;"davon wurden erreicht."
3160 PRINT "{down}moechten sie noch einmal ?"
3170 GET AN$:IF AN$="" THEN GOTO 3170
3180 IF AN$="j" THEN RUN
3190 RETURN