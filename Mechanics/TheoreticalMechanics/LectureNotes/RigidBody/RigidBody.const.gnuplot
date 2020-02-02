set table "RigidBody.const.table"; set format "%.5f"
set samples 25; plot [x=0.1:3.1] (1-0.8*cos(x))^2/(2*sin(x)^2)+1*cos(x)
