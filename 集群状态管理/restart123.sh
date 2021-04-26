#!/bin/bash
if [ $# -eq 0 ]; then
                echo "----------------------------"
        echo "program must submit 1 argument"
        echo "r is restart / k is kill"
        echo "----------------------------"
        exit 1
fi


keyWord="/home/perf/mpptovooltdb"


function killcommand()
{
for host in  192.168.1.123 192.168.1.124
do
	num=`ssh $host ps -ef | grep $keyWord | grep -v grep | wc -l`
        pro=`ssh $host ps -ef | grep $keyWord | grep -v grep`
        echo $pro
        if [ $num -ge 1 ]; then
                echo "You will kill $num process on $host..."
                ssh $host ps -ef|grep $keyWord|grep -v grep|awk '{print $2}'|xargs ssh $host kill -9
                echo "kill the process done on $host"
        else
                echo "No process found on $host"
        fi
done
}

function start()
{
for host in  192.168.1.123 192.168.1.124
do
	ssh $host $keyWord/tomcat/bin/startup.sh
	sleep 3
done
}

func=$1

if [ $func = "r" ];then
	killcommand
	sleep 3
	start

elif [ $func = "k" ];then
	killcommand
	sleep 1

else
	echo "input is error"
	echo "r is restart / k is kill"
fi
