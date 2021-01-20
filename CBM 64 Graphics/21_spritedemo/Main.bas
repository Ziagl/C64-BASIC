10 for i=0 to 1
20 read no
30 for j=0 to 62
40 read x
50 poke no*64+j,x
60 next j
70 poke 2040+i,no
80 next i
90 print "demonstration of how to use more than ";
100 print "one sprite to create a display"
110 v=53248:rem start of video chip
120 poke v+32,12:poke v+33,12:rem screen and border colours
130 poke v+23,0:poke v+29,0:rem x and y small
135 poke v+39,2:poke v+40,2:rem sprite colours are red
140 x=150:y=150:rem coordinates of sprites
150 poke v,x:poke v+1,y
160 poke v+2,x+24:poke v+3,y
170 poke v+21,3
190 print "hit any key to see enlarged picture"
200 get a$:if a$="" then 200
210 poke v+21,0
230 print ""
235 x=126:y=140
240 poke v+23,3:poke v+29,3:rem x and y enlarged
250 poke v,x:poke v+1,y
260 poke v+2,x+48:poke v+3,y
270 poke v+21,3
290 print "choose a colour (0-9), return to exit"
300 get a$:if a$="" then 300
310 if a$=chr$(13) then 360
320 a=val(a$)
330 poke v+39,a:poke v+40,a
340 goto 300
360 print "move the picture with the cursor keys"
370 print "hit return to end demo"
380 get a$:if a$="" then 380
390 if a$="{down}" and y<255 then y=y+1:goto 440
403 if a$="{up}" and y>0 then y=y-1:goto 440
410 if a$="{right}" and x<207 then x=x+1:goto 440
420 if a$="{left}" and x>0 then x=x-1:goto 440
425 if a$=chr$(13) then 470
430 goto 380
440 poke v,x:poke v+1,y
450 poke v+2,x+48:poke v+3,y
460 goto 380
470 poke v+21,0:print ""
480 poke v+33,6:poke v+32,14
490 end
30000 data 224
30001 data 0,0,0,0,0,0,0
30002 data 0,0,0,0,0,0,0
30003 data 0,0,0,0,0,0,3
30004 data 0,0,7,31,255,131,15
30005 data 255,192,7,255,128,0,28
30006 data 0,0,28,0,0,14,0
30007 data 0,14,0,0,7,1,0
30008 data 7,1,0,31,255,0,15
30009 data 255,0,7,255,0,0,0
30010 data 225
30011 data 0,0,0,0,0,0,0
30012 data 0,0,0,192,0,3,240
30013 data 0,7,243,0,255,255,240
30014 data 255,255,248,255,255,240,56
30015 data 192,0,56,0,0,112,0
30016 data 0,112,0,0,224,0,0
30017 data 224,0,0,192,0,0,192
30018 data 0,0,252,0,0,254,0
30019 data 0,252,0,0,0,0,0
30020 data -1