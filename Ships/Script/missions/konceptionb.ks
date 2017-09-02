lock steering to heading(90,90).
stage.
wait 1.

wait until verticalspeed>80.
lock steering to heading(90,90-sqrt((90^2)*altitude/body:atm:height)).

wait until ship:verticalspeed<0.
stage.
lock steering to retrograde.

wait until chutes.
unlock steering.

wait until ship:status = "landed" or ship:status="splashed".
