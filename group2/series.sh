#!/bin/bash

# I wrote this script to ease testing the individual steps used in
# sd.dag without using HDCondor, because I'd rather debug problems
# with these steps without involving Condor.

./pre.sh

# serial loop to do what job1sumDataFiles.sub does in parallel
for i in 0{0..4}; do
    ./job1ProcessWord.sh $i
done

./job1PostWordcount.sh

