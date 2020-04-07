set table "Interpolation.pgf-plot.table"; set format "%.5f"
set samples 25; plot [x=-3:3] (1+x+x*x/2+x*x*x/6)/4
