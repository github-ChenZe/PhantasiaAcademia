set table "SemiconductorGeneral.atan.table"; set format "%.5f"
set samples 25; plot [x=0:4] 0.7*4*atan(x/4*60)
