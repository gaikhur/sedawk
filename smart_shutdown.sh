#!/bin/bash
LOGFILE="/tmp/tc-smart-svc-$$.log"
ADDRTO="app_team@k12.com"
SUBJECT="**TC-SMART-SVC is down**"



./runremote.sh "eqa-tc8 eqa-tc9" '/data/servers/tc-smart-svc/bin/shutdown.sh; sleep 2; pgrep -f tc-smart-svc | xargs kill -9; sleep 2; rm -rf /data/servers/tc-smart-svc/work/*'  >> ${LOGFILE}

echo "TC-SMART-SVC shutdown complete"  >> ${LOGFILE}
echo ''  >> ${LOGFILE}


cat ${LOGFILE} | mail -s "${SUBJECT}" ${ADDRTO}
