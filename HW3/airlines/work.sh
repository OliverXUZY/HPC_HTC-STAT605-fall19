#!/bin/bash


for file in $(ls -1 data/MSN*.csv); do
    cat $file >> data/allMSN.csv
done


cat data/allMSN.csv  |cut -d, -f3,4,5 | sort -t, -k3nr | head -n1 > out.out

module load R/R-3.6.1

Rscript average.r

echo Mo Tu We Th Fr Sa Su >> out.out

cat res.txt >> out.out

rm res.txt
