#!/bin/bash

function rmjar()
{
	dir=/home/perf/9.0vooltDB/Yonghong/product
	echo "we will remove $host $dir"	
	sleep 1
	ssh -t $host 'cd /home/perf/9.0vooltDB/Yonghong/product ; pwd ; ls ;rm *'
	#ssh -t 192.168.1.144 'cd /home/jim/test ; pwd ; ls ;rm *'	
	sleep 1
	echo "Now $host is done"
	
}


for host in 192.168.1.122 192.168.1.123 192.168.1.125
do
	rmjar
done	

