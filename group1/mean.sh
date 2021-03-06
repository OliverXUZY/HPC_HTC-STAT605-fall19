#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "usage: $0 must contain these <column> arguments" 1>&2
    exit 0
fi

[ $# -eq 2 -a -f "$2" ] && file="$2" || file=/dev/stdin

# file=/dev/stdin


col=$1; # file=$2
# file=${2:-/dev/stdin}



( cut -d"," -f$col < $file | tail -n+2 ) | awk '{sum+=$1}END{print sum/NR}'


# alternative method  appendix:
cat num |
    {
	sum=0
	while read n ; do
	    sum=$(($sum+$n))
	done

	echo $sum
    }

## for loop
count=0
sum=0

# loop
for i in $data; do
    sum=$(echo "scale=1; $sum + $i" | bc)
    count=$(($count+1))
done

# calculate mean
mean=$(echo "scale=1; $sum/$count" | bc)

#while read line; do
#    {sum += line; n++}
#   # echo $line
#done  # <  $file  #  inte   cut -d "," -f$col < $file | tail -n+2

#echo $sum
