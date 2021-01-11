1 rem move
2 rem ***********************
3 rem
10 rem this program uses matrix transformation to
20 rem move, rotate or scale a two dimensional shape
30 rem
40 rem
30 rem set colours
60 sc=12:pc=6
70 gosub 10000
75 rem
80 rem draw border
90 gosub 400
95 rem
100 rem set up constants, variables and arrays
105 rem
110 dim a(3,3)
120 sx=1
130 sy=1
140 rz=80*{126}/180
150 tx=-50
160 ty=2
190 rem
200 rem main program loop
205 rem
210 gosub 1000
220 gosub 2000
230 gosub 3000
240 gosub 4000
250 gosub 5000
260 get a$:if a$="" then 260
270 poke 53280,14:poke 53281,6:print "SA"
280 poke 53272,21:poke 53265,27
290 end
395 rem
400 rem draw border
405 rem
410 x1=0:y1=0:ad=0
420 x2=319:y2=0:gosub 11000
430 x1=x2:y1=y2:y2=199:gosub 11000
440 x1=x2:y1=y2:x2=0:gosub 11000
450 x1=x2:y1=y2:y2=0:gosub 11000
460 return
995 rem
1000 rem initialise shape
1005 rem
1010 read np
1020 dim x(np+1),y(np+1),u(np+1),v(np+1)
1030 for i=1 to np+1
1040 read x(i),y(i)
1050 next i
1090 rem
1100 rem shape data
1105 rem
1110 data 5
1120 data 100,100,150,120,175,75
1130 data 150.30.100.50.100,100
1200 return
1995 rem
2000 rem find centre of shape
2005 rem
2010 cx=0:cy=0
2020 for c=1 to np
2030 cx=cx+x(c)
2040 cy=cy+y(c)
2050 next c
2060 cx=cx/np
2070 cy=cy/np
2080 return
2995 rem
3000 rem set transformation matrix
3005 rem
3010 a(1,1)=sx*cos(rz)
3020 a(1,2)=sx*sin(rz)
3030 rem
3040 a(2,1)=sy*(-sin(rz))
3050 a(2,2)=sy*cos(rz)
3060 rem
3070 a(3,1)=tx
3080 a(3,2)=ty
3090 rem
3100 return
3995 rem
4000 rem do transformation
4005 rem
4010 for q=1 to np+1
4020 xt=x(q)-cx
4030 yt=y(q)-cy
4040 u(q)=cx+(xt*a(1,1)+yt*a(2,1)+a(3,1))
4050 v(q)=cy+(xt*a(1,2)+yt*a(2,2)+a(3,2))
4060 next q
4070 return
4995 rem
5000 rem draw shape
5005 rem
5010 for q=1 to np
5020 x1=u(q):y1=v(q)
5030 x2=u(q+1):y2=v(q+1)
5190 ad=0:pc=0:gosub 11000
5210 next q
5220 return
10000 poke 89,sc+pc*16
10010 sys(28672):poke 53280,sc
10020 return
11000 poke 828,x1-int(x1/256)*256
11010 poke 829,int(x1/256)
11020 poke 830,y1:poke 831,0
11030 poke 832,x2-int(x2/256)*256
11040 poke 833,int(x2/256)
11050 poke 834,y2:poke 835,0
11060 poke 786,ad
11070 poke 879,pc
11080 sys(29158)
11090 return