00 rem init multi-colour mode
10 sc=12:pc=6
20 for i=1024 to 2023
30 poke i,sc+pc*16
40 next
50 for i=8192 to 16191
60 poke i,0
70 next i
80 rem poke 53265, peek(53265) or 32
90 rem poke 53272, peek(53272) or 8
100 rem poke 53270, peek(53270) or 16
999 rem draw point 
1000 def fn p(zz)=8192+int(x/8)*8+int(y/8)*320+(y and 7)
1010 def fn c(zz)=1024+int(x/8)+int(y/8)*40
1020 x=5:y=5:rem coordinates of point
1030 ao=0:rem draw or delete
1040 pc=1:rem colour to draw point
1050 if x<0 or x>319 then 1160
1060 if y<0 or y>199 then 1160
1070 if ao=1 then 1110
1080 bi=7-(x and 7)
1090 poke fn p(0),peek(fn p(0)) or 2^bi
1100 goto 1130
1110 bi=7-(x and 7)
1120 poke fn p(0),peek(fn p(0)) and 255-(2^bi)
1130 sc=peek(fn c(0)) and 15
1140 col=sc+pc*16
1150 poke fn c(0),col
1160 return
1999 rem draw line
2000 x1=10:y1=10:rem point 1
2010 x2=40:y2=40:rem point 2
2020 ao=0:pc=1:rem draw or delete and line color
2030 xd=x2-x1
2040 yd=y2-y1
2050 a0=1;a1=1
2060 if yd<0 then a0=-1
2070 if xd<0 then a1=-1
2080 xe=abs(xd):ye=abs(yd):d1=xe-ye
2090 if d1>=0 then 2130
2100 s0=-1,s1=0:lg=ye:sh=xe
2110 if yd>0 then s0=1
2120 goto 2150
2130 s0=0:s1=-1:lg=xe:sh=ye
2140 if xd>=0 then s1=1
2150 tt=lg:ts=sh:ud=lg-sh:ct=sh-lg/2
2160 d=0
2170 x=x1:y=y1
2180 gosub 1050
2190 if ct>0 then 2220
2200 ct=ct+ts:x=x+s1:y=y+s0
2210 goto 2230
2220 ct=ct-ud:x=x+a1:y=y+a0
2230 tt=tt-1
2240 if tt<=0 then 2260
2250 goto 2180
2260 return