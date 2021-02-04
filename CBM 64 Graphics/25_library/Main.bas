10 rem
20 rem *******************************
30 rem *routine to calculate screen  *
40 rem *address from values for      *
50 rem *    column   in 89           *
60 rem *    line     in 96           *
70 rem *address returned in 91 and 92*
80 rem *this routine is only called  *
90 rem *by other routines in the     *
100 rem*package,do not use by itself.*
110 rem*error flag in location 785   *
120 rem*******************************
130 i=28672:t=0
140 read a
150 if a=-1 then 190
160 t=t+a:poke i,a
170 i=i+1
180 goto 140
190 print "routine l:"
200 if t=11973 then print"entered o.k." :goto 1000
210 print"entered incorrectly"
220 end
230 data 169,0,141,17,3,165,89
240 data 48,66,201,40,176,74,165
250 data 90,48,82,201,25,176,90
260 data 169,0,133,87,133,88,133
270 data 94,133,95,165,90,240,15
288 data 170,24,165,87,105,40,133
290 data 87,144,2,230,88,202,200
300 data 242,24,165,87,101,89,133
310 data 87,165,88,105,4,133,88
320 data 24,165,87,133,94,165,88
330 data 105,212,133,95,96,169,1
348 data 141,17,3,169,0,133,89
350 data 76,7,112,169,2,141,17
360 data 3,169,39,133,89,76,7
370 data 112,169,3,141,17,3,169
380 data 0,133,90,76,7,112,169
390 data 4,141,17,3,169,24,133
400 data 90,76,7,112,-1
1000 rem
1010 rem*******************************
1020 rem*draw a border of any size.any*
1030 rem*location, and any colour, top*
1040 rem*left coordinates are:        *
1050 rem*   column     in   89        *
1060 rem*   line       in   90        *
1078 rem*   width      in   91        *
1080 rem*   height     in   92        *
1090 rem* colour is stored in 786.    *
1100 rem*routine called by sys(29024) *
1110 rem*******************************
1120 i=29024:t=0
1130 read a
1140 if a=-1 then 1180
1150 poke i,a:t=t+a
1160 i=i+1
1170 goto 1130
1180 print "routine 2:"
1190 if t=20557 then print"entered o.k.":goto 2000
1200 print "entered incorrectly"
1210 end
1228 data 72,152,72,138,72.32,0
1230 data 112,165,87,133,89,165,88
1240 data 133,90,169,100,141,16,3
1250 data 32,212,113.24,165,87,105
1260 data 41,133,87,133,89,165,88
1270 data 105,0,133,88,133,90,169
1280 data 101,141,16,3,32,239,113
1290 data 24,165,89,101,91,133,87
1300 data 198,87,165,90,105,0,133
1310 data 88,169,103,141,16,3,32
1320 data 239,113,165,89,133,87,165
1330 data 90,133,88,166,92,198,87
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
1460 data l45,94,24,165,87,105,40
1470 data 133,87,165,88,105,0,133
1480 data 88,202,208,219,96,-1
2000 rem
2010 rem*******************************
2020 rem*routine to playe the cursor  *
2030 rem*at a location on the screen  *
2040 rem*whose coordinates are stored *
2050 rem*in 87=line and 88=column.    *
2060 rem*routine called by sys(29216) *
2070 rem*******************************
2080 i=29216:t=0
2090 read a
2100 if a=-1 then 2140
2110 poke i.a:t=t+a
2120 i=i+1
2130 goto 2090
2140 print"routine 3:"
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
3020 rem*draw horizontal bar - left to*
3030 rem*right. resolution 135 x 25.  *
3040 rem*column # in 89, line # in 90.*
3050 rem*length   in 91, colour in 786*
3060 rem*routine called by sys(29258) *
3070 rem*******************************
3080 i=29258:t=0
3090 read a
3100 if a=-1 then 3140
3110 poke i,a:t=t+a
3120 i=i+1
3130 goto 3090
3140 print"routine 4:"
3150 if t=7891 then print"entered o.k.":goto 4000
3160 print"entered incorrectly"
3170 end
3180 data 72,152,72,138,72,32,0
3190 data 112,160,0,165,91,201,8
3200 data 48,27,233,8,133,91,169
3210 data 160,145,87,173,18,3,145
3220 data 94,24,230,87,230,94,144
3230 data 4,230,88,230,95,76,84
3240 data l14,170,189,134,114,145,87
3250 data 173,18,3,145,94,104,170
3260 data l04,168,104,96,32,101,116
3270 data 117,97,246,234,231,160,-1
4000 rem
4010 rem*******************************
4020 rem*draw horizontal bar - right  *
4030 rem*to left. resolution 135 x 25 *
4040 rem*column # in 89,              *
4050 rem*line   # in 90,              *
4060 rem*length   in 91,              *
4070 rem*colour   in 786.             *
4080 rem*routine called by sys(29328) *
4090 rem*******************************
4100 i=29328:t=0
4110 read a
4120 if a=-1 then 4160
4130 poke i,a:t=t+a
4140 i=i+1
4150 goto 4110
4160 print "routine 5:"
4170 if t=8095 then print "entered o.k.":goto 5000
4180 print "entered incorrectly"
4190 end
4200 data 72,152,72,138,72,32,0
4210 data 112,160,0,165,91,201,8
4220 data 48,27,233,8,133,91,169
4230 data 160,145,87,173,18,3,145
4240 data 94,56,198,87,198,94,176
4250 data 4,198,88,198,95,76,154
4260 data l14,170,189,204,114,145,87
4270 data 173,18,3,145,94,104,170
4280 data 104,168,104,96,32,103,106
4290 data 118,225,245,244,229,160,-1
5000 rem
5010 rem*******************************
5020 rem*draw vertical bar - bottom to*
5030 rem*top. resolution 135 X 40.    *
5040 rem*column # in 89,              *
5050 rem*line   # in 90,              *
5060 rem*length   in 91,              *
5070 rem*colour in 786.               *
5080 rem*routine called by sys(29408) *
5090 rem*******************************
5108 i=29408:t=0
5110 read a
5120 if a=-1 then 5160
5130 poke i,a:t=t+a
5140 i=i+1
5150 goto 5110
5160 print "routine 6:"
5170 if t=9031 then print"entered o.k.":goto 6000
5180 print "entered incorrectly"
5190 end
5200 data 72,152,72,138,72,32,0
5210 data 112,160,0,165,91,201,8
5220 data 48,27,233,8,133,91,169
5230 data 160,145,87,173,18,3,145
5240 data 94,24,165,87,233,39,133
5258 data 87,133,94,165,88,233,0
5260 data 133,88,24,105,212,133,95
5270 data 165,88,208,213,170,189,38
5280 data 115,145,87,173,18,3,145
5296 data 94,104,170,104,168,104,96
5300 data 32,100,111,121,98,248,247
5310 data 227,160,0,-1
6000 rem
6010 rem*******************************
6020 rem*draw vertical bar - top to   *
6030 rem*bottom. resolution 135 x 25. *
6040 rem*column # in 89,              *
6050 rem*line   # in 90,              *
6060 rem*length   in 91,              *
6070 rem*colour   in 786.             *
6080 rem*routine called by sys(29503) *
6090 rem*******************************
6100 i=29503:t=0
6110 read a
6120 if a=-l then 6160
6130 poke i,a:t=t+a
6140 i=i+1
6150 goto 6110
6160 print "routine 7:"
6170 IF t=8999 then print"entered o.k.":goto 7000
6180 print"entered incorrectly"
6190 end
6200 data 72,152,72,138,72,32,0
6210 data 112,160,0,165,91,201,8
6220 data 48,37,233,8,133,91,169
6230 data 160,145,87,173,18,3,145
6240 data 94,24,165,87,105,40,133
6250 data 87,133,94,165,88,105,0
6260 data 133,88,24,105,212,133,95
6270 data 165,88,208,213,170,189,133
6280 data 115,145,87,173,18,3,145
6290 data 94,104,170,104,168,104,96
6300 data 32,99,119,120,226,249,239
6310 data 228,160,0,-1
7000 rem
7010 rem*******************************
7020 rem*draw horizontal bar - left to*
7030 rem*right of spaces terminated in*
7040 rem*a thin line. resolution      *
7050 rem* 135 x 25.                   *
7060 rem*column # in 89,              *
7070 rem*line   # in 90,              *
7080 rem*length   in 91,              *
7090 rem*colour   in 786.             *
7100 rem*routine called by sys(29600) *
7110 rem*******************************
7120 i=29600:t=0
7130 read a
7140 if a=-1 then 7180
7150 poke i,a:t=t+a
7160 i=i+1
7170 goto 7130
7180 print "routine 8:"
7190 if t=7251 then print"entered o.k.":goto 8000
7200 print "entered incorrectly"
7210 end
7228 data 72,152,72,138,72,32,0
7230 data 112,160,0,165,91,201,7
7240 data 48,27,233,7,133,91,169
7250 data 32,145,87,173,18,3,145
7260 data 94,24,230,87,230,94,144
7270 data 4,230,88,230,95,76,170
7280 data 115,170,189,220,115,145,87
7290 data 173,18,3,145,94,104,170
7300 data 104,168,104,96,101,84,71
7310 data 66,72,89,103,32,32,-1
8000 rem
8010 rem*******************************
8020 rem*daw horizontal bar - right   *
8030 rem*to left of spaces terminated *
8040 rem*in a thin line. resolution   *
8050 rem*135 x 25.                    *
8060 rem*column # in 89,              *
8070 rem*line   # in 90,              *
8080 rem*length   in 91,              *
8090 rem*colour   in 786.             *
8100 rem*routine called by sys(29680) *
8110 rem*******************************
8120 i=29680:t=0
8130 read a
8140 if a=-1 then 8180
8150 poke i,a:t=t+a
8160 i=i+1
8170 goto 8130
8180 print "routine 9:"
8190 if t=7092 then print "entered o.k.":goto 9000
8200 print "entered incorrectly"
8210 end
8220 data 72,152,72,138,72,32,0
8230 data 112,160,0,165,91,201,7
8240 data 48,27,233,7,133,91,169
8250 data 32,145,87,173,18,3,145
8260 data 94,56,198,87,198,94,176
8270 data 4,198,88,198,95,76,250
8280 data l15,170,189,44,116,145,87
8290 data 173,18,3,145,94,104,170
8300 data 104,168,104,96,103,89,72
8310 data 66,71,84,101,32,32,-1
9000 rem
9010 rem*******************************
9020 rem*draw vertical bar - bottom to*
9030 rem*top of spaces terminated on a*
9040 rem*thin line.resolution 135 x 40*
9050 rem*column # in 89,              *
9060 rem*line   # in 90,              *
9070 rem*length   in 91,              *
9080 rem*colour   in 786.             *
9090 rem*routine called by sys(29760) *
9100 rem*******************************
9110 i=29760:t=0
9120 read a
9130 if a=-l then 9170
9149 poke i,a:t=t+a
9150 i=i+1
9160 goto 9120
9170 print "routine 10:"
9180 if t=8307 then print "entered o.k.":goto 10000
9190 print "entered incorrectly"
9200 end
9210 data 72,152,72,138,72,32,0
9220 data 112,160,0,165,91,201,8
9230 data 48,37,233,8,133,91,169
9240 data 32,145,87,173,18,3,145
9250 data 94,24,165,87,233,39,133
9260 data 87,133,94,165,88,233,0
9270 data 133,88,24,105,212,133,95
9280 data 165,88,288,213,170,189,134
9290 data 116,145,87,173,18,3,145
9300 data 94,104,170,104,168,104,96
9310 data 100,82,70,64,67,68,69
9320 data 99,32,0,-1
10000 rem
10010 rem*******************************
10020 rem*draw vertical bar - top to   *
10030 rem*bottom of spaces terminated  *
10040 rem*in a twin line. resolution   *
10050 rem* 135 X x4.                   *
10060 rem*column # in 89,              *
10070 rem*line   # in 90,              *
10080 rem*length   in 91,              *
10090 rem*colour   in 786.             *
10100 rem*routine called by sys(29856) *
10110 rem*******************************
10120 i=29856:t=0
10130 read a
10140 if a=-l then 10180
10150 poke i,a:t=t+a
10160 i=i+1
10170 goto 10130
10180 print "routine 11:"
10193 if t=8180 then print "entered o.k.":goto 11000
10200 print "entered incorrectly"
10210 end
10220 data 72,152,72,138,72,32,0
10230 data 112,160,0,165,91,201,8
10240 data 48,37,233,8,133,91,169
10250 data 32,145,87,173,18,3,145
10260 data 94,24,165,87,105,40,133
10270 data 87,133,94,165,88,105,0
10288 data 133,88,24,105,212,133,95
10290 data 165,88,208,213,170,189,230
10300 data 116,145,87,173,18,3,145
10310 data 94,104,170,104,168,104,96
10320 data 99,69,68,67,64,70,82
10330 data 100,32,32,0,-1
11000 rem
11010 rem
11020 rem*******************************
11030 rem*draw a horizontal bar of any *
11040 rem*64 character.character stored*
11050 rem*in 784, column start in 89,  *
11060 rem*line start in 90, length of  *
11070 rem*line in 91, colour in 786.   *
11080 rem*routine called by sys(28800) *
11090 rem*******************************
11100 i=28800:t=0
11110 read a
11120 if a=-l then 11160
11130 poke i,a:t=t+a
11140 i=i+1
11150 goto 11110
11160 print "routine 12:"
11178 if t=3095 then print "entered o.k.":goto 11250
11180 print "entered incorrectly"
11190 end
11200 data 72,152,72,138,72,32,0
11210 data 112,164,91,173,16,3,145
11220 data 87,173,18,3,145,94,136
11230 data 208,243,104,170,104,168,104
11240 data 96,-1
11250 poke 51,0:poke 52,112
11260 poke 55,0:poke 56,112:clr:new