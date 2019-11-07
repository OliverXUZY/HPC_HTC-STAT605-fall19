#!/bin/bash

# wget www.stat.wisc.edu/~jgillett/605/CHTC/wordCounting/shakespeare.tar 

# tar xvf shakespeare.tar

for file in $(ls -d */*); do
    cat $file >> all
done

# split all into 5 text # partial data files
nProcessors=5
data="all"
nDataLines=$(wc -l < $data)
nLinesPerSplitFile=$(($nDataLines / $nProcessors))
remainder=$(($nDataLines % $nProcessors))
if [[ $remainder > 0 ]]; then
  nLinesPerSplitFile=$(($nLinesPerSplitFile + 1))
fi
split -d -l $nLinesPerSplitFile $data "$data."

