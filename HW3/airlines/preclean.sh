#!/bin/bash

# sleep 5  # Slow down to watch what is going on.

rm -rf data
rm out.out
# My code will write my desired output (by redirecting stdout) to an
# out file. First remove it, above, to clean up from earlier
# runs of this program.
mkdir data

echo "Hello from preclean.sh"
