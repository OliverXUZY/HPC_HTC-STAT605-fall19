mkdir five
for i in {1..5}; do
    mkdir five/dir$i
    for j in {1..4}; do
	seq 1 $j > five/dir$i/file$j
    done
done
