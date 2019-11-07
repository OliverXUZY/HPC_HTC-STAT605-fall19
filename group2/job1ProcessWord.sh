#!/bin/bash

tr ' ' '\n'  < all.$1 | tr '\t' '\n' | sort > sortedWord.$1

# ./processWord.sh  < all.$1 | sort > sortedWord.$1
