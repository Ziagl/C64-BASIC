10 print "{clear}xxxxxxxxxx":rem clear the screen, then print 10 x's
20 poke 53281,7:rem set background colour zero to yellow
30 poke 53282,2:rem set background colour one to red
40 poke 53283,14:rem set background colour two to light blue
50 poke 53270,peek (53270) or 16:rem turn multi-colour mode on
60 a=55296:rem start of colour ram
70 for i=0 to 9:rem start of loop
80 poke a+i,14:rem blue clause in multi-colour mode
90 next i:rem next step in loop