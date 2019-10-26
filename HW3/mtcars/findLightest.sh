#!/bin/bash

echo "Hello findLightest.sh"

# sleep 10  # Slow down to watch what is going on.

for file in $(ls -1 out/out*.csv); do
    cat $file >> out.csv
done

# cat out.csv	 

cat out.csv | sort -n | head -n1 > out.out

rm out.csv
