1 rem 3d drawing 2
2 rem ***********************
3 rem
10 rem a three dimensional shape is drawn by this program
20 rem the rotation position and scale of the object
30 rem can be changed to give different viewing angles
35 rem hidden lines are not drawn
36 rem
40 rem set colours
50 pc=6:sc=12
60 gosub 10000
65 rem
70 rem draw border around screen
75 rem
80 gosub 900
85 rem
90 rem set up constants, variables and arrays
95 rem
100 dim a(4,4)
110 dim b(4,4)
115 dim c(3)
117 dim d(3)
120 sx=.3
130 sy=.3
140 sz=.3
150 tx=1
160 ty=1
170 tz=1
180 rx=40*{126}/180
190 ry=20*{126}/180
208 rz=50*{126}/180
400 rem main program loop
410 gosub 1000
420 gosub 5000
430 gosub 3000
440 gosub 4000
450 gosub 6000
500 get a$:if a$="" then 500
510 poke 53280,14:poke 53281,6:print "SA"
520 poke 53265,27:poke 53272,21
530 end
900 rem border drawing subroutine
905 rem
910 xl=0:yl=0
920 x2=319:y2=0:ad=0:gosub 11000
930 x1=x2:y1=y2:y2=l99:gosub 11000
940 x1=x2:y1=y2:x2=0:gosub 11000
950 x1=x2:y1=y2:y2=0:gosub 11000
960 return
995 rem
1000 rem initialise shape
1005 rem
1010 np=8
1020 ne=4
1030 nf=6
1040 dim s(3,np)
1050 dim e(nf,ne,2)
1060 dim m(3,np)
1100 rem
1110 for n=1 to np
1120 read s(1,n),s(2,n),s(3,n)
1130 next n
1135 for f=1 to nf
1140 for k=1 to ne
1150 read e(f,k,1),e(f,k,2)
1170 next k,f
1195 rem
1200 rem x,y,z point coordinates
1210 data 50,0,200,250,0,200,250,0,0,50,0,0
1220 data 50,200,200,250,200,200,250,200,0,50,200,0
1295 rem
1300 rem connection data
1305 rem
1310 data 1,2,2,3,3,4,4,1
1320 data 5,1,1,4,4.8,8,5
1330 data 6,5,5,8,8,7,7,6
1340 data 2,6,6,7,7,3,3,2
1350 data 1,5,5,6,6,2,2,1
1360 data 3,7,7,8,8,4,4,3
1900 return
1995 rem
2000 rem draw shape
2005 rem
2020 for k=1 to ne
2030 v1=e(f,k,1)
2040 v2=e(f,k,2)
2045 if v1=0 then 2240
2050 x1=m(1,v1)
2060 y1=m(2,v1)
2070 x2=m(1,v2)
2080 y2=m(2,v2)
2220 ad=0:pc=2:gosub 11000
2240 next k
2900 return
2995 rem
3000 rem set transformation matrix
3005 rem
3010 a(1,1)=cos(ry)*cos(rz)
3020 a(1,2)=cos(ry)*sin(rz)
3030 a(1,3)=-sin(ry)
3040 a(1,4)=0
3050 a(2,1)=cos(rx)*(-sin(rz))+sin(rx)*sin(ry)*cos(rz)
3060 a(2,2)=cos(rx)*cos(rz)+sin(rx)*sin(ry)*sin(rz)
3070 a(2,3)=sin(rx)*cos(ry)
3080 a(2,4)=0
3090 a(3,1)=(-sin(rx))*(-sin(rz))+cos(rx)*sin(ry)*cos(rz)
3100 a(3,2)=-sin(rx)*cos(rz)+cos(rz)*sin(ry)*sin(rz)
3110 a(3,3)=cos(rx)*cos(ry)
3129 a(3,4)=0
3130 a(4,1)=0
3140 a(4,2)=0
3150 a(4,3)=0
3160 a(4,4)=1
3195 rem
3200 rem set up scaling and translation matrix
3205 rem
3210 b(1,1)=sx*a(1,1)
3220 b(1,2)=sx*a(1,2)
3230 b(1,3)=sx*a(1,3)
3240 rem
3250 b(2,1)=sy*a(2,1)
3268 b(2,2)=sy*a(2,2)
3270 b(2,3)=sy*a(2,3)
3280 rem
3290 b(3,1)=sz*a(3,1)
3309 b(3,2)=sz*a(3,2)
3310 b(3,3)=sz*a(3,3)
3320 rem
3330 b(4,1)=tx
3340 b(4,2)=ty
3350 b(4,3)=tz
3900 return
3995 rem
4000 rem perform translation
4005 rem
4010 for q=1 to np
4015 rem
4020 xt=s(1,q)-xc
4030 yt=s(2,q)-yc
4040 zt=s(3,q)-zc
4045 rem
4050 m(1,q)=xc+(xt*b(1,1)+yt*b(2,1)+zt*b(3,1)+b(4,1))
4060 m(2,q)=yc+(xt*b(1,2)+yt*b(2,2)+zt*b(3,2)+b(4,2))
4070 m(3,q)=zc+(xt*b(1,3)+yt*b(2,3)+zt*b(3,3)+b(4,3))
4080 next q
4900 return
4995 rem
5000 rem find centroid
5005 rem
5016 p=0:q=0:r=0
5020 for i=1 to np
5030 p=p+s(1,i)
5040 q=q+s(2,i)
5050 r=r+s(3,i)
5060 next i
5079 xc=p/np
5088 yc=q/np
5090 zc=r/np
5900 return
5995 rem
6000 rem hidden surface check
6005 rem
6010 for f=1 to nf
6020 for j=1 to 3
6030 c(j)=m(j,e(f,1,2))-m(j,e(f,1,1))
6040 d(j)=m(j,e(f,2,1))-m(j,e(f,2,2))
6050 next j
6060 p1=c(2)*d(3)-c(3)*d(2)
6070 p2=c(3)*d(1)-c(1)*d(3)
6080 p3=c(1)*d(2)-c(2)*d(1)
6090 q1=1-m(1,e(f,1,2))
6100 q2=1-m(2,e(f,1,2))
6110 q3=500-m(3,e(f,1,2))
6120 w=p1*q1+p2*q2+p3*q3
6130 if w>=0 then gosub 2000
6140 next f
6150 return
10000 rem set up hires screen
10010 poke 89,sc+pc*16
10020 sys(28672):poke 53280,sc
10030 return
11000 rem draw a line between x1,y1 and x2,y2
11010 poke 828,x1-int(x1/256)*256
11020 poke 829,int(x1/256)
11030 poke 830,y1:poke 831,0
11040 poke 832,x2-int(x2/256)*256
11050 poke 833,int(x2/256)
11060 poke 834,y2:poke 835,0
11070 poke 786,ad:poke 879,pc
11080 sys(29158)
11090 return