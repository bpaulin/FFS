

runoncepath("libs/message").
runoncepath("node/periapsis").
runoncepath("libs/node").


wait 1.
set ship:control:pilotmainthrottle to 0.
if ship:status="orbiting" {

}
else {
  noticeMessage("launch").
  lock throttle to 1.
  lock steering to heading(90,90).
  stage.

  set MAX to maxthrust.
  set BurnTime to 0.
  set DeltaV to 0.

  when maxthrust < MAX OR availablethrust = 0 then {
  	lock throttle to 0.
  	stage.
  	lock throttle to 1.
  	set MAX to maxthrust.
  	preserve.
  }

  wait 1.

  noticeMessage("vertical ascent").
  wait until verticalspeed>100.

  noticeMessage("pseudo gravity turn").
  lock steering to heading(90,90-sqrt((90^2)*(altitude)/body:atm:height)).
  wait until apoapsis > 72000.

  noticeMessage("coasting to space").
  until altitude > body:atm:height {
    if apoapsis<72000 {
      lock throttle to 0.1.
    }
    else {
      lock throttle to 0.
    }
    wait 0.5.
  }
  lock steering to heading(90,0).

  noticeMessage("circularize").
  node_periapsis(eta:apoapsis, ship:apoapsis).
  node_exec().
}
