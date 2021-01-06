10 poke 53281,1:rem set screen colour to white
20 print "{clear}":rem clear the screen
30 for i=0 to 15:rem start of loop
40 poke 53280,i:rem change background colour
50 for j=1 to 1000:next j:rem delay
60 next i:rem next step in loop