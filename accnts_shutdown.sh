#!/bin/bash
LOGFILE="/tmp/accnts-$$.log"
ADDRTO="app_team@k12.com"
SUBJECT="**ACCNTS is down**"



./runremote.sh " a-tc53 a-tc54 a-tc55 a-tc56 a-tc57 a-tc58 a-tc59 a-tc60 a-tc61 a-tc62 a-tc63 a-tc64 a-tc65 a-tc66 a-tc67 a-tc68 eqa-tc51 eqa-tc52 a-tc127 a-tc128 a-tc129 a-tc130 a-tc131 a-tc132 a-tc133 a-tc134 a-tc135 a-tc136 a-tc137 a-tc138 a-tc139 a-tc140 a-tc141" '/data/servers/tc-accnts/bin/shutdown.sh; sleep 2; pgrep -f tc-accnts | xargs kill -9; sleep 2; rm -rf /data/servers/tc-accnts/work/*'  >> ${LOGFILE}

echo "ACCNTS shutdown complete"  >> ${LOGFILE}
echo ''  >> ${LOGFILE}


cat ${LOGFILE} | mail -s "${SUBJECT}" ${ADDRTO}

