10 print "{clear}":rem clear the screen
20 poke 53265, peek (53265) or 64:rem enable extended mode
30 poke 53280,1:rem white border
40 poke 53281,0:rem black screen
50 poke 1024,44:rem put an x in top left hand corner of screen
60 poke 55296,1:rem change it to white
70 poke 53282,7:rem set background colour 1 to yellow
80 poke 1024,88:rem white x white yellow background on black screen