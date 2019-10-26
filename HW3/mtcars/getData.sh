#!/bin/bash

# sleep 5  # Slow down to watch what is going on.

rm -rf out
# My code will write my desired output (by redirecting stdout) to an
# "out" directory. First remove it, above, to clean up from earlier
# runs of this program.
mkdir out

echo "Hello from preclean.sh"



Rscript -e "write.csv(x=mtcars[ 1:10, ], file='mtcars1.csv'); \
               write.csv(x=mtcars[11:20, ], file='mtcars2.csv'); \
               write.csv(x=mtcars[21:32, ], file='mtcars3.csv');"
