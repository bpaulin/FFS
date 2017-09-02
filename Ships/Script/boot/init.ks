switch to 0.
CORE:PART:GETMODULE("kOSProcessor"):DOEVENT("Open Terminal").
wait 1.
runpath("missions/"+ship:name:tolower()).
