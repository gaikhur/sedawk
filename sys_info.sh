#!/bin/bash 
# This script is called sys_info.sh and it was written by Asghar Ghori on December 11, 2014. 
# This script should be located in the /usr/local/bin directory. 
# The script was written to show basic RHEL and system information. 

echo "Display Basic System Information" 
echo "= = = = = = = = = = = = = = = = = = = = = = = = ="
echo 
echo "The hostname, hardware, and operating system information for this system is:"
/usr/bin/hostnamectl  
echo

