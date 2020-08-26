for i in {1..9}; do
    echo http://pages.stat.wisc.edu/~shao/stat610/stat610-0$i.pdf >> urls.txt
done
for i in {10..39}; do
    echo http://pages.stat.wisc.edu/~shao/stat610/stat610-$i.pdf >> urls.txt
done


wget -i urls.txt
