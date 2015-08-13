#!/bin/bash

# $1 => file_in
# $2 => rpm
feed_rapids='F10000'
feed_tool=`cat $1 | grep '^F'`

cat $1 | sed "/^G00/ s/$/ $feed_rapids/" | sed "/^G01/ s/$/ $feed_tool/" | sed "/^G21/ d" | sed "/^G94/ d" | sed "/^F/ d" | sed "/^G04 P1/ d" | sed "s/M03/M03 S$2\nG4 S3/g" | sed "s/M05/G4 S5\nM05/g" | sed 's|Y| Y|g' | sed 's|Z| Z|g' | sed -e '/^$/ d' | sed 's/G00/G0/g' | sed 's/G01/G1/g' > `echo $1 | sed 's/.gcode/_postprocessed.gcode/g'`


