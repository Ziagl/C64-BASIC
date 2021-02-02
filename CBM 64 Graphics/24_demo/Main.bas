10 rem ********************************
15 rem *demonstration program to show *
20 rem *some of the applications for  *
25 rem *the following routines in the *
30 rem * graphis package:             *
35 rem *cursor control   - sys(29216) *
40 rem *horizontal line  - sys(28800) *
45 rem *vertical line    - sys(28832) *
50 rem *     borders     - sys(29024) *
55 rem *block display    - sys(28896) *
60 rem *block reverse    - sys(28960) *
65 rem *this program is just part of a*
70 rem *hypothetical application and  *
75 rem *is only intended as a demo    *
80 rem ********************************
130 poke 55,0:poke 56,112
140 rem * limit top of memory
145 poke 51,0:poke 52,112:clr
150 t=0:gt=0:l=4:la=18
160 print " "
170 rem
180 rem
199 rem * set up borders
200 rem
210 rem
214 poke 53281,12:poke 53280,2
215 c=l
220 poke 89,0:poke 90,0:poke 91,38:poke 92,15
225 poke 786,c:sys(29024)
230 poke 89,0:poke 90,15:poke 91,18:poke 92,10
235 poke 786,c:sys(29045)
240 poke 89,20:poke 90,15:poke 91,18:poke 92,10
245 poke 786,c:sys(29024)
250 rem
260 rem
270 rem * set up horizontal and
275 rem *    vertical bars
280 rem
290 rem
295 c=l
300 poke 89,20:poke 90,2:poke 91,9:poke 784,84
305 poke 786,c:sys(28832)
310 poke 89,25:poke 90,2:poke 91,9:poke 784,84
315 poke 786,c:sys(28832)
320 poke 89,31:poke 90,2:poke 91,9:poke 784,84
325 poke 786,c:sys(28832)
330 poke 89,30:poke 90,11:poke 91,7:poke 784,70
335 poke 786,c:sys(28800)
340 rem
350 rem
360 rem * display character to indicate
370 rem * address input limits
380 rem
390 rem
400 poke 89,2:poke 90,18:poke 91,16:poke 92,5
405 poke 784,100:poke 786,c:sys(28896)
410 rem
429 rem
430 rem * set up screen text using
431 rem *     cursor
435 rem * control routine each item of
440 rem * text is held as three elements
445 rem * in a data statement  they are
450 rem * column #, line #, and text
460 rem
479 rem
480 data 4,2,description
490 data 21,2,qty
500 data 26,2,cost
510 data 32,2,total
520 data 25,12,total
530 data 3,16,name & address
540 data 23,16,function - ?
550 data 23,18,1 - update
560 data 23,26,2 - delete
570 data 23,22,3 - exit
580 for q=1 to 10
590 read a:poke 88,a:rem * column #
600 read a:poke 87,a:rem * line #
610 sys(29216):      rem * move cursor
620 read a$:print " "a$:rem * display text
630 next q
640 rem
650 rem
660 rem * select and rvs field active
665 rem * screen function from menu
670 rem * enclosed in bottom left border
680 rem
690 rem
700 rem
710 rem * rvs to highlight word function
715 rem *          in menu
720 rem
730 poke 89,23:poke 90,16:poke 91,12:poke 92,1
735 poke 786,2:sys(28960)
740 get a$:if a$="" then 740
750 rem
760 rem * rvs to remove hightlight from
765 rem *          'function'
770 rem
780 poke 89,23:poke 90,16:poke 91,12:poke 92,1
785 poke 786,1:sys(28960)
790 a=val(a$):on a goto 830,2300,2630
800 GOTO 640
810 rem
820 rem
830 rem * update function demo only
840 rem
850 rem
860 rem
870 rem * rvs to highlight 'update'
875 rem *         in menu
880 rem
890 poke 89,23:poke 90,18:poke 91,10:poke 92,1
895 poke 786,2:sys(28960)
900 if l<10 then 1040
910 rem
920 rem * cursor control to display
925 rem *      error message
930 rem
940 poke 87,12:poke 85,2:sys(29216)
950 print "record full"
960 goto 1880
970 rem
980 rem * input description
990 rem
1000 rem
1010 rem * highlight 'description' and
1015 rem *    put cursor to
1020 rem * display input on line 'l'.
1030 rem
1040 poke 89,4:poke 90,2:poke 91,11:poke 92,1
1045 poke 786,2:sys(28960)
1050 poke 87,L:poke 88,4:sys(29216)
1060 d$=""
1070 get a$:if a$="" then 1070
1080 rem
1090 rem * if input is '^' then abort to
1095 rem *    next section and
1100 rem * remove highlight from
1105 rem '     'DESCRIPTION'
1110 rem
1120 if a$<>"^" then 1130
1125 poke 89,4:poke 90,2:poke 91,11:poke 92,1
1126 poke 786,1:sys(28960):goto 2000
1130 d$=d$+a$:if a$=chr$(13) then goto 1180
1140 print " " a$;:goto 1070
1150 rem
1160 rem * remove highlight rvs from
1165 rem *        'description'
1170 rem
1180 poke 89,4:poke 90,2:poke 91,11:poke 92,1
1185 poke 786,1:sys(28960)
1190 rem
1200 rem * input quantity
1210 rem
1220 rem * rvs field to highlight 'qty'
1225 rem *     and move cursor to
1230 rem * display input on line 'l'.
1240 rem
1250 poke 89,21:poke 90,2:poke 91,3:poke 92,1
1255 poke 786,2:sys(28960)
1260 poke 87,l:poke 88,21:sys(29216)
1270 q$=""
1280 get a$:if a$="" then 1280
1290 q$=q$+a$:if a$=chr$(13) then goto 1340
1300 print " "a$;:goto 1280
1310 rem
1320 rem * remove rvs highlight from
1325 rem *           'qty'
1330 rem
1340 poke 89,21:poke 90,2:poke 91,3:poke 92,1
1345 poke 786,1:sys(28960)
1350 rem
1360 rem * input cost
1370 rem
1380 rem * rvs to highlight 'cost' and
1385 rem *   put cursor on line 'l'
1390 rem * to display input
1400 rem
1410 poke 89,26:poke 90,2:poke 91,4:poke 92,1
1415 poke 786,2:sys(28960)
1420 poke 87,l:poke 88,26:sys(29216)
1430 c$=""
1440 get a$:if a$="" then 1440
1450 c$=c$+a$:if a$=chr$(13) then goto 1500
1460 print " "a$;:goto 1440
1470 rem
1480 rem * remove rvs highlight from
1485 rem *          'cost'
1490 rem
1500 poke 89,26:poke 90,2:poke 91,4:poke 92,1
1505 poke 786,1:sys(28960)
1510 rem
1520 rem * calculate and display total
1530 rem
1540 rem * rvs to highlight 'total'
1550 rem
1560 poke 89,32:poke 90,2:poke 91,5:poke 92,1
1565 poke 786,2:sys(28960)
1570 t=val(q$)*val(c$):gt=gt+t
1580 rem
1590 rem * put cursor on line 'l' fit
1595 rem *   position to display total
1600 rem
1610 poke 87,lpoke 88,32:sys(29216)
1620 print " "t
1630 rem
1640 rem * remove rvs highlight from
1645 rem *          'total'
1650 rem
1660 poke 89,32:poke 90,2:poke 91,5:poke 92,1
1665 poke 786,1:sys(28960)
1670 rem
1680 rem * prompt for another entry
1690 rem
1700 rem * move cursor to location for
1705 rem *   prompt and display
1710 rem
1720 poke 87,13:poke 88,2:sys(29216)
1730 print " another entry - y or n "
1740 get a$:if a$="" then 1740
1750 l=l+1
1760 rem
1770 rem * use horizontal bar of space
1775 rem *    chars to delete prompt
1780 rem
1790 poke 89,1:poke 90,13:poke 91,22:poke 784,32
1795 poke 786,0:sys(28800)
1800 if a$="n" then 1880
1810 goto 900
1820 rem
1830 rem * calculate grand total for all
1835 rem *         entries
1840 rem
1850 rem * rvs to highlight 'total' and
1855 rem *   move cursor to
1860 rem * location to display grand
1865 rem *        total
1870 rem
1880 poke 89,25:poke 90,12:poke 91,5:poke 92,1
1885 poke 786,2:sys(28960)
1890 poke 87,12:poke 88,32:sys(29216)
1900 print " "gt:for q=1 to 100:next q
1916 rem
1920 rem * remove rvs 'highlight' from
1925 rem *      total
1930 rem
1940 poke 89,25:poke 90,12:poke 91,5:poke 92,1
1945 poke 786,1:sys(28960)
1950 rem
1960 rem * input name and address
1970 rem
1980 rem * rvs highlight 'name and'
1985 rem *      'address'
1990 rem
2000 poke 89,3:poke 90,16:poke 91,14:poke 92,1
2005 poke 786,2:sys(28960)
2010 la=18
2020 rem
2030 rem * move cursor to start of name
2035 rem *    and address input
2040 rem *    on line 'la'
2050 rem
2060 poke 87,la:poke 88,2:sys(29216)
2070 get a$:if a$="" then 2070
2080 if a$="^" then 2210
2090 if a$=chr$(13) then 2070
2100 print " "a$;:ad$=ad$+a$
2110 if a$="," then la=la+1:goto 2140
2120 if a$="." then goto 2160
2130 goto 2070
2140 if la>22 then la=22
2150 goto 2060
2160 get a$:if a$="" then 2160
2170 if a$<>chr$(13) then 2070
2180 rem
2190 rem * rvs to remove highlight from
2195 rem *      'name and address'
2200 rem
2210 poke 89,3:poke 90,16:poke 91,14:poke 92,1
2215 poke 786,1:sys(28960)
2220 rem
2230 rem * remove highlight from function
2235 rem *        'update'
2240 rem * and return to function select
2250 rem
2260 poke 89,23:poke 90,18:poke 91,10:poke 92,1
2265 poke 786,1:sys(28960)
2270 goto 640
2280 rem
2290 rem
2300 rem * delete record function
2310 rem
2320 rem
2330 d$="":q$="":c$="":ad$=""
2340 rem
2350 rem * rvs to highlight 'delete'
2355 rem *     function
2360 rem
2370 poke 89,23:poke 90,20:poke 91,10:poke 92,1
2375 poke 786,2:sys(28960)
2380 t=0:gt=0:l=4:la=18
2390 rem
2400 rem * delete blocks of text from
2405 rem *  screen using the routine
2410 rem * to fill a screen block with
2415 rem *  specified character
2428 rem * - here a space character
2436 rem
2440 poke 89,2:poke 90,4:poke 91,18:poke 92.7
2445 poke 784,32:poke 786,0:sys(28896)
2450 poke 89,21:poke 90,4:poke 91,4:poke 92,7
2455 poke 784,32:poke 786,0:sys(28896)
2460 poke 89,26:poke 90,4:poke 91,4:poke 92,7
2465 poke 784,32:poke 786,0:sys(28896)
2470 poke 89,32:poke 90,4:poke 91,6:poke 92,7
2475 poke 784,32:poke 786,0:sys(28896)
2480 rem
2490 rem * delete line using horizontal
2495 rem *    line drawing with
2500 rem * space character
2510 rem
2520 poke 89,32:poke 90,12:poke 91,5:poke 784,32
2525 poke 786,0:sys(28800)
2530 rem
2540 rem * display character block to
2545 rem *  give address input limit
2550 rem
2560 poke 89,2:poke 90,18:poke 91,16:poke 92,5
2565 poke 784,100:poke 786,1:sys(28896)
2570 rem
2580 rem * rvs to remove highlight from
2585 rem * 'delete' and
2590 rem * return to function select.
2600 rem
2610 poke 89,23:poke 90,20:poke 91,10:poke 92,1
2615 poke 768,1:sys(28960)
2620 goto 640
2630 stop