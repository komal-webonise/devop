#!/bin/bash 
set -x
touch test.log
MaxFileSize=2048
while true
do
     sh test.sh >> test.log
#Get size in bytes** 
    file_size=`du -b test.log | tr -s '\t' ' ' | cut -d' ' -f1`
    if [ $file_size -gt $MaxFileSize ];then   
        timestamp=`date +%s`
        mv test.log test.log.$timestamp
        touch test.log
    fi

done
