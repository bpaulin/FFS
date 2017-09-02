lock steering to heading(90,90).
stage.
wait 1.

wait until ship:verticalspeed<0.
stage.

wait until ship:status = "landed" or ship:status="splashed".
