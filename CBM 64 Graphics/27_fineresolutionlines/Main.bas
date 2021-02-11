10 rem ********************************
20 rem *using fine resolution lines   *
25 rem *      this program            *
30 rem *plots the graph of a function.*
40 rem *program uses the following    *
45 rem *machine code routines:        *
50 rem *  sys(29024) - draw border    *
60 rem *  sys(29760) - vertical       *
65 rem *  fine res line               *
70 rem *  sys(29216) - cursor control *
80 rem ********************************
90 poke 55,0:poke 56,112
100 rem limit top of memory
105 poke 51,0:poke 52,112:clr
110 print " "
120 rem
130 rem *draw vertical scale in
135 rem *increments of 10 fine res lines
140 rem
145 poke 53281,12
150 for q=110 to 0 step-10
160 poke 89,0:poke 90,20:poke 91,q:poke 786,1
165 sys(29760)
170 next q
180 rem
190 rem *draw border around display
200 rem
210 poke 89,0:poke 90,6:poke 91,38:poke 92,16
215 poke 786,6:sys(29024)
220 rem
230 rem *display text using cursor
235 rem *    control
240 rem
250 poke 87,7:poke 88,9:sys(29216)
260 print"graph of sine function"
270 rem
280 rem *plot graph of function. note
285 rem *  offset given to function
290 rem *to ensure no negative values
295 rem *  for plot or values over 135
300 rem
310 for q=2 to 37
320 a=int(SIN((q-2)/5.5)*40)+50
330 poke 89,q:poke 90,20:poke 91,a:poke 786,2
335 sys(29760)
340 next q
350 get a$:if a$="" then 350
355 rem press any key to end
360 end