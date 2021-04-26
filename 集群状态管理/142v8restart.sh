#!/bin/bash

processold=$(ps -ef | grep /home/perf/vooltdbv8|grep -v grep|awk '{print $2}')
echo "The process is $processold"

ps -ef | grep /home/perf/vooltdbv8|grep -v grep |awk '{print $2}'|xargs kill -9 
sleep 2

process=$(ps -ef | grep /home/perf/vooltdbv8|grep -v grep|awk '{print $2}')

if [ "$process" = "" ] ;then

 echo "the process is killed"

fi

sh /home/perf/vooltdbv8/tomcat/bin/startup.sh
sleep 5

processnew=$(ps -ef | grep /home/perf/vooltdbv8|grep -v grep|awk '{print $2}')
echo $processnew

if [ "$processnew" = "" ]; then
 echo "start failed"
else 
 echo "Process $processnew started"
fi
