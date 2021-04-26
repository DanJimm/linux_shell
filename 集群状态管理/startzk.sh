#!/bin/bash

if [ $# -eq 0 ]; then
	echo "please enter the zk you want to star"
	echo "for example :zk122 zk125"
	exit 1
fi


function zk122()
{

dir=/home/perf/zookeeper/zookeeper-3.4.9/bin
ssh 192.168.1.122 $dir/zkServer.sh start
sleep 3
ssh 192.168.1.123 $dir/zkServer.sh start
sleep 3
ssh 192.168.1.125 $dir/zkServer.sh start

}

function zk125()
{
dir=/home/124125136zk/zookeeper-3.4.6/bin

ssh 192.168.1.124 $dir/zkServer.sh start
sleep 3
ssh 192.168.1.125 $dir/zkServer.sh start
sleep 3
ssh 192.168.1.136 $dir/zkServer.sh start

}


keyWord=$1

main()
{
#keyWord=$1
#echo "we will start $keyword"
for f in zk122 zk125
do  
	#echo $f
	if [ "$f" == "$keyWord" ]; then
		echo "we will start zk proc on $f"
		$f
        fi
done	
}
main


