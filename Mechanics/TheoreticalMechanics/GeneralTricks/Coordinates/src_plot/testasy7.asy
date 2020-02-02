settings.outformat = "png";
settings.render=0
size(345.0pt,0);
import graph3;
currentprojection = perspective(75,0);
real r1=5, r0=1;
int nu = 36, nv = 36;
path3 crossSection = Circle(r=r0, c=(r1,0,0), normal=Y, n= nu);
surface torus = surface(crossSection, c=(0,0,0), axis=Z, n=nv, angle1=90, angle2=410);
draw(torus);