import graph3;
size(8cm,0);

currentprojection=perspective(5,5,3.5);
currentlight=light(white,(2,2,2),(2,-2,-2));

limits((0,0,0),(1.5,1.5,1.5));
xaxis3("$x$",Arrow3); 
yaxis3("$y$",Arrow3);
zaxis3("$z$",Arrow3);

real f(pair z) {return -z.y^2-z.x^2;}

draw(surface(f,(-1,-1),(1,1),nx=32,Spline),
                   lightblue+opacity(0.8),blue);
