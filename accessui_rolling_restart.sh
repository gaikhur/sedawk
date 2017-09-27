#!/bin/bash
LOGFILE="/tmp/accessui-$$.log"
ADDRTO="app_team@k12.com"
SUBJECT="**ACCESSUI has been bounced in a rolling fashion**"


DATE=`date +%F-%H:%M`


./runremote.sh " a-tc53 a-tc54 a-tc55 eqa-tc52 " '/data/servers/tc-accessui/bin/shutdown.sh; sleep 2; pgrep -f tc-accessui | xargs kill -9; sleep 2; rm -rf /data/servers/tc-accessui/work/* '  >> ${LOGFILE}
./runremote.sh " a-tc53 a-tc54 a-tc55 eqa-tc52 " "mv /var/log/tc-accessui/catalina.out /var/log/tc-accessui/catalina.out.$DATE"  >> ${LOGFILE} 
./runremote.sh " a-tc53 a-tc54 a-tc55 eqa-tc52 " '/data/servers/tc-accessui/bin/startup.sh; sleep 5; tail -10 /data/servers/tc-accessui/logs/catalina.out' >> ${LOGFILE}


./runremote.sh "a-tc56 a-tc57 a-tc58 a-tc59 a-tc60 a-tc61 " '/data/servers/tc-accessui/bin/shutdown.sh; sleep 2; pgrep -f tc-accessui | xargs kill -9; sleep 2; rm -rf /data/servers/tc-accessui/work/* '  >> ${LOGFILE}
./runremote.sh "a-tc56 a-tc57 a-tc58 a-tc59 a-tc60 a-tc61 " "mv /var/log/tc-accessui/catalina.out /var/log/tc-accessui/catalina.out.$DATE"  >> ${LOGFILE} 
./runremote.sh "a-tc56 a-tc57 a-tc58 a-tc59 a-tc60 a-tc61 " '/data/servers/tc-accessui/bin/startup.sh; sleep 5; tail -10 /data/servers/tc-accessui/logs/catalina.out' >> ${LOGFILE}


./runremote.sh "a-tc62 a-tc63 a-tc64 a-tc65 a-tc66 a-tc67 a-tc68 eqa-tc51" '/data/servers/tc-accessui/bin/shutdown.sh; sleep 2; pgrep -f tc-accessui | xargs kill -9; sleep 2; rm -rf /data/servers/tc-accessui/work/* '  >> ${LOGFILE}
./runremote.sh "a-tc62 a-tc63 a-tc64 a-tc65 a-tc66 a-tc67 a-tc68 eqa-tc51" "mv /var/log/tc-accessui/catalina.out /var/log/tc-accessui/catalina.out.$DATE"  >> ${LOGFILE} 
./runremote.sh "a-tc62 a-tc63 a-tc64 a-tc65 a-tc66 a-tc67 a-tc68 eqa-tc51" '/data/servers/tc-accessui/bin/startup.sh; sleep 5; tail -10 /data/servers/tc-accessui/logs/catalina.out' >> ${LOGFILE}


echo "ACCESSUI rolling restart complete"  >> ${LOGFILE}
echo ''  >> ${LOGFILE}

cat ${LOGFILE} | mail -s "${SUBJECT}" ${ADDRTO}

