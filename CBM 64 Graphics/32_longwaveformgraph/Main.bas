1 rem *********************************
2 rem *this is a variation on the prg *
3 rem *on page 132, the graph of the  *
4 rem *function is scrolled across    *
5 rem *the screen from right          *
6 rem *to left continously as each    *
7 rem *plot point is calculated.      *
8 rem *ideal for displaying long      *
9 rem *graphical displays.            *
10 rem*uses the following machine     *
11 rem*code routines:                 *
12 rem* sys(29216) - cursor control   *
13 rem* sys(29024) - draw border      *
14 rem* sys(30976) - scroll screen    *
15 rem*              block left       *
16 rem* sys(29766) - draw vertical    *
17 rem*          fine resolution line *
18 rem*********************************
19 poke 55,0:poke 56, 112
20 poke 51,0:poke 52,112:clr
25 rem lower top of memory pointers
30 print " "
31 poke 53281,12:poke 53280,12
34 rem
35 rem * draw border around scrolled
36 rem * screen area
37 rem
40 poke 89,0:poke 90,7:poke 91,39:poke 92,15
41 poke 786,0:sys(29024)
44 rem
45 rem * display text using cursor
46 rem * control
47 rem
50 poke 87,3:poke 88,4:sys(29216)
60 print "example display of long waveform"
70 poke 87,4:poke 88,10:sys(29216)
80 print "using left scrolling"
84 rem
85 rem * display graph of function
86 rem * scrolled grom right to left
87 rem
90 for g=1 to 100 step .15
100 a=int(sin(q)*40)+45
110 poke 89,2:poke 90,3:poke 91,12:poke 92,36
115 sys(30976)
120 poke 89,38:poke 90,19:poke 91,a:poke 786,6
125 sys(29760)
130 for x=1 to 100:next x
140 next q