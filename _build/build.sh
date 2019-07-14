mkdir ./_build/tmp/basic -p
mkdir ./_build/tmp/full -p
echo "Building hosts with redirecting to 127.0.0.1 . . ."
find ./_data/basic -type f -name "*.txt" | xargs cat > ./_build/tmp/basic/1.txt
sed -e '/^#/d' ./_build/tmp/basic/1.txt > ./_build/tmp/basic/2.txt
sed -i 's|0.0.0.0 ||g' ./_build/tmp/basic/2.txt
sort ./_build/tmp/basic/2.txt -u > ./domains/basic
find ./_data -type f -name "*.txt" | xargs cat > ./_build/tmp/full/1.txt
sed -e '/^#/d' ./_build/tmp/full/1.txt > ./_build/tmp/full/2.txt
sed -i 's|0.0.0.0 ||g' ./_build/tmp/full/2.txt
sort ./_build/tmp/full/2.txt -u > ./domains/full
echo "Cleaning tmp . . ."
rm -rf ./_build/tmp
