#!/bin/bash 


for x in $(cat hostslist ); 
do 
        sed -i -e 's/tc36//'  $x ; 
	sed -i -e 's/ tc37//' $x ; 
done 



