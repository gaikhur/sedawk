#!/bin/bash 
for i in $(/bin/ls /var/log/|grep tc);

do 
    if [ "x$(/bin/ps wwax|grep java 
           |grep $i|sed -e 's/\/data.*\/servers//g'
            |awk 'BEGIN { FS = "/" }
    	{ print $1, $2}'
     	|awk '{print $5 | "sort"}'
     	|sed -e 's/\(.*\)/  \1/g')" = "x" ]; 
     then 
	ls -l  /var/log/$i;
     fi; 
done
