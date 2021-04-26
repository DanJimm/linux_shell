#!/bin/bash


function restart()
{
old_proc=`ssh $host ps -ef | grep '9.0v' |grep -v grep |awk '{print $2}'`
echo "$host old_proc is $old_proc"
ssh $host /home/perf/9.0vooltDB/tomcat/bin/shutdown.sh
sleep 3 

num=`ssh $host ps -ef | grep '9.0v' | grep -v grep | wc -l`
while [ $num -gt 0 ]
do
	num=`ssh $host ps -ef | grep '9.0v' | grep -v grep | wc -l`
	echo "the proc_num is $num"
	if [ $num -eq 0 ]; then
		break
	fi
	sleep 2
done

ssh $host /home/perf/9.0vooltDB/tomcat/bin/startup.sh
sleep 2
new_proc=`ssh $host ps -ef | grep '9.0v' |grep -v grep |awk '{print $2}'`
echo "$host new_proc is $new_proc"
sleep 1
}



for host in 192.168.1.123 192.168.1.122
do
restart
done

