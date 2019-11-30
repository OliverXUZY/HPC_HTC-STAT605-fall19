#!/bin/bash

if [ ! -d res ]; then
  mkdir res
fi
rm -r res
mkdir res

mv *.csv res

num_file=2459

# sort -m *.csv | tail -n +$num_file | head -101

sort -t',' -k1n res/*.csv | tail -n +$num_file | head -101 > hw4best100.csv
