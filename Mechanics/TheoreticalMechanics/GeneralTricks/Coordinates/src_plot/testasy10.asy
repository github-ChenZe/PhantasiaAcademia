import graph3;

size(7.5cm,0);

currentprojection=orthographic(4,2,3);
currentlight=(5,-2,4);

real f(pair z) {return z.y^2-z.x^2;}

limits((0,0,0),(1,1,1));
xaxis3("$x$",Arrow3); 
yaxis3("$y$",Arrow3);
zaxis3("$z$",Arrow3);

draw(surface(f,(-1,-1),(1,1),nx=32,Spline),
                   lightblue+opacity(0.8),blue);