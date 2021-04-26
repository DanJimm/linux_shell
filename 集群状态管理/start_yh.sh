#!/bin/bash
if [ $# -eq 0 ]; then
		echo "----------------------------"
        echo "program must submit 1 argument"
        echo "usage: start_yh.sh name"
        echo "----------------------------"
        exit 1
fi

function v122()
{
dir=/home/perf/9.0vooltDB
ssh 192.168.1.122 $dir/tomcat/bin/startup.sh
sleep 3
ssh 192.168.1.123 $dir/tomcat/bin/startup.sh
sleep 3
#ssh 192.168.1.125 $dir/tomcat/bin/startup.sh

}

keyWord=$1

for f in v122
do 
	#if [ $f = $keyWord ]; then
	#	$f
	#fi
	$1
done 

