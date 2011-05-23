#!/bin/bash

ulimit -d 100000 -m 100000 -v 1000000
#perl -n -e '/^\{\"input\"\=\>\"(.*)\"\}$/ && print "$1\n"' temp.sk > temp1.sk
sed 's/\\r//g' $1 > sketchtemp/temp2.sk
sed 's/\\n//g' sketchtemp/temp2.sk > sketchtemp/temp3.sk
sed 's/\\t//g' sketchtemp/temp3.sk > sketchtemp/temp4.sk
sketch --slv-timeout=1 sketchtemp/temp4.sk > sketchtemp/sketchoutput
script/sketch2html.sh sketchtemp/sketchoutput
