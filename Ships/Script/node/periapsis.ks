function node_periapsis {
  parameter delay.
  parameter new_periapsis.

  debugMessage("node_periapsis delay=" + round(delay) + ", new=" + round(new_periapsis)).
  local currentV is velocityAt(ship, time:seconds + delay).
  set currentV to currentV:orbit:mag.
  debugMessage("currentV: " + round(currentV)).
  local distance is (positionAt(ship, time:seconds + delay) - ship:body:position):mag.
  local sma is body:radius + (apoapsis + new_periapsis)/2.
  local wantedV is sqrt(body:mu*(2/distance-1/sma)).
  debugMessage("wantedV: " + round(wantedV)).
  debugMessage("dV: " + round(wantedV-currentV)).

  add node(time:seconds + delay,0,0, wantedV-currentV).
  debugMessage("next periapsis: "+round(nextnode:orbit:periapsis)).
}
