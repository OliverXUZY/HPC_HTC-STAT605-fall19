#!/bin/bash

# untar your R installation
tar -xzf R361.tar.gz
tar -xzf packages.tar.gz
tar -xvzf $2.tgz   ### first extract data in directory

# make sure the script will use your R installation, 
# and the working directory as its home location
export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_LIBS=$PWD/packages

# run your script
Rscript hw4.R $1 $2 # note: the 2 actual command-line arguments
                            # go in myscript.sub's "arguments = " line

# write data_direc before all

# tar -cvf res.tar  *.csv
# tar -xvf res.tar -C res/
