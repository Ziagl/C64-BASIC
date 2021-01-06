10 REM ********************
20 REM ***              ***
30 REM *** DRACHENSUCHE ***
40 REM ***              ***
50 REM ********************
60 REM
70 GOSUB 1000
80 GOSUB 2000
90 GOSUB 3000
100 END
1000 REM
1010 REM *** VORBEREITUNGEN ***
1020 REM
1030 PRINT "{clear}{down*2}";TAB(13);"drachensuche"
1040 DIM SA$(20), TR(20,4)
1050 FOR I=1 TO 20
1060 :READ A$,B$
1070 :SA$(I)=A$+B$
1080 NEXT I
1090 GOTO 1500
1100 DATA "sie befinden sich in einer niedrigen{space*4}hoehle. sie ist voll von"
1110 DATA "felsen und{space*5}gesteinstruemmern."
1120 DATA "sie muessen tief gebueckt weitergehen - fast schon kriechen. schutt"
1130 DATA " und muell{space*3}versperren ihnen den weg."
1140 DATA "der boden der hoehle ist glitschig und{space*2}steil. sie muessen auf"
1150 DATA " allen vieren{space*5}kriechen."
1160 DATA "sie muessen sich zwischen riesigen{space*6}stalagniten durchzwaengen;"
1170 DATA " ihre kleidung haengt ihnen schon in fetzen vom leib!"
1180 DATA "sie erreichen einen runden saal mit{space*5}mehreren"
1190 DATA " ausgaengen."
1200 DATA "nebel zieht auf. ploetzlich verlischt{space*3}"
1210 DATA "ihr licht - gefahr !!!!!!"
1220 DATA "ein schweres erdbeben muss die hoehle{space*3}mitgenommen haben, da "
1230 DATA "gesteinstruemmer{space*3}auf dem boden liegen."
1240 DATA "sie kommen an einen wassergraben und{space*4}muessen durchschwimmen -"
1250 DATA " sie erreichen{space*2}das andere ufer nur mit letzter muehe !"
1260 DATA "sie kommen in einen hohen saal - in der mitter erkennen sie einen"
1270 DATA " riesigen felsen"
1280 DATA "ein loch in der decke laesst einen{space*6}fahlen lichtschein"
1290 DATA " durchfallen."
1300 DATA "sie sehen ein loch in der wand - licht{space*2}faellt{space*2}hindurch."
1310 DATA " sie kommen aber nicht hindurch: das loch ist einfach zu eng."
1320 DATA "ihr magen knurrt - beim naechsten{space*7}wassertrinken fallen sie"
1330 DATA " vor{space*12}erschoepfung in den unterirdischen{space*6}wasser lauf."
1340 DATA "auf einmal finden sie eine angezuendete kerze - ab sofort"
1350 DATA " wird ihr weg wieder{space*3}hell erleuchtet!"
1360 DATA "ein rinnsal sickert aus einer ritze in{space*2}der"
1370 DATA " felswand."
1380 DATA "sie sind in einem gewundenen stollen.{space*3}der boden ist"
1390 DATA " schluepfrig und mit rissen ueberzogen."
1400 DATA "der gang ist sehr schmal und niedrig.{space*3}sie muessen"
1410 DATA " sich durchzwaengen."
1420 DATA "giftige daempfe bedrohen sie. sie laufen gefahr,"
1430 DATA " ohnmaechtig zu werden."
1440 DATA "die decke des stollens senkt sich"
1450 DATA " immer tiefer - sie muessen darunter{space*11}durchkriechen."
1460 DATA "sie sind in einem steil abfallenden{space*5}stollen."
1470 DATA " der stollen wird immer enger."
1480 DATA "sie riechen den mundgeruch des drachens -"
1490 DATA " es stinkt entsetzlich !!!!"
1500 DEF FN R(X)=INT(RND(1)*X)+1
1510 FOR I=1 TO 20
1520 :F=0
1530 :FOR J=1 TO 4
1540 : IF FN R(3)=2 OR TR(I,J) THEN GOTO 1580
1550 : SA=FN R(20):IF SA=I THEN GOTO 1530
1560 : RI=FN R(4):IF TR(SA,RI) THEN GOTO 1530
1570 : TR(I,J)=SA
1580 : TR(SA,RI)=I
1590 : F=F+TR(I,J)
1600 :NEXT J
1610 :IF F=0 THEN GOTO 1520
1620 NEXT I
1630 SI=FN R(20)
1640 UG=FN R(20):IF UE THEN UG=-1
1650 EX=FN R(20)
1660 B1=FN R(20)
1670 B2=FN R(20)
1680 P1=FN R(20)
1690 P2=FN R(20)
1700 RETURN
2000 REM
2010 REM *** SPIEL ***
2020 REM
2030 PRINT:PRINT SA$(SI)
2040 FOR I=1 TO 4
2050 :CO=TR(SI,I)
2060 :IF CO=EX THEN PRINT "der ausgang ist ganz nahe ..."
2070 :IF CO=UG THEN PRINT "ich rieche das ungeheuer !!!"
2080 :IF CO=B1 OR CO=B2 THEN PRINT "schluerf ... schluerf ... schluerf"
2090 :IF CO=P1 OR CO=P2 THEN PRINT "ich spuere einen luftzug !!!"
2100 NEXT I
2110 IF FN R(15)=4 THEN PRINT "*** erdbe.b..en ***":GOSUB 1620:GOTO 2000
2120 PRINT:AN$=""
2130 INPUT "m)arschieren oder s)chiessen ";AN$
2140 IF AN$="m" THEN GOTO 2200
2150 IF AN$="s" THEN GOTO 2400
2160 PRINT "bitte nur m oder s eingeben !":GOTO 2130
2200 AN$=""
2210 INPUT "welche richtung ";AN$
2230 GOSUB 2900:IF I=0 THEN GOTO 2200
2240 IF TR(SI,I)=0 THEN PRINT "der weg ist versperrt ...":GOTO 2000
2250 PRINT "ok..."
2260 SI=TR(SI,I)
2270 IF SI=EX THEN WL=0:RETURN 
2280 IF SI=UG THEN WL=1:RETURN
2290 IF SI=P1 OR SI=P2 THEN WL=2:RETURN
2300 IF SI<>B1 AND SI<>B2 THEN GOTO 2000
2310 PRINT "die fledermaeuse greifen an !!!"
2320 PRINT "sie werden hochgehoben !"
2330 PRINT "...wo sind sie gelandet ??"
2340 SI=FN R(20):GOTO 2000
2400 AN$=""
2410 INPUT "in welche richtung ";AN$
2420 GOSUB 2900:IF I=0 THEN GOTO 2400
2430 IF TR(SI,I) THEN GOTO 2460
2440 PRINT "klong !!"
2450 PRINT "der pfeil ist von der wand abgeprallt.":GOTO 2000
2460 IF TR(SI,I)<>UG THEN GOTO 2510
2470 PRINT "ahhhh !"
2480 PRINT "sie haben ein ungeheuer erlegt !"
2490 PRINT "finden sie den ausgang ..."
2500 UE=1:UG=-1:GOTO 2000
2510 PRINT "ihr pfeil hat das ungeheuer verfehlt !":GOTO 2030
2900 AN$=LEFT$(AN$,1):I=0
2910 IF AN$="n" THEN I=1:RETURN
2920 IF AN$="o" THEN I=2:RETURN
2930 IF AN$="s" THEN I=3:RETURN
2940 IF AN$="w" THEN I=4:RETURN
2950 PRINT "bitte nur n,s,w order o eingeben !"
2960 RETURN
3000 REM
3010 REM *** ENDE ***
3020 REM
3030 IF WL<>0 OR UE<>1 THEN GOTO 3060
3040 PRINT "sie haben den ausgang mit ihrem unge-"
3050 PRINT "heuer erreicht. sie werden heute eine {space*3}gut mahlzeit geniessen !"
3055 RETURN
3060 IF WL<>0 THEN GOTO 3090
3070 PRINT "sie haben den ausgang erreicht - leider"
3080 PRINT "ohne{space*2}ungeheuer. sie muessen heute wohl hungern.":RETURN
3090 IF WL=2 THEN GOTO 3120
3100 PRINT "sie sind dem ungeheuer direkt{space*2}in die"
3110 PRINT "arme gelaufen. es hat sie gefressen.":RETURN
3120 PRINT "sie sind in einen tiefen abgrund"
3130 PRINT "gestuerzt - und wurden nie mehr gesehen":RETURN