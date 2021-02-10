18 rem *******************************
20 rem *this prg emulates the display*
30 rem *of an anaolg edge meter, use *
35 rem *    keys 4 & 6               *
40 rem *to move meter needle up or   *
45 rem *        down.                *
50 rem *routine uses the following   *
55 rem *     machine code            *
60 rem *       routines:             *
70 rem * sys(29216) - cursor control *
80 rem * sys(29600) - fine-res       *
85 rem *              horizontal     *
90 rem * sys(29024) - border         *
100 rem* sys(23800) - horizontal line*
110 rem*******************************
120 poke 55,0:poke 56,112
130 rem limit top of memory
135 poke 51,0:poke 52,112:clr
140 print " "
145 rem
150 rem *draw scale in increments of 10
151 rem *   fine res lines
154 poke 53281,2
155 REM *  fine res lines
160 for q=130 to 0 step -10
170 poke 89,10:poke 90,10:poke 91,q:poke 786,1
175 sys(29600)
180 next q
183 rem
185 rem *display text using cursor
186 rem *     control
187 rem
190 data 6,11,"analog edge meter"
200 data 8,9,0
210 data 8,28,130
220 data 20,7,"digital value on meter"
230 for q=1 to 4
240 read a:poke 87,a:read a:poke 88,a:sys(29216)
250 read a$:print " "a$
260 next q
270 rem
280 rem *draw borders around meter
285 rem *       display
290 rem
320 poke 89,8:poke 90,9:poke 91,21:poke 92,4
325 poke 786,7:sys(29024)
340 poke 89,6:poke 90,5:poke 91,25:poke 92,9
345 poke 786,7:sys(29024)
350 rem
354 rem *see which key pressed (loc 197)
355 rem *   if key = 4 (197=11)
356 rem *then display value decreased.
357 rem *   if key = 6 (197=19)
358 rem *then display value increased.
360 rem
370 a=6
380 x=peek(197)
390 if x=19 then a=a+1:goto 420
400 if x=11 then a=a-l:goto 420
410 goto 380
420 if a<0 then a=0
430 if a>130 then a=130
434 rem
435 rem *locate cursor to display
436 rem *  digital equivalent
437 rem
440 poke 87,20:poke 38,30:sys(29216)
450 print "";a
454 rem
455 rem *erase previous meter needle
456 rem *      display
457 rem
460 poke 89,10:poke 90,11:poke 91,18:poke 784,32
461 poke 786,2:sys(28800)
464 rem
465 rem *display new needle position
466 rem
470 poke 89,10:poke 90,11:poke 91,a:poke 786,1
471 sys(29600)
480 goto 380