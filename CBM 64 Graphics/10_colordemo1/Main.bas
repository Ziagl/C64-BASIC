10 rem you can remove all rems
20 rem * set to lower case and set variables
30 poke 53272,23:zz=53281:x=54272
40 print "         ********    demo    ********"
50 rem * switch to extended colour mode
60 poke 53265, peek (53265) or 64
70 for d=1 to 500:next:rem * delay loop
80 rem a2$="shift spaces four shift spaces"
90 rem a4$="shift spaces changing colours shift spaces"
100 a1$="commodore color power on you 64"
110 a2$="{sh space}{dark gray}{sh space}"
120 a3$="          background             "
130 a4$="{sh space}{pink}{sh space}"
140 rem * set background colour registers
150 poke zz,9
160 poke zz+1,4
170 poke zz+2,7
180 poke zz+3,0
190 for d=1 to 1000:next:rem * delay loop
200 rem * loop to set back and fore colours
210 for i=0 to 100
220 rem * set current character colour 
230 poke 646,(i+4) and 15
240 if (i and 3)=0 then print a1$
250 if (i and 3)=1 then print a2$
260 if (i and 3)=2 then print a3$
270 if (i and 3)=4 then print a4$
280 poke zz,i
290 poke zz+1,i+2
300 poke zz+2,i+3
310 poke zz+3,i+1
320 for d=1 to 100:next
330 next
340 for g=0 to 3:poke zz+g,15:next
350 for d=0 to 3000:next
360 for i=0 to 70
370 z=zz+(i and 3):rem * draws moving bars
380 poke z,12:rem * draw bar
390 for d=1 to 200:next
400 poke z,15:rem * undraw bars
410 next
420 rem * reset colour and exit
430 poke 53272,21:poke 53265, peek(53265) and 191
440 end