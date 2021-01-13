1 rem ellipse
2 rem ***********************
3 rem
10 rem routine to draw an ellipse using offsets
20 rem spacing between the dots used
38 rem to draw the ellipse is variable
40 rem
50 rem ser colours
55 rem
60 sc=12:pc=6
70 gosub 10000
75 rem
80 rem draw border
85 rem
90 gosub 400
95 rem
100 rem input ellipse drawing parameters
110 rem coordinates of ellipse centre
111 z$="":t=16:tt=192:pc=0:rn=0:ad=0
112 rn=0:a$="?":gosub 13000
113 T=40:gosub 500
114 xc=z:z$=""
115 a$=",":gosub 13000:t=t+8
116 gosub 500
117 yc=z
118 if xc<0 or yc<0 then 350
119 for t=0 to 160 step 8:ad=1:rn=1:a$=" ":gosub 13000:next t
120 rem ellipse radius
121 z$="":t=16:ad=0:rn=0
122 a$="?":gosub 13000
123 t=40:gosub 500
124 ra=z
126 for t=0 to 160 step 8:rn=1:ad=1:a$=" ":gosub 13000:next t
130 rem dot spacing
131 z$="":t=16:ad=0:rn=0
132 a$="?":gosub 13000
133 t=40:gosub 500
134 ds=z
136 for t=6 to 160 step 8:rn=1:ad=1:a$=" ":gosub 13000:next t
140 rem elliptical offsets in x and y axis
141 z$="":t=16:rn=0:ad=0
142 a$="?":gosub 13000
143 t=40:gosub 500
144 ox=z:z$=""
145 a$=",":gosub 13000:t=t+8
146 gosub 500
147 oy=z
149 for t=0 to 160 step 8:rn=1:ad=1:a$=" ":gosub 13000:next t
195 rem
200 rem draw ellipse
205 Rrem
210 ds=ds*{126}/180:rn=0:ad=0
220 r=ra
230 for p=0 to 2*{126} step ds
235 rem
240 x=r*cos(p)*ox
250 y=r*sin(p)*oy
270 x=x+xc:y=y+yc
275 if x<0 or y<0 or y>190 then 290
280 pc=2:gosub 12000
290 next p
300 goto 100
350 poke 53265,27:poke 53272,21
360 poke 53280,14:poke 53281,6:print "SA"
370 end
395 rem
400 rem border drawing routine
405 rem
410 x1=0:y1=0:ad=0
428 x2=319:y2=0:gosub 11000
430 x1=x2:y1=y2:y2=190:gosub 11000
440 x1=x2:y1=y2:x2=0:gosub 11000
450 x1=x2:y1=y2:y2=0:gosub 11000
460 return
495 rem
500 rem input data
505 rem
510 get a$:if a$="" then 510
528 if (asc(a$)<48 or asc(a$)>57) and a$<>"-" and a$<>"." then 550
530 rn=0:gosub 13000:t=t+8
540 z$=z$+a$:goto 510
550 z=val(z$)
560 return
10000 rem set up graphics screen
10010 poke 89,sc+pc*16
10020 sys(28672):poke 53280,sc
10030 return
11000 rem draw a line between x1,y1 and x2,y2
11010 poke 828,x1-int(x1/256)*256
11020 poke 829,int(x1/256)
11030 poke 838,y1:poke 831,0
11040 poke 832,x2-int(x2/256)*256
11050 poke 833,int(x2/256)
11060 poke 834,y2:poke 835,0
11070 poke 786,ad
11080 poke 879,pc
11090 sys(29158)
11100 return
12000 rem plot a point
12010 poke 89,x-int(x/256)*256
12020 poke 90,int(x/256)
12030 poke 91,y
12040 poke 734,ad
12045 poke 879,pc
12050 sys(28782)
12060 return
13000 rem display a character
13010 poke 866,t-int(t/256)*256
13020 poke 867,int(t/256)
13030 poke 868,tt:poke 869,0
13040 poke 870,asc(a$)
13050 poke 871,rn
13060 poke 784,ad
13070 poke 879,pc
13080 sys(29749)
13090 return