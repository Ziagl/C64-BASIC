1 rem interploate
2 rem **********************
3 rem
10 rem program to draw a graph by interpolating
20 rem a set of points stored as data statements in
30 rem line 180.
45 rem
50 rem set colours
55 rem
60 sc=12:pc=6
70 gosub 10000
75 rem
80 rem draw border around screen
85 rem
90 gosub 1000
95 rem
100 rem initialise data
105 rem
110 dim x(12)
120 dim y(12)
130 for i=1 to 12
140 read x(i)
150 read y(i)
160 next i
165 rem
170 rem data stred as x and y coordinate
175 rem
180 data 1,10,2,25,3,30,4,20,5,40,6,30,7,50,8,20,9,25,10,50,11,30,12,20
185 rem
190 rem min dimension =1. max =12. seperation =1
195 rem
200 dn=1:dx=12:sp=1
205 rem
210 rem position and dimesions of graph on scren
215 rem
220 xl=20:xr=300
230 yb=170:yt=50
295 rem
300 rem draw border around graph
305 rem
310 x3=xr+10:y3=yb+10:ad=0:pc=0
320 x4=xr+10:y4=yt-10:gosub 11000
330 x3=x3:y3=y4:x4=xl-10:gosub 11000
340 x3=x4:y3=y4:y4=yb+10:gosub 11000
350 x3=x4:y3=y4:x4=xr+10:gosub 11000
355 xi=(xr-xl)/(dx-dn)
360 for x=xl to xr step xi
365 for a=10 to 13
370 y=yb+a:gosub 12000
375 next a:next x
380 a$="interpolated graph":x=80:y=20:xx=8:yy=0
385 rn=0:ad=0:pc=2:gosub 13000
395 rem
400 rem calculate scaling factors
405 rem
410 y1=-1000000
420 y2=1000000
430 x1=y1:x2=y2
440 for i=dn to dx step sp
450 if y1<y(i) then y1=y(i)
460 if y2>y(i) then y2=y(i)
470 if x1<x(i) then x1=x(i)
480 if x2>x(i) then x2=x(i)
490 next i
495 rem
500 rem convert scaling factors into point increments
505 rem
510 a=(xr-xl)/(x1-x2)
520 b=(yb-yt)/(y1-y2)
595 rem
600 rem plot graph
605 rem
610 for i=dn to dx step sp
620 x=(xl+(x(i)-x2)*a):x3=x
630 y=(yb-(y(i)-y2)*b):y3=y
660 pc=1:ad=0:gosub 12000
670 q=i+sp
680 if q>dx then 900
690 x=(xl+(x(q)-x2)*a):x4=x
700 y=(yb-(y(q)-y2)*b):y4=y
710 gosub 11000
720 next i
900 get a$:ifa$="" then 900
910 poke 53280,14:poke 53281,6:print "SA"
920 poke 53265,27:poke 53272,21
930 end
1000 rem draw border around screen
1005 rem
1010 x3=0:y3=0:ad=0
1020 x4=319:y4=0:gosub 11000
1030 x3=x4:y3=y4:y4=199:gosub 11000
1040 x3=x4:y3=y4:x4=0:gosub 11000
1050 x3=x4:y3=y4:y4=0:gosub 11000
1060 return
10000 poke 89,sc+pc*16
10010 sys(28672):poke 53280,sc
10020 return
11000 poke 828,x3-int(x3/256)*256
11010 poke 829,int(x3/256)
11020 poke 830,y3:poke 831,0
11030 poke 832,x4-int(x4/256)*256
11040 poke 833,int(x4/256)
11050 poke 834,y4:poke 835,0
11060 poke 786,ad
11070 poke 879,pc
11080 sys(29158)
11090 return
12000 poke 89,x-int(x/256)*256
12010 poke 90,int(x/256)
12020 poke 91,y
12030 poke 784,ad
12040 poke 879,pc
12050 sys(28782)
12060 return
13000 for i=1 to len(a$)
13010 b$=mid$(a$,i,1)
13020 poke 866,X-int(x/256)*256
13030 poke 867,int(x/256)
13040 poke 868,y:poke 869,0
13050 poke 870,asc(b$)
13060 poke 871,rn
13070 poke 879,pc
13080 poke 784,ad
13090 sys(29749)
13100 x=x+xx:y=y+yy
13110 next i
13120 return