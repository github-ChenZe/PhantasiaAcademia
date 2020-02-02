settings.render=16;
settings.outformat="png";
import three;
import graph3;
size(5cm,0);

real a = 2.5;
real Q1 = 1;
real Q2 = pi / 4;
real Q3 = 3 * pi / 4;

triple transf(real q1, real q2, real q3)
{
	return (a * cosh(q1) * cos(q2) * cos(q3),
		a * cosh(q1) * cos(q2) * sin(q3),
		a * sinh(q1) * sin(q2));
}

triple q1q2s(pair p)
{
    return transf(p.x, p.y, Q3);
}

triple q1q3s(pair p)
{
    return transf(p.x, Q2, p.y);
}

triple q2q3s(pair p)
{
    return transf(Q1, p.x, p.y);
}

draw( surface(q1q2s, (0, -pi/2), (1.5, pi/2), 20, Spline), lightblue + opacity(.4), meshpen = blue + opacity(.8));
draw( surface(q1q3s, (-1.5, 0), (1.5, 2 * pi), 20, Spline), yellow + opacity(.4), meshpen = orange + opacity(.8));
draw( surface(q2q3s, (-2, 0), (2, 2 * pi), 20, Spline), lightgreen + opacity(.4), meshpen = green + opacity(.8));

draw(O--5X, Arrow3()); //x-axis
draw(O--5Y, Arrow3()); //y-axis
draw(O--5Z, Arrow3()); //z-axis