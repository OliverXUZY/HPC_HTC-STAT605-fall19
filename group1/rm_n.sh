#!/bin/bash

dir=$1; size=$2

if [[ $# -ne 2 ]]; then
    echo "usage: $0 must contain these <dir> and <n> two arguments" 1>&2
    exit 0
fi

find $dir -type f -size +${size}c -delete

# find five -type f  -size +5c
