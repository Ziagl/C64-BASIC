10 rem ******************************************
20 rem * THIS PROGRAM DEMONSTRATES THE USE OF   *
30 rem * THE HI -RES GRAPHICS ROUTINES.         *
40 rem *.FOR EASE OF USE. THE POKE AND SVS      *
50 rem * ROUTINES ARE IN SUBROUTINES AT THE END *
60 rem * OF THE PROGRAM THUS.-                  *
70 rem *  GOSUB 10000 (SET UP HIRES SCREEN)     *
80 rem *  GOSUB 11000 (CLEAR THE BIT MAP        *
90 rem *               SCREEN)                  *
100 rem*  GOSUB 12800 (DO R GLOBAL COLOUR       *
110 rem*               CHANGE)                  *
120 rem*  GOSUB 13000 (PLOT A POINT)            *
130 rem*  GOSUB 14009 (DRAW A LINE)             *
140 rem*  GOSUB 15000 (DISPLAY A STRING ON THE  *
150 rem*               SCREEN)                  *
160 rem*                                        *
170 rem******************************************
174 rem
175 rem PLOT LINES FROM ORIGIN TO
176 rem POINT ON SINE GRAPH
177 rem
180 pc=1:sc=2:gosub 10000
190 b$="y=sin(x)":rh=1:ad=0:pc=5
200 x=0:xx=8:v=192:vv=0:gosub 15000
210 pc=1:xl=0:yl=100:ad=0
220 for x2=l to 320 step 2
230 y2=100-(90*sin(x2*{126}/45.5))
240 gosub 14000
250 next x2
254 rem
255 rem PLOT THE SINE CURVE
256 rem
260 for x=0 to 319 step .5
270 v=100-(90*sin(x*{126}/45.5))
280 gosub 13000
290 next x
300 for i=1 to 1000:next i
310 def fn a(y)=38*(sin(y/24)+.48*sin(3*y/24))+20
311 rem
312 rem PLOT A 3D GRAPH USING THE FUNCTION
313 rem DEFINED IN LINE 310
314 rem
315 for j=1 to 2
320 pc=6:sc=12:gosub 12000
339 gosub 11000
340 b$="3d graph":rn=l:ad=0:pc=0
350 x=0:xx=8:y=192:yy=0:gosub 15000
360 pc=6
370 for xx=-100 to 0 step 1
380 k=6:l=0:p=1:z1=0:m=1
390 y1=k*int(sqr(10000-xx*xx)/k)
400 for z=yl to -y1 step -k
410 y=int(80+fn a(sqr(xx*xx+z*z))-.707106*Z)
428 if y<l then 470
430 l=y:y=190-y
440 x=m*xx+160
450 gosub 13000
460 m=-m:if m=-1 then 440
470 next z,xx
480 for i=1 to 1000: next i
484 rem
485 rem A DIFFERENT 3D GRAPH
486 rem
490 def fn a(y)=90*exp(-y*y/600)
500 next j
510 run:rem REPEAT
10000 rem SET UP HIRES SCREEN
10010 poke 89,sc+pc*16
10020 sys(28672)
10030 return
11000 rem CLEAR GRAPHICS SCREEN
11010 sys(28704)
11020 return
12000 rem GLOBAL COLOUR CHANGE
12010 poke 89,sc+pc*16
12020 sys(28743)
12030 return
13000 rem PLOT A POINT AT X.V
13010 poke 89,x-int(x/256)*256
13020 poke 90,int(x/256)
13030 poke 91,int(y)
13040 poke 784,ad
13050 POKE 879,pc
13060 sys(28782)
13070 return
14000 rem DRAW A LINE BETWEEN XI .VI
14010 rem AND X2.V2
14020 poke 828,Xl-int(x1/256)*256
14030 poke 829,int(x1/256)
14040 poke 830,y1,int(y1/256)*256
14050 poke 831,int(y1/256)
14060 poke 832,x2-int(x2/256)*256
14070 poke 833,int(x2/256)
14080 poke 834,y2-int(y2/256)*256
14090 poke 835,int(y2/256)
14100 poke 786,ad
14110 poke 879,pc
14120 sys(29158)
14130 return
15000 rem PLOT CHARACTER A* ON TO THE
15010 rem SCREEN WITH TOP LEFT COORD-
15020 rem I NATES X.V
15030 for i=1 to len(b$)
15040 a$=mid$(b$,i,1)
15050 poke 866,x-int(x/256)*256
15060 poke 867,int(x/256)
15070 poke 868,y:poke 689,0
15088 poke 870,asc(a$)
15090 poke 871,rn
15100 POKE 784,ad
15110 POKE 879,pc
15120 sys(29749)
15130 x=x+xx:y=y+yy
15140 next
15150 return