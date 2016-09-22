#!/bin/bash

base=".../linux-4.5.2/"
csvFile=".../undertaker/pilztaker/linux-4.5.2.csv"

files="`cd $base && find . -name *.c`"

count=`echo $files | wc -w`
echo "Running for $count files" >&2
done=1

echo "filename;line start;line end;type;indentation;starting if;condition;normalized condition" > $csvFile
for file in $files
do
    echo -n "$done / $count " >&2
    done=$(($done+1))
    ./pilztaker $base $file >> $csvFile
done

