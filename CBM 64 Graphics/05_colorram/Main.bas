10 poke 53280,0:rem set black border
20 poke 53281,1:rem set white screen
30 for i=1024 to 2023:rem set up screen fill loop
40 poke i,int(rnd(0.5)*25+1):rem poke random letter onto screen
50 next i:rem next step in screen fill loop
60 for j=55296 to 56295:rem set up colour change loop
70 poke j,int(rnd(1)*16):rem poke random colour
80 next j:rem next step in colour change loop