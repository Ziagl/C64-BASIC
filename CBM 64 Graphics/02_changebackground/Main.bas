10 print "{clear}":rem clear the screen
20 for i=0 to 15:rem start of loop
30 poke 53281,i:rem change background colour
40 for j=1 to 1000:next j:rem delay
50 next i:rem next step in loop