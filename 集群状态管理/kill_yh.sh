#!/bin/bash
if [ $# -eq 0 ]; then
	echo "----------------------------"
	echo "program must submit 1 argument"
	echo "usage: kill_yh.sh name"
	echo "----------------------------"
	exit 1
fi

function killcommand()
{
#keyWord=''
#host=''
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
}


function v122()
{
keyWord="/home/perf/9.0vooltDB"
for host in  192.168.1.122 192.168.1.123 
do
        killcommand
done
sleep 5


} 



main()
{
vooltDB=$1
for f in v122
do 
	if [[ $f = $vooltDB ]]; then
		$f
	fi
done

}
main $1

