#!/bin/bash

PROCESS="/home/jim/vooltdb/vooltdb-server-0"
LOG="/home/jim/memlog.txt"

sleep 2

#删除上次的监控文件
if [ -f "$LOG" ];then 
    rm "$LOG"
fi

#过滤出需要的进程ID
PID=`ps -ef| grep $PROCESS | grep -v 'grep' | awk '{print $2;}'`
echo "PID is $PID"

echo "start output log"
while [ "$PID" != "" ]    
do
    echo $(date +%T) >> $LOG
    cat /proc/$PID/status | grep RSS >> $LOG
    sleep 1
    
done
