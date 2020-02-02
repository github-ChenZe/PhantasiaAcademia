settings.outformat="pdf";
settings.prc=false;
settings.render=0;
import graph3;
size(4cm,0);
path3 myarc = rotate(18,Z) * Arc(c=O,
normal=X, v1=-Z, v2=Z, n=10);
surface backHemisphere =
surface(myarc, angle1=0,
angle2=180, c=O, axis=Z, n=10);
surface frontHemisphere = surface(myarc, angle1=180,
angle2=360, c=O, axis=Z, n=10);
draw(backHemisphere, surfacepen=material(white+opacity(0.8),
ambientpen=white), meshpen=gray(0.4));
draw(O--X, blue+linewidth(1pt));
draw(frontHemisphere, surfacepen=material(white+opacity(0.8),
ambientpen=white), meshpen=gray(0.4));