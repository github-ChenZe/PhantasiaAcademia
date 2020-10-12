set table "FET.pgf-plot.table"; set format "%.5f"
set samples 25; plot [x=4:6] 1.8+1.5/2*0.2/16*4/pi*(-atan(8*(6-x)))
