#!/bin/bash 

<<comment1
 E_NOARGS=85
 if [ -z "$1" ]
 then
  echo "Usage: `basename $0` target-file"
  exit $E_NOARGS
 fi


sed -e /^$/d "$1"
comment1
echo " hello"



 
