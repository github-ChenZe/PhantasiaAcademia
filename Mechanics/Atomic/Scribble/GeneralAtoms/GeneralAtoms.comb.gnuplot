set table "GeneralAtoms.comb.table"; set format "%.5f"
set samples 200.0; plot [x=1.6:3.4]  0.1*0.25 * (atan(10*(x-2.5)))**2 * sin(0.8*3.14159*sqrt(abs(x-2.5)))**2 * (1/( sin(5*pi*(x-2.5))**2 + 0.05 ) - 1/1.05) - 1 
