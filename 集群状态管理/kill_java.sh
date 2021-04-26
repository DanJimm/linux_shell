#!/bin/bash

function killcommand()
{
	num=$(ssh $host ps -ef |grep java|grep -v 9.0v|grep -v grep|grep -v zookeeper|grep -v scheduler| wc -l)
	if [ $num -ge 1 ]; then
		echo "You will kill $num process on $host..." 
		ssh $host ps -ef |grep java|grep -v 9.0v|grep -v grep|grep -v zookeeper|grep -v scheduler|awk {'print $2'}|xargs ssh $host kill -9
		sleep 2
		echo "kill the process done on $host"
	else
		echo "The $host has no process to kill"
	fi
}


function kill_java()
{
for host in  192.168.1.123 192.168.1.125 192.168.1.122
do
	killcommand
done
sleep 3

} 



main()
{
	kill_java
}
main

