10 rem color demo
20 rem
30 vr=1024
40 kr=55296
50 print "S"
60 poke 53281,1
70 for i=vr to vr+999
80 poke i,160:next
90 z=kr:q=kr+39
100 e=kr+960:r=kr+999
110 for j=0 to 12
120 for i=0 to 19
130 x=int(rnd(1)*16)
140 poke z+j*41+i,x
150 poke q+j*39-i,x
160 c1=z+j*41+i*40
170 if c1>56295 then 190
180 poke c1,x
190 c1=q+j*39+i*40
200 if c1>56295 then 220
210 poke c1,x
220 poke e-j*39+i,x
230 poke r-j*41-i,x
240 c1=e-j*39-i*40
250 if c1<55296 then 270
260 poke c1,x
270 c1=r-j*41-i*40
280 if c1<55296 then 230
290 poke c1,x
300 get a$:if a$<>"" then 340
310 next
320 for k=1 to 200:next
330 next:goto 110
340 print "SA";:poke 53281,6