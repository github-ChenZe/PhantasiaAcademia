import graph3;

size(8cm,0);

currentprojection=orthographic(4,2,3);
currentlight=(5,-2,4);

real radi = 1;
triple f(pair p) {
    return (radi*cos(p.x), radi*sin(p.x), p.y);
}

draw((0,0,0)--(0,0,2),arrow=Arrow3());
draw((0,0,0)--(0,2,0),arrow=Arrow3());
draw((0,0,0)--(2,0,0),arrow=Arrow3());
draw(surface(f,(0,0),(2*pi,1), 10, 10, Spline),
                   lightblue,blue);

//limits((0,0,0),(2,2,2));
//xaxis3("$x$",-2,2,Arrow3); 
//yaxis3("$y$",-2,2,Arrow3);
//zaxis3("$z$",-2,2,Arrow3);