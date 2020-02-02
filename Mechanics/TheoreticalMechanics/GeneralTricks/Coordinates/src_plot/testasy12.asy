import graph3;
size(8cm,0);
currentprojection=orthographic((10,10,7),zoom=.99);

real a=sqrt(3), b=1, dy=.5;

triple f(pair p){
  real x=p.x;
  real y=p.x^2;
  real z=p.y*(a^2-p.x^2);
  return (x,y,z);
}

surface s=surface(f,(-a,0),(a,1),100);
draw(s,yellow+opacity(.5));

limits((-.5,-.5,0),(a,a^2+.5,a^2+.5));
xaxis3("$x$",Arrow3);
yaxis3("$y$",Arrow3);
zaxis3("$z$",Arrow3);