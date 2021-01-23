10 rem
20 rem *******************************
30 rem *routine to calculate screen  *
40 rem *address from values for      *
50 rem *     column   in   89        *
60 rem *     line     in   90        *
70 rem *address returned in 91 and 92*
80 rem *this routine is only called  *
90 rem *by other routines in the     *
100 rem*package.do not use by itself.*
110 rem*error flag in location 785   *
120 rem*******************************
130 i=28672:t=0
140 read a
150 if a=-l then 190
160 t=t+a:poke i,a
170 i=i+1
180 goto 140
190 print "routine 1:"
200 if t=11973 then print "entered o.k.":goto 1000
210 print "entered incorrectly"
220 end
230 data 169,0,141,17,3,165,89
240 data 48,66,201,40,176,74,165
250 data 90,48,82,201,25,176,90
260 data 169,0,133,87,133,88,133
270 data 94,133,95,165,90,240,15
280 data 170,24,165,87,105,40,133
290 data 87,144,2,230,88,202,208
300 data 242,24,165,87,101,89,133
310 data 87,165,88,105,4,133,88
320 data 24,165,87,133,94,165,88
330 data 105,212,133,95,96,169,1
340 data 141,17,3,169,0,133,89
350 data 76,7,112,169,2,141,17
360 data 3,169,39,133,89,76,7
370 data 112,169,3,141,17,3,169
380 data 0,133.90,76,7,112,169
390 data 4,141,17,3,169,24,133
400 data 90,76,7,112,-1
1000 rem
1010 rem
1020 rem*******************************
1030 rem*draw a horizontal bar of any *
1040 rem*64 character.character stored*
1050 rem* in 784, column start in 89. *
1060 rem*line start in 90. length of  *
1070 rem*line in 91. colour in 786.   *
1080 rem*routine called by sys(28800) *
1090 rem*******************************
1100 i=28800:t=0
1110 read a
1120 if a=-l then 1160
1130 poke i,a:t=t+a
1140 i=i+1
1150 goto 1110
1160 print "routine 2:"
1170 if t=3095 then print "entered o.k.":goto 2000
1180 print "entered incorrectly"
1190 end
1200 data 72,152,72,138,72,32,0
1210 data ll2,164,91,173,16,3,145
1220 data 87,173,18,3,145,94,136
1230 data 208,243,104,170,104,168,104
1240 data 96,-1
2000 rem
2010 rem
2020 rem*******************************
2030 rem*draw a vertical bar of any 64*
2040 rem*character. character stored  *
2050 rem* in 784. column start in 89, *
2060 rem*line start in 90. length of  *
2070 rem*line in 91, colour in 786.   *
2080 rem*routine called by sys(28832) *
2098 rem*******************************
2100 i=28832:T=0
2110 read a
2120 if a=-l then 2160
2130 poke i,a:t=t+a
2140 i=i+1
2150 goto 2110
2160 print "routine 3:"
2170 if t=5296 then print "entered o.k.":goto 3000
2180 print "entered incorrectly"
2190 end
2200 data 72,152,72,138,72,32,0
2210 data 112,160,0,166,91,173,16
2220 data 3,145,87,173,18,3,145
2230 data 94,24,165,87,105,40,133
2240 data 87,133,94,165,88,105,0
2250 data 133,88,105,212,133,95,202
2260 data 208,224,104,170,104,168,104
2270 data 96,-1
3000 rem
3010 rem
3020 rem*******************************
3030 rem*fill a block of the screen   *
3040 rem*with a specified character.  *
3058 rem*character stored in 784, top *
3060 rem*left coordinates in 89(col)  *
3070 rem*and 90(line), height of block*
3080 rem*in 91, width in 92,and colour*
3090 rem* in 786.                     *
3100 rem*routine called by sys(28896) *
3110 rem*******************************
3120 i=28896:t=0
3130 read a
3140 if a=-l then 3180
3150 poke i,a:t=t+a
3160 i=i+1
3170 goto 3130
3180 print "routine 4:"
3190 if t=5588 then print "entered o.k.":goto 4000
3200 print "entered incorrectly"
3210 end
3220 data 72,152,72,138,72,32,0
3230 data 112,166,92,164,91,136,173
3240 data 16,3,145,87,173,18,3
3250 data 145,94,136,16,243,24,165
3260 data 87,105,40,133,87,133,94
3270 data 144,4,230,88,230,95,202
3280 data 208,222,104,170,104,168,104
3290 data 96,-1
4000 rem
4010 rem*******************************
4020 rem*invert a block of the screen *
4030 rem*top left coordinates in 89   *
4040 rem*(col) and 90(line), height in*
4050 rem*91 and width in 92, colour in*
4060 rem*786.                         *
4070 rem*routine called by sys(28960) *
4080 rem*******************************
4090 i=28960:t=0
4100 read a
4110 if a=-l then 4150
4120 poke i,a:t=t+a
4130 i=i+1
4140 goto 4100
4150 print "routine 5:" .
4160 if t=5859 then print "entered o.k.":goto 5000
4170 print "entered incorrectly"
4180 end
4190 data 72,152,72,138,72,32,0
4200 data 112,166,92,164,91,136,177
4210 data 87,73,128,145,87,173,18
4220 data 3,145,94,136,16,242,24
4230 data 165,87,105,40,133,87,133
4240 data 94,144,4,230,88,230,95
4250 data 202,208,221,104,170,104,168
4260 data 104,96,-1
5000 rem
5010 rem*******************************
5020 rem*draw a border of any size,and*
5030 rem*location, and any colour. top*
5040 rem*left coordinates are:        *
5050 rem* column      in      89      *
5060 rem* line        in      90      *
5070 rem* width       in      91      *
5080 rem* height      in      92      *
5090 rem* colour is stored in 786.    *
5100 rem*routine called by sys(29024) *
5110 rem*******************************
5129 i=29024:t=0
5130 read a
5140 if a=-l then 5180
5150 poke i,a:t=t+a
5160 i=i+1
5170 goto 5130
5180 print "routine 6:"
5190 if t=20557 then print "entered o.k.":goto 6000
5200 print "entered incorrectly"
5210 end
5220 data 72,152,72,138,72,32,0
5230 data 112,165,87,133,89,165,88
5240 data 133,90,169,100,141,16,3
5250 data 32,212,113,24,165,87,105
5260 data 41,133,87,133,89,165,88
5270 data 105,0,133,88,133,90,169
5280 data 101,141,16,3,32,239,113
5290 data 24,165,89,101,91,133,87
5300 data 198,87,165,90,105,0,133
5310 data 88,169,103,141,16,3,32
5320 data 239,113,165,89,133,87,165
5330 data 90,133,88,166,92,198,87
5340 data 202,202,24,165,87,105,40
5350 data 133,87,165,88,105,0,133
5360 data 88,202,200,240,169,99,141
5370 data 16,3,32,212,113,104,170
5380 data 104,168,104,96,164,91,165
5390 data 87,133,94,165,88,24,105
5400 data 212,133,95,173,16,3,145
5410 data 87,173,18,3,145,94,136
5420 data 208,243,96,160,0,166,92
5430 data 202,202,173,16,3,145,87
5440 data 24,165,87,133,94,165,88
5450 data 105,212,133,95,173,18,3
5460 data 145,94,24,165,87,105,40
5470 data 133,87,165,88,105,0,133
5480 data 88,202,208,219,96,-1
6000 rem
6010 rem*******************************
6020 rem*routine to place the cursor  *
6030 rem*at a location on the screen  *
6040 rem*whose coordinates are stored *
6050 rem* in 87=line and 88=column.   *
6060 rem*routine called by sys(29216) *
6070 rem*******************************
6080 i=29216:t=0
6090 read a
6100 if a=-1 then 6140
6110 poke i,a:t=t+a
6120 i=i+1
6130 goto 6090
6140 print "routine 7:"
6150 if t=5163 then print "entered o.k.":goto 6240
6160 print "entered incorrectly"
6170 end
6180 data 72,152,72,138,72,169,19
6190 data 32,22,231,165,87,240,9
6200 data 169,17,32,22,231,198,87
6210 data 208,247,165,88,240,9,169
6220 data 29,32,22,231,198,88,208
6230 data 247,104,170,104,168,104,96,-1
6240 poke 51,0:poke 52,112
6250 poke 55,0:poke 56,112:clr:new