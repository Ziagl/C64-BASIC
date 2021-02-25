10 rem ********************************
20 rem *this program uses the up and  *
25 rem *down block scroll             *
30 rem *routines to display the       *
35 rem *contents of a long list       *
40 rem *data items. use key 8 to      *
45 rem *scroll up the list            *
50 rem *and key 2 to scroll down the  *
55 rem *list.                         *
66 rem *the machine code routines used*
65 rem *by this prgoram are:          *
70 rem *   sys(29024) - draw a border *
80 rem *   sys(30128) - scroll block  *
85 rem *   up one line                *
50 rem *   down one line              *
100 rem*   sys(29216) - cursor control*
110 rem********************************
120 poke 55,0:poke 56,112
130 poke 51,8:poke 52,112:clr
135 rem lower top of memory
140 dim l$(40)
150 rem
160 rem *table of data to be displayed.
165 rem *  note the use of
170 rem *null entries at begining and
175 rem *  end of the table
180 rem *this gives a blank screen
185 rem *  trailer at both ends.
190 rem *of the display. essential for
195 rem *  neatness.
200 rem
210 data " "," "," "," "," "," "," "," "
220 data " item 1 ........................."
225 data " item 2 ........................."
230 data " item 3 ........................."
235 data " item 4 ........................."
240 data " item 5 ........................."
245 data " item 6 ........................."
250 data " item 7 ........................."
255 data " item 8 ........................."
260 data " item 9 ........................."
265 data " item 10 ........................"
270 data " item 11 ........................"
275 data " item 12 ........................"
280 data " item 13 ........................"
285 data " item 14 ........................"
290 data " item 15 ........................"
295 data " item 16 ........................"
300 data " item 17 ........................"
305 data " item 18 ........................"
310 data " item 19 ........................"
315 data " item 20 ........................"
320 data " "," "," "," "," "," "," "," "
330 for q=1 to 36
340 read a$
350 l$(q)=a$
360 next q
370 rem
330 rem *display text using cursor
335 rem *      control
390 rem
400 print " "
405 poke 53281,12:poke 53280,12
410 data 3,6,"example of scrolled long list"
420 data 7,9,"use key f1 to scroll up"
430 data 8,9,"use key f3 to scroll down"
440 for q=1 to 3
450 read a:poke 87,a:read a:poke 88,a:sys(29216)
460 read a$:print " "a$
470 next q
480 rem
490 rem *draw border around scrolled
495 rem *  portion of screen
500 rem
505 c=0
510 poke 89,0:poke 90,10:poke 91,29:poke 92,10
515 poke 786,c:sys(29024)
520 goto 680
530 rem
540 rem *look for key input in
545 rem *location 197
550 rem *if 197=4 then key f1 pressed
555 rem *   and scroll up
560 rem *if 197=5 then key f3 pressed
565 rem *   and scroll down
570 rem *also check pointer to table is
575 rem *  within bounds.
580 rem
590 if q<1 then q=1
600 if q>29 then q=29
610 x=peek(197)
620 if x=4 then q=q+1:goto 680
630 if x=5 then q=q-1:goto 750
640 goto 590
650 rem
660 rem *scroll list up une entry
676 rem
680 poke 89,2:poke 90,12:poke 91,37:poke 92,6
685 sys(30128)
690 poke 87,17:poke 88,2:sys(29216)
780 print " "l$(q+5)
710 goto 590
720 rem
730 rem *scroll list down one key
740 rem
750 poke 89,2:poke 90,12:poke 91,37:poke 92,6
755 sys(30240)
760 poke 87,12:poke 88,2:sys(29216)
770 print " "l$(q)
780 goto 590