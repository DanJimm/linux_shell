#!/bin/bash

num=$(ps -ef |grep java|grep -v 9.0v|grep -v grep|grep -v zookeeper|grep -v scheduler| wc -l)
if [ $num -ge 1 ]; then
		echo "You will kill $num process on $host1 . ." 
		ps -ef |grep java|grep -v 9.0v|grep -v grep|grep -v zookeeper|grep -v scheduler|awk {'print $2'}|xargs kill -9
		sleep 2
		echo "kill the process done"
else
		echo 'The has no process to kill'
fi
