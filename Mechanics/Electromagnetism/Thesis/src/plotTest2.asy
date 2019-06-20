settings.outformat = "pdf";
size(2.5cm, 0);
Label Lx= Label("$x$", position=EndPoint);
Label Ly = Label("$y$", position=BeginPoint);
Label Lz = Label("$z$", position=MidPoint);
draw((0,0) -- (0,4), arrow=Arrow(TeXHead),
L=Lx);
draw((1,0) -- (1,4), arrow=Arrow(TeXHead),
L=Ly);
draw((2,0) -- (2,4), arrow=Arrow(TeXHead),
L=Lz);