#!/bin/bash

function scpjar()
{
	echo "we will scp $host $dir"	
	sleep 1
	cd $dir
	scp *.jar root@$host:/$dir
	sleep 1
	echo "Now $host is done"
	
}

dir=/home/perf/9.0vooltDB/Yonghong/product

sh /home/perf/9.0vooltDB/Yonghong/product/scp.sh

for host in 192.168.1.123 
do
	scpjar
done	
