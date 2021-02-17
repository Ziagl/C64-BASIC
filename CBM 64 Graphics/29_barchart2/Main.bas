10 rem ********************************
20 rem *two data sets each of up to 15*
25 rem *values all the numbers        *
30 rem *are displayed by this routine *
35 rem *as a barchart.                *
40 rem *machine code routines used    *
45 rem *are:                          *
50 rem *  sys(29024) - draw border    *
60 rem *  sys(29216) - cursor control *
70 rem *  sys(29408) - plot vertical  *
74 rem *  fine res bar                *
75 rem *  sys(29760) - plot vertical  *
76 rem *  fine res line               *
80 rem ********************************
90 rem limit top of memory
100 poke 55,0:poke 56,112:poke 51,0:poke 52,112:clr
110 dim p%(31)
120 rem
130 rem *data to be displayed
140 rem
150 data 2,1,4,2,6,3,8,4,10,5,12,6,14,7,16
155 data 8,18,9,20,10
160 data 22,11,24,12,26,13,28,14,30,15
170 for q=1 to 30
180 read a
190 p%(q)=a
200 next q
210 rem
220 rem *display text using cursor
225 rem *     control
230 rem
240 print" "
245 poke 53281,12
250 data 1,14,"example bar chart"
260 data 20,2,0
270 data 22,7,"1 2 3 4 5 6 7 8 9 1 1 1 1 1 1 "
280 data 23,7,"                  0 1 2 3 4 5"
290 for q=1 to 4
300 read a:poke 87,A:read a:poke 88,a:sys(29216)
310 read a$:print" "a$
320 next q
330 rem
340 rem *draw border around display
350 rem
360 poke 89,5:poke 90,2:poke 91,32:poke 92,20
365 poke 786,2:sys(29024)
370 rem
380 rem *define scale for plotting
390 rem
400 b=0
410 for q=1 to 30
420 a=p%(q)
430 if a>b then b=a
446 next q
450 rem
460 rem *print maximum displayed value
470 rem
480 print "         "b
490 a=b/135
500 for q=1 to 30
510 rem
520 rem *display barchard #1 (bar)
530 rem
540 as=int(p%(q)/a)
545 c=int(rnd(1)*8)+1
546 if c+240=peek(53281) or c=cc then 545
550 poke 90,20:poke 89,q+6:poke 91,as:poke 786,c
560 sys(29408)
565 cc=c
570 rem
580 rem *display barchart #2 (line)
590 rem
600 q=q+1
610 as=int(p%(q)/a)
615 c=int(rnd(1)*8)+1
616 if c+240=peek(53281) or c=cc then 615
620 poke 90,20:poke 89,q+6:poke 91,as:poke 786,c
630 sys(29760)
635 cc=c
640 next q
650 get a$:if a$="" then 650
655 rem **wait till key pressed to end**