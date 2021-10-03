#!/bin/bash

# This file is for run batch of rmd file in /hw3,
# so I do not need to open each one in rstudio and knit them

rm *.html # clear html already exists


for file in hw3/*\ *; do
    mv "$file" "${file// /_}"
done


cd hw3
for file in $(ls .); do
    #echo $file
    Rscript -e "rmarkdown::render('$file')"
done
cd ..

