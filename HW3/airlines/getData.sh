#!/bin/bash

n=$(($SLURM_ARRAY_TASK_ID+1986))

wget http://stat-computing.org/dataexpo/2009/$n.csv.bz2  -P data


bzip2 -d data/$n.csv.bz2


cat data/$n.csv | cut -d, -f4,16,17,18,19 | awk -F, '{if ($3 == "MSN") {print $0} }' > data/MSN$n.csv
