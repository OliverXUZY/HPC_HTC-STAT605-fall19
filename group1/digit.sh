#!/bin/bash

echo "hello world"

# for file in $(ls); do echo "file=$file"; done

file="NetID.cxx"
pattern="(.*).cxx"
if [[ $file =~ $pattern ]] ; then
    echo ${BASH_REMATCH[1]} ${BASH_REMATCH[0]}
fi

# pattern="[01]\{2\}"
pattern=[01]\{2\}


for i in {1000..2000} ;do
    if [[ $i =~ $pattern ]] ; then
       #  echo ${BASH_REMATCH[0]} #  ${BASH_REMATCH[0]}
        sum=$(($sum + $i))
    fi
done

echo $sum
# echo 1{0,1}{0,1}{0,1}
