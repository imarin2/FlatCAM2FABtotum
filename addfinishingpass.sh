#!/bin/bash

# $1 => file_in (it has to be already postprocessed)
# $2 => finishing extra depth in mm
# your output is in a file with the same name but ending with _finishpath.gcode

finishpathfile=`echo $1 | sed 's/.gcode/.finishpath/g'`
outputfile=`echo $1 | sed 's/.gcode/_finishpath.gcode/g'`

cat $1 | sed -n '1,/G4 S3/!p' | sed -n '/G4 S5/,$!p' | sed -r 's/(G1 *Z-)([0-9]+\.*[0-9]*)/ echo \1`echo "x="\2"+'"$2"';if(x<1) print 0; x" | bc` /ge'>$finishpathfile

awk -v cmd="cat $finishpathfile" '/G4 S5/ { system ( cmd ) } { print; } \' $1 > $outputfile

rm $finishpathfile
#less $finishpadfile





