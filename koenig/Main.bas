10 REM "**************"
20 REM "***        ***"
30 REM "*** KOENIG ***"
40 REM "***        ***"
50 REM "**************"
60 REM
70 GOSUB 1000
80 GOSUB 2000
90 GOSUB 3000
100 END
1000 REM
1010 REM *** VORBEREITUNGEN ***
1020 REM
1030 E=100
1040 EI=5
1050 T=0
1060 GG=4000:RG=300
1070 LG=GG-RG
1080 J=0
1090 L=1000:DIM JZ$(15)
1100 FOR A=1 TO 15:READ JZ$(A):NEXT A
1110 DATA ersten, zweiten, dritten, vierten, fuenften
1120 DATA sechsten, siebten, achten, neunten, zehnten, elften
1130 DATA zwoelften, dreizehnten, vierzehnten, fuenfzehnten
1140 RETURN
2000 REM
2010 REM *** SPIEL ***
2020 REM
2030 J=J+1
2040 PRINT "{clear}{down}";TAB(15);"{reverse on} koenig {reverse off}"
2050 PRINT "{down}{down}jahresbericht fuer den koenig:"
2060 PRINT "{down}wir befinden uns im ";JZ$(J);" jahr."
2070 PRINT "{down}{down}in diesem jahr wurden:{down}"
2080 PRINT E;TAB(6);"einwohner registriert"
2090 PRINT EI;TAB(6);"einwanderer aufgenommen"
2100 PRINT T;TAB(6);"personen beerdigt"
2110 PRINT TAB(6);"{down}von deinen";L;"km^2 land{down}"
2120 PRINT GG;TAB(6);"kg getreide geerntet;"
2130 PRINT RG;TAB(6);"haben die ratten gefressen."
2140 PRINT LG;TAB(6);"kg sind noch uebrig."
2150 PRINT TAB(6);"{down}{down}bitte eine taste druecken !"
2160 GET A$:IF A$="" THEN GOTO 2160
2170 IF J=15 THEN RETURN
2180 LP=INT (RND(1)*27)+1
2190 PRINT "{clear}{down}{down}{down}landpreis:";LP;"kg getreide"
2200 PRINT "getreidevorrat:";LG;"kg"
2210 PRINT "{down}{down}wie viele km^2 land moechten sie dazu-"
2220 PRINT "kaufen ? derzeitiger besitz:";L;"km^2"
2230 AN=0:INPUT "in km^2 ";AN
2240 IF AN*LP<LG THEN GOTO 2260
2250 PRINT "schulden duerfen sie keine machen !":GOTO 2230
2260 IF AN>0 THEN L=L+AN:LG=LG-AN*LP
2270 PRINT "{down}neuer getreidevorrat:";LG;"kg"
2280 PRINT "{down}wieviel davon soll an die";E
2290 PRINT "einwohner verteilt werden ?"
2300 AN=0:INPUT "in kg ";AN
2310 IF AN>LG THEN PRINT "soviel haben sie gar nicht !":GOTO 2300
2320 IF AN<10 THEN PRINT "die menschen werden verhungern !":GOTO 2300
2330 IF LG-AN<2 THEN PRINT "behalten sie einen  kleinen vorrat !":GOTO 2300
2340 LG=LG-AN
2350 PRINT "{down}neuer getreidevorrat:";LG;"kg"
2360 PRINT "{down}{down}bitte eine taste druecken ..."
2370 GET A$:IF A$="" THEN GOTO 2370
2380 T=INT (RND(1)*(0.5*E))
2390 IF T<0.4*E THEN GOTO 2510
2400 IF E=0 THEN RETURN
2410 PRINT "{clear}{down}{down}{down}tja, das tut mir wirklich sehr leid,"
2420 PRINT "aber sie sind das opfer eines aufstandes";
2430 PRINT "geworden, die aufgebrachten massen haben";
2440 PRINT "sie aus dem land gejagt."
2450 PRINT "die sterberate war mit";INT (T/E*1000)/10;"%"
2460 PRINT "etwas zu hoch."
2470 PRINT "{down}dabei war es dem volk wirklich egal, ob"
2480 PRINT "sie nun schuld daran waren oder nicht."
2490 PRINT "man brauchte eben einen suendenbock."
2500 GS=1:RETURN
2510 E=INT(RND(1)*(0.9*E))+E+EI
2520 EI=INT(RND(1)*9)
2530 GG=INT(RND(1)*5*L)
2540 RG=INT(RND(1)*(0.6*GG))
2550 LG=GG-RG+LG
2560 GOTO 2030
3000 REM
3010 REM *** ENDE ***
3020 REM
3030 IF GS=1 THEN RETURN
3040 PRINT "{clear}nach fuenfzahn jahren ihrer herrschaft"
3050 PRINT "bevoelkern";E;"einwohner ihr land."
3060 PRINT "angefangen haben sie mit 100 menschen."
3070 PRINT "das ergibt eine differenz von";E-100
3080 IF 100-E>0 THEN GOTO 3110
3090 PRINT "{down}pro jahr war das ein durchschnittlicher"
3100 PRINT "zuwachs von";(E-100)/15*100:GOTO 3130
3110 PRINT "pro jahr war das eine durchschnittliche"
3120 PRINT "abnahme von";(E-100)/15*100
3130 PRINT "{down}{down}ihr landsitz vergroesserte sich von"
3140 PRINT "1000 km^2 auf";L;"km^2"
3150 PRINT "{down}{down}ich hoffe, das spiel hat ihnen spass"
3160 PRINT "gemacht, beehren sie uns mit ihrer"
3170 PRINT "regierung bald wieder."
3180 RETURN