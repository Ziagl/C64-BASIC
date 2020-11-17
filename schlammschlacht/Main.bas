10 REM ***********************
20 REM ***                 ***
30 REM *** SCHLAMMSCHLACHT ***
40 REM ***                 ***
50 REM ***********************
60 REM
70 GOSUB 1000
80 GOSUB 2000
90 GOSUB 3000
100 END
1000 REM
1010 REM *** VORBEREITUNGEN ***
1020 REM
1030 PRINT "{clear}"
1040 RX=INT(RND(1)*2)+1
1050 RY=INT(RND(1)*2)-1
1060 X=INT(RND(1)*3000)
1070 Y=INT(RND(1)*3000)
1080 IF RX=1 THEN X=-X
1090 IF RY=1 THEN Y=-Y
1100 UR=3.1415926536/180
1110 RETURN
2000 REM
2010 REM *** SPIEL ***
2020 REM
2030 PRINT "{clear}{down}{down}{down}";TAB(8);"*** schlammschlacht ***":DG=DG+1
2040 PRINT "{down}{down}der drache grisi hat die koordinaten:"
2050 PRINT "x-richtung:";X
2060 PRINT "y-richtung:";Y
2070 PRINT "{down}welche hoehe fuer den wurf ?"
2080 INPUT "1-90 ";WH
2090 IF WH<1 OR WH>90 THEN GOTO 2080
2100 PRINT "{down}in welchem winkel soll abgeworfen"
2110 INPUT "werden ? (0-360) ";WW
2120 IF WW<0 OR WW>360 THEN GOTO 2110
2130 AB=ABS(INT(9000*SIN(WH*UR)*COS(WH*UR)))
2140 XW=INT(AB*SIN(WW*UR))
2150 YW=INT(AB*COS(WW*UR))
2160 AS=INT(SQR((X-XW)^2+(Y-YW)^2))
2170 PRINT "{down}{down}ihr schlammball traf folgende koordi-"
2180 PRINT "naten:"
2190 PRINT "x-richtung:";XW
2200 PRINT "y-richtung:";YW
2210 PRINT "der abstand zum drachen betraegt demnach"
2220 PRINT AS;"meter."
2230 GET A$:IF A$="" THEN GOTO 2230
2240 IF AS<1000 THEN RETURN
2250 GOTO 2030
3000 REM
3010 REM *** ENDE ***
3020 REM
3030 PRINT "{clear}{down}{down}sie benoetigten";DG;"versuche, um grisi"
3040 PRINT "zu treffen."
3050 IF DG<10 THEN GOTO 3080
3060 PRINT "grisi ist etwas enttaeuscht von ihren"
3070 PRINT "wurfkuensten, dennoch gibt er ihnen nocheine weitere chance."
3080 PRINT "wollen sie grisi noch einmal den gefal-"
3090 PRINT "len erweisen und ihn 'einseifen'?"
3100 GET AN$:IF AN$<>"j" AND AN$<>"n" THEN GOTO 3100
3110 IF AN$="j" THEN RUN
3120 RETURN