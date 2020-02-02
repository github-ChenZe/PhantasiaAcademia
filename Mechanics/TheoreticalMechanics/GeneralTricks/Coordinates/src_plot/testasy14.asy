settings.outformat="pdf";
settings.render=4;
import three;
size(5cm,0);
//create segment
path3 segment = (0,1.2,0) --
(0,0.6,1.5);
//create surface of revolution
surface lampshade =
surface(segment, c=O, axis=Z);
//draw surface
draw(lampshade, yellow);
//draw revolved segment for reference
draw(segment, black);

draw(O--2X, blue); //x-axis
draw(O--2Y, green); //y-axis
draw(O--2Z, red); //z-axis