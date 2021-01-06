10 print "{clear}":rem clear the screen
20 poke 53270, peek (53270) or 16:rem turn on multi-colour mode
30 poke 53282,10:rem background colour one set to red
40 for i=1 to 999:rem start of loop
50 print "x";:rem print 'x' character on screen
60 next i:rem 999 times i.e. fill up the screen
70 a=int(rnd(0.5)*16):rem produce a number from 0 to 15
80 poke 53282,a:rem change background color 1 randomly
90 for j=1 to 1000:next:rem wait for about 1 second
100 goto 70:rem change colour again