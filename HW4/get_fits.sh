#!/bin/bash

if [ ! -d fit ]; then
  mkdir fit
fi
rm -r fit
mkdir fit 

if [ ! -d download ]; then                                                                                                                                                                      mkdir download
fi
rm -r download
mkdir download

cd fit

cat /home/zxu444/chtcR/HW4/hw4best100.csv | cut -d, -f2 | tail -n +2 | head | 
 while read line; do
 folder=$(echo $line | cut -d'-' -f2) 
 fit=$(echo $line | tr -d \")
 tar zxvf /home/groups/STAT605/boss/tgz/$folder.tgz  $folder/$fit 2>/dev/null
 # echo $folder
 # echo $fit
done

# mv 3*/* fit
find -type f -print0 | xargs -0 mv -t /home/zxu444/chtcR/HW4/download
cd ..
tar cvf download.tgz download

# rm -r 3*
