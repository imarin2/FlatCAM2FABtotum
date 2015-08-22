#!/bin/bash

# $1 => first file and first to be executed
# $2 => second file and second to be executed
# your output is in a file with the same name of the first file but ending with _merged.gcode

tmpfile=`echo $2 | sed 's/.gcode/.tmp/g'`
outputfile=`echo $1 | sed 's/.gcode/_merged.gcode/g'`

cat $2 | sed -n '1,/G4 S3/!p' | sed -n '/G4 S5/,$!p' >$tmpfile

awk -v cmd="cat $tmpfile" '/G4 S5/ { system ( cmd ) } { print; } \' $1 > $outputfile

rm $tmpfile
#less $finishpadfile





