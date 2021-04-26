#!/bin/bash

host='192.168.1.146'
keyword='/home/test/trunk/9.0vooltDB'

echo "we will kill $host vooltdb BI"
proc_old=$( ssh $host ps -ef |grep $keyword|grep -v grep|awk {'print $2'} )
echo "The process is $proc_old "

ssh $host ps -ef |grep $keyword|grep -v grep|awk {'print $2'}|xargs ssh $host kill -9
sleep 2


echo "we will start $host vooltdb"
ssh $host $keyword/tomcat/bin/startup.sh
sleep 5

proc=$( ssh $host ps -ef |grep $keyword|grep -v grep|awk {'print $2'} )
echo "The proc is $proc"
