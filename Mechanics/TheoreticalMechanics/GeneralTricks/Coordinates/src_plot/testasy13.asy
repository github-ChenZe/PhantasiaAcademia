import graph3; import solids;
//settings.outformat="pdf";
size(200,0); currentprojection=orthographic(-0.1,1,0.2);
real pow2(real x) { return (x)*(x); }
real pow4(real x) { return pow2(x)*pow2(x); }
triple sph2cart (triple t)
{ return (t.x*sin(t.y)*cos(t.z),t.x*sin(t.y)*sin(t.z),t.x*cos(t.y)); }
triple f(pair t) {
  return sph2cart((1/(0. - 1.3005572680251514*pow2(cos(t.x))*pow2(cos(t.y))*pow2(sin(t.x)) + 0.13201243635761023*pow2(cos(t.x))*pow2(sin(t.x))*pow2(sin(t.y)) + 1.110738498635555*pow4(cos(t.x)) + 0.11721516517669359*pow2(cos(t.y))*pow2(sin(t.y))*pow4(sin(t.x)) + 0.40749453039149086*pow4(cos(t.y))*pow4(sin(t.x)) + 0.01640741258244529*pow4(sin(t.x))*pow4(sin(t.y))), t.x, t.y));
}

pen p=rgb(0.2,0.5,0.7);
surface s=surface(f,(0,0),(pi,2pi), 30, 30, Spline);
draw(s,lightred);

real max=94.7252;
xaxis3("$x$",-max,max,red,Arrow3);
yaxis3("$y$",-max,max,green,Arrow3);
zaxis3("$z$",-max,max,blue,Arrow3);