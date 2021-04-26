#!/bin/bash

date=`date +%Y%m%d`
echo $date

scp /home/jim/jacoco_$date* root@192.168.1.133:/home/software/jacoco/trunk/manual
sleep 5
ssh -t 192.168.1.123 'scp /home/jim/jacoco_`date +%Y%m%d`* root@192.168.1.133:/home/software/jacoco/trunk/manual'
sleep 5

