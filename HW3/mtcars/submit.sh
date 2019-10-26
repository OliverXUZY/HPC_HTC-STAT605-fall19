#!/bin/bash

rm -rf slurm_out; mkdir slurm_out

# I can't move previous line into cleanUpMakeDirs.sh (next line)
# because (I think) "slurm_out" directory has to exist as sbatch
# starts, in light of my "--output=..." specification.

# The following code enforces this order of running jobs:
#
#                  preclean.sh
#              /        |        \
#   jobArray.sh    jobArray.sh    jobArray.sh
#   (SLURM_ARRAY_TASK_ID is set to 1, 2, 3 in these three jobs)
#              \        |        /
#                 \     |     /
#                    \  |  /
#                 findLightest.sh

jobId1=$(sbatch --output="slurm_out/slurm-%A_%a.out" getData.sh)
# Strip off "Submitted batch job " from $jobId1. It has the form
# "Submitted batch job 6768660" (where the number changes from job to job).
jobId1=$(echo $jobId1 | sed 's/Submitted batch job //')

jobId2=$(sbatch --array=1-3 --output="slurm_out/slurm-%A_%a.out" --dependency=afterany:$jobId1 jobArray.sh)
jobId2=$(echo $jobId2 | sed 's/Submitted batch job //') # Strip off "Submitted batch job ".

jobId3=$(sbatch --output="slurm_out/slurm-%A_%a.out" --dependency=afterany:$jobId2 findLightest.sh)
