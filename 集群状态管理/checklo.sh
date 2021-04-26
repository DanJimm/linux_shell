#!/bin/bash

host1='192.168.1.122' 
host2='192.168.1.123' 
host3='192.168.1.125' 
host4='192.168.1.146' 

path1='/home/perf/125vooltdb'
path2='/home/perf/125vooltdb1'
path3='/home/test/trunk/9.0vooltDB/Yonghong/log'

echo "check $host1 log"
ssh -t $host1 "cd /home/perf/125vooltdb ;grep -E -i 'click|Yandex' -r *" > /home/jim/log/$host1.txt
ssh -t $host1 "cd /home/perf/125vooltdb1 ;grep -E -i 'click|Yandex' -r *" >> /home/jim/log/$host1.txt
ssh -t $host1 "cd /home/perf/122123125vooltdb ;grep -E -i 'click|Yandex' -r *" >> /home/jim/log/$host1.txt

echo "check $host2 log"
ssh -t $host2 "cd /home/perf/125vooltdb ;grep -E -i 'click|Yandex' -r *" > /home/jim/log/$host2.txt
ssh -t $host2 "cd /home/perf/125vooltdb1 ;grep -E -i 'click|Yandex' -r *" >> /home/jim/log/$host2.txt
ssh -t $host2 "cd /home/perf/122123125vooltdb ;grep -E -i 'click|Yandex' -r *" >> /home/jim/log/$host2.txt


echo "check $host3 log"
ssh -t $host3 "cd /home/perf/125vooltdb ;grep -E -i 'click|Yandex' -r *" > /home/jim/log/$host3.txt
ssh -t $host3 "cd /home/perf/125vooltdb1 ;grep -E -i 'click|Yandex' -r *" >> /home/jim/log/$host3.txt

echo "check $host4 log"
ssh -t $host4 "cd /home/test/trunk/9.0vooltDB/Yonghong/log ;grep -E -i 'click|Yandex' -r *" > /home/jim/log/$host4.txt
