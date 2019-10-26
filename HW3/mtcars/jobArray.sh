#!/bin/bash

n=$SLURM_ARRAY_TASK_ID
# Now n is one of 1, 2, or 3 because of the line
#   sbatch --array=1-3 ./jobArray.sh
# in submit.sh.

# sleep 10 # Slow down to watch what is going on.
cat mtcars$n.csv | cut -d, -f7,11 | awk -F, '{if ($2 == "3") {print $0}}' | cut -d, -f1 > out/out$n.csv 

    
# echo "Hello, stderr from jobArray.sh $n." 1>&2 # sample line writing to stderr
# echo "Hello, stdout from jobArray.sh $n." # sample line writing to stdout
# echo $n >> out/$n.out # sample line writing to stdout, then redirecting to file
