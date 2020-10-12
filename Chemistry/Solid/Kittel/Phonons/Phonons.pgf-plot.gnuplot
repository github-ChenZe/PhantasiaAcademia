set table "Phonons.pgf-plot.table"; set format "%.5f"
set format "%.7e";; set samples 201; set dummy x; plot [x=-5.0000000000:5.0000000000]  sqrt((3-sqrt(5+4*cos(x))) / 2) / sqrt(3) ;
