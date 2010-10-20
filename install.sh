#/bin/bash -l

for i in $(find . -not -name README -and -not -name install.sh -maxdepth 1 -type f)
do
    CMD="ln -s $i ~/.$(basename $i)"
    echo $CMD
    $CMD
done
