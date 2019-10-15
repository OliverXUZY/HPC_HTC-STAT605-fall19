#!/bin/bash

echo "hello world"

cat Property_Tax_Roll.csv | head > stdout

grep "MADISON SCHOOLS" < Property_Tax_Roll.csv >> stdout

awk '{FS=","; sum += $7; n++} END {print sum/n}' < Property_Tax_Roll.csv
