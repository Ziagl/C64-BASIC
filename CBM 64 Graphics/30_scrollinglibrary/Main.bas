10 rem
28 rem *******************************
30 rem *routine to calculate screen  *
40 rem *address from values for      *
50 rem *    column     in   89       *
60 rem *    line       in   90       *
70 rem *address returned in 91 and 92*
88 rem *this routine is only called  *
90 rem *by other routines in the     *
100 rem*package.do not use by itself.*
110 rem*error flag in location 785   *
120 rem*******************************
130 i=28672:t=0
140 read a
150 if a=-1 then 190
160 t=t+a:poke i,a
170 i=i+1
188 goto 140
190 print "routine 1:"
200 if t=11973 then print"entered o.k.":goto 1000
210 print"entered incorrectly"
220 end
230 data 169,0,141,17,3,165,89
240 data 43,66,201,40,176,74,165
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
380 data 0,133,90,76,7,112,169
390 data 4,141,17,3,169,24,133
400 data 90,76,7,112,-1
1000 rem
1010 rem*******************************
1020 rem*draw a border of any size,any*
1030 rem*locaion. and any colour, top *
1040 rem*left coordinates are:        *
1050 rem*   column     in   89        *
1060 rem*   line       in   90        *
1070 rem*   width      in   91        *
1080 rem*   height     in   92        *
1090 rem* colour is stored in 786.    *
1100 rem*routine called by sys(29024) *
1110 rem*******************************
1120 i=29024:t=0
1130 read a
1140 if a=-1 then 1100
1150 poke i,a:t=t+a
1160 i=i+1
1170 goto 1130
1180 print"routine 2:"
1190 if t=20557 then print"entered o.k.":goto 2000
1200 print"entered incorrectly"
1210 end
1220 data 72,152,72,138,72,32,0
1230 data 112,165,87,133,89,165,88
1240 data 133,90,169,100,141,16,3
1250 data 32,212,113,24,165,87,105
1260 data 41,133,87,133,89,165,88
1270 data 105,0,133,88,133,90,169
1280 data 101,141,16,3,32,239,113
1290 data 24,165,89,101,91,133,87
1300 data 198,87,165,90,105,0,133
1310 data 88,169,103,141,16,3,32
1320 data 239,113,165,89,133,87,165
1330 data 90,133,88,16692,198,87
1340 data 202,202,24,165,87,105,40
1350 data 133,87,165,88,105,0,133
1360 data 88,202,208,240,169,99,141
1370 data 16,3,32,212,113,104,170
1380 data 104,168,104,96,164,91,165
1390 data 87,133,94,165,88,24,105
1400 data 212,133,95,173,16,3,145
1410 data 87,173,18,3,145,94,136
1420 data 208,243,96,160,0,166,92
1430 data 202,202,173,16,3,145,87
1440 data 24,165,87,133,94,165,88
1450 data 105,212,133,95,173,18,3
1460 data 145,94,24,165,87,105,40
1470 data 133,87,165,88,105,0,133
1480 data 88,202,208,219,96,-1
2000 rem
2010 rem*******************************
2020 rem*routine to place the cursor  *
2030 rem*at a location on the screen  *
2040 rem*whose coordinates are stored *
2050 rem*in 87=line and 88=column.    *
2060 rem*routine called by sys(29216) *
2070 rem*******************************
2080 i=29216:t=0
2090 read a
2100 if a=-1 then 2140
2110 poke i,a:t=t+a
2120 i=i+1
2130 goto 2090
2140 print "routine 3:"
2150 if t=5163 then print"entered o.k.":goto 3000
2160 print"entered incorrectly"
2170 end
2180 data 72,152,72,138,72,169,19
2190 data 32,22,231,165,87,240,9
2200 data 169,17,32,22,231,198,87
2210 data 208,247,165,88,240,9,169
2220 data 29,32,22,231,198,88,208
2230 data 247,104,170,104,168,104,96,-1
3000 rem
3010 rem*******************************
3020 rem*scroll contents of screen    *
3030 rem*block right one column. top  *
3040 rem*left coordinates of block in *
3050 rem*89 (col) and 90 (line). block*
3060 rem*height in 91 and width in 92.*
3070 rem*colour is retained throughout*
3080 rem*routine called by sys(29952) *
3090 rem*******************************
3100 i=29952:t=0
3110 read a
3120 if a=-1 then 3160
3130 poke i,a:t=t+a
3140 i=i+1
3150 goto 3110
3160 print "ROUTINE 4:"
3170 if t=10955 then print"entered o.k.":goto 4000
3180 print"entered incorrectly"
3190 end
3200 data 72,152,72,138,72,32,0
3210 data 112,56,165,87,233,1,133
3228 data 89,165,88,233,0,133,90
3230 data 166,91,164,92,136,177,89
3240 data 145,87,165,90,24,105,212
3250 data 133,97,165,88,24,105,212
3260 data 133,95,165,89,133,96,165
3270 data 87,133,94,177,96,145,94
3280 data 136,208,223,169,32,145,87
3290 data 24,165,87,105,40,133,87
3300 data 144,2,230,88,24,165,89
3310 data 105,40,133,89,144,2,230
3320 data 90,202,208,191,104,170,104
3330 data 168,104,96,-l
4000 rem
4010 rem*******************************
4020 rem*scroll contents of screen    *
4030 rem*block left one column. top   *
4040 rem*left coordinates of block in *
4058 rem*89 (col) and 90 (line). block*
4060 rem*height in 91 and width in 92.*
4070 rem*colour is retained throughout*
4080 rem*routine called by sys(30976) *
4090 rem*******************************
4100 i=30976:t=0
4110 read a
4120 if a=-1 then 4160
4136 poke i,a:t=t+a
4140 i=i+1
4150 goto 4110
4160 print "routine 5:"
4170 if t=10720 then print"entered o.k.":goto 5000
4180 print"entered incorrectly"
4190 end
4200 data 72,152,72,138,72,32,0
4210 data 112,24,165,87,105,1,133
4220 data 89,165,88,105,0,133,90
4230 data 166,91,160,0,177,89,145
4240 data 87,165,90,24,105,212,133
4250 data 97,165,88,24,105,212,133
4260 data 95,165,89,133,96,165,87
4270 data 133,94,177,96,145,94,200
4280 data 196,92,144,221,169,32,145
4290 data 87,24,165,87,105,40,133
4300 data 87,144,2,230,88,24,165
4310 data 89,105,40,133,89,144,2
4320 data 230,90,202,208,190,104,170
4330 data 104,168,104,96,0,-1
5000 rem
5010 rem******************************
5020 rem*scroll countents of screen  *
5030 rem*block up one line. top left *
5040 rem*coordintes of block in 89   *
5050 rem*(col) and 90 (line). block  *
5060 rem*height in 91 and with in 92.*
5070 rem*colour is retained troughout*
5080 rem*routine called by sys(30128)*
5090 rem******************************
5108 i=30123:t=0
5110 read a
5120 if a=-1 then 5160
5130 poke i,a:t=t+a
5140 i=i+1
5150 goto 5110
5160 print "routine 6:"
5170 if t=11564 then print"entered o.k.":goto 6000
5180 print"entered incorrectly"
5190 end
5200 data 72,152,72,138,72,32,0
5210 data 112,24,165,87,105,40,133
5220 data 89,165,88,105,0,133,90
5230 data 166,92,164,91,136,177,89
5240 data 145,87,165,90,24,105,212
5250 data 133,97,165,88,24,105,212
5260 data 133,95,165,89,133,96,165
5270 data 87,133,94,177,96,145,94
5280 data 136,16,223,202,240,25,24
5290 data 165,87,105,40,133,87,144
5300 data 2,230,88,24,165,89,105
5310 data 40,133,89,144,2,230,90
5320 data 76,199,117,164,91,136,169
5330 data 32,145,87,136,16,249,104
5340 data 170,104,168,104,96,-1
6000 rem
6010 rem*******************************
6020 rem*scroll contents of screen    *
6030 rem*block down one line. top left*
6040 rem*coordinates of block in 89   *
6050 rem*(col) 90 (line).block height *
6060 rem*in 91 and width in 92.       *
6070 rem*colour is retained troughout *
6080 rem*reoutine called by sys(30240)*
6090 rem*******************************
6100 i=30240:t=0
6110 read a
6120 if a=-1 then 6160
6130 poke i,a:t=t+a
6140 i=i+1
6150 goto 6110
6160 print"routine 7:"
6170 if t=14455 then print"entered o.k.":goto 7000
6180 print"entered incorrectly"
6190 end
6200 data 72,152,72,138,72,32,0
6210 data 112,166,92,202,24,165,87
6220 data 105,40,133,87,144,2,230
6230 data 88,202,208,242,56,165,87
6240 data 233,40,133,89,165,88,233
6250 data 0,133,90,166,92,164,91
6260 data 136,177,89,145,87,165,90
6270 data 24,105,212,133,97,165,88
6280 data 24,105,212,133,95,165,89
6290 data 133,96,165,87,133,94,177
6300 data 96,145,94,136,16,223,202
6310 data 240,25,56,165,87,233,40
6320 data 133,87,176,2,198,88,56
6336 data 165,89,233,40,133,89,176
6340 data 2,198,90,76,72,118,164
6356 data 91,136,169,32,145,87,136
6360 data 208,249,104,170,104,168,104
6370 data 96,-l
7000 rem
7010 rem*******************************
7020 rem*draw vertical bar - bottom to*
7030 rem*top of spaces terminated in a*
7040 rem*thin line.resolution 135 x 40*
7050 rem*column # in 89,              *
7060 rem*line   # in 90,              *
7070 rem*length   in 91,              *
7080 rem*colour   in 786.             *
7098 rem*routine called by sys(29760) *
7100 rem*******************************
7110 i=29760:t=0
7120 read a
7130 if a=-1 then 7170
7149 poke i,a;t=t+a
7150 i=i+1
7160 goto 7120
7170 print "routine 8:"
7180 if t=8307 then print"entered o.k.":goto 7330
7190 print"entered incorrectly"
7200 end
7210 data 72,152,72,138,72,32,0
7220 data 112,160,0,165,91,201,8
7230 data 48,37,233,8,133,91,169
7240 data 32,145,87,173,18,3,145
7250 data 94,24,165,87,233,39,133
7260 data 87,133,94,165,88,233,0
7270 data 133,88,24,105,212,133,95
7280 data 165,88,208,213,170,189,134
7290 data 116,145,87,173,18,3,145
7300 data 94,104,170,104,168,104,96
7310 data 100,82,70,64,67,68,69
7320 data 99,32,0,-1
7330 poke 51,0:poke 52,112
7340 poke 55,0:poke 56,112:clr:new