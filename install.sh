#/bin/bash

for i in $(find . -maxdepth 1 -not -name README -and -not -name install.sh -type f)
do
    CMD="ln -s $i ~/.$(basename $i)"
    echo $CMD
    $CMD
done
