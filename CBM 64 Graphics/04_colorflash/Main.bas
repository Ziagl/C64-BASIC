10 print "{clear}":rem clear the screen
20 for i=0 to 15:rem setup screen change loop
30 for j=0 to 15:rem setzp border change loop
40 poke 53280,j:rem change border colour
50 next j:rem next step in border loop
60 poke 53281,i:rem change screen colour
70 next i:rem once border finished, change screen again