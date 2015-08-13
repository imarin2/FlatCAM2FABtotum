# FlatCAM2FABtotum

This is a bash shell script, so it is intended to be used in Linux/Unix or in any other bash compatible environment

It is used like this:

./post_process.sh FABDialIndicatorHead.drl_cnc_0.5mm.gcode 12000

the first parameter is the gcode file to convert.
the second parameter is the rpms of the spindle.

This will result in a new file named:

FABDialIndicatorHead.drl_cnc_0.5mm_postprocessed.gcode

being created. This file is now FABtotum compatible.
