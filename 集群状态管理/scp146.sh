#!/bin/bash

function rmjar()
{
	#dir=/home/test/trunk/9.0vooltDB/Yonghong/product
	echo "we will remove $host $dir"	
	sleep 1
	ssh -t $host 'cd /home/test/trunk/9.0vooltDB/Yonghong/product ; pwd ; ls ;rm *'
	#ssh -t 192.168.1.144 'cd /home/jim/test ; pwd ; ls ;rm *'	
	sleep 1
	echo "Now $host is done"
	
}

function scpjar()
{
	echo 'now scp product.jar'
	sleep 1
	scp /home/perf/9.0vooltDB/Yonghong/product/* root@192.168.1.146:/home/test/trunk/9.0vooltDB/Yonghong/product
}



host='192.168.1.146'
dir='/home/test/trunk/9.0vooltDB/Yonghong/product'
echo $dir
for host in 192.168.1.146
do
	rmjar
	sleep 1
	scpjar
done
	

