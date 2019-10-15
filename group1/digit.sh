#!/bin/bash

echo "hello world"

# for file in $(ls); do echo "file=$file"; done

file="NetID.cxx"
pattern="(.*).cxx"
if [[ $file =~ $pattern ]] ; then
    echo ${BASH_REMATCH[1]} ${BASH_REMATCH[0]}
fi

pattern="[01]+"
# pattern=[01]

for i in {10..20} ;do
    if [[ $i =~ $pattern ]] ; then
	echo ${BASH_REMATCH[0]} #  ${BASH_REMATCH[0]}
    fi
#    echo $i
done

# echo 1{0,1}{0,1}{0,1}
