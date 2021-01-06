10 print "{clear}":rem clear the screen
20 input a:rem input a number
30 if a<0 or a>16 then 20:rem don't accept invald input
40 if a=16 then end
50 poke 53280,a:rem change border colour as requested
60 goto 20:rem back and do it again