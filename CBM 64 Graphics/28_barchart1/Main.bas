10 rem ********************************
20 rem *a single data set of up to 31 *
25 rem *values all the numbers        *
30 rem *are displayed by this routine *
35 rem *as a barchart.                *
40 rem *machine code routines used    *
45 rem *        are:                  *
50 rem * sys(29024) - draw border     *
60 rem * sys(29216) - cursor control  *
70 rem * sys(29408) - plot vertical   *
75 rem * fine res bar                 *
80 rem ********************************
90 rem * limit top of memory
100 poke 55,0:poke 56,112:poke 51,0:poke 52,112:clr
110 dim p%(31)
120 rem
130 rem *data to be displayed
140 rem
150 data 2,5,6,3,9,8,10,15,11,17,24,22,18
155 data 16,17,18,19,20,21,18
160 data 25,23,28,26,20,13,5,21,28,26,35
170 rem
180 rem *put data into array p%
190 rem
200 for q=1 to 31
210 read a
220 p%(q)=a
230 next q
240 print" "
250 rem
255 poke 53281,12
260 rem *display text using cursor
265 rem *      control
278 rem
280 data 2,14,"example bar chart"
290 data 21,2,0
300 data 23,7,"0............................31"
316 for q=1 to 3
320 read a:poke 87,a:read a:poke 88,a:sys(29216)
330 read a$:print" "a$
340 next q
350 rem
360 rem *draw border around display
365 rem *     area
370 rem
380 poke 89,5:poke 90,3:poke 91,33:poke 92,20
385 poke 786,6:sys(29024)
390 rem
400 rem
410 rem *define scale for plotting
420 b=0
430 for q=1 to 31
440 a=p%(q)
450 if a>b then b=a
469 next q
470 rem
480 rem *print maximum displayed value
490 rem
500 print"     "b
510 rem
520 rem *display barchart using vertical
525 rem *   barplot routine
530 rem
540 a=b/135
550 for q=1 to 31
560 as=int(p%(q)/a)
565 c=int(rnd(1)*8)+1
566 if c+240=peek(53281)or c=cc then 565
570 poke 90,21:poke 89,q+6:poke 91,as:poke 786,c
580 sys(29408):cc=c
590 next q
600 get a$:if a$="" then 600
605 rem **wait till key pressed to end**