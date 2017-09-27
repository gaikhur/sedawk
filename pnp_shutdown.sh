#!/bin/bash
LOGFILE="/tmp/pnp-$$.log"
ADDRTO="app_team@k12.com"
SUBJECT="**PNP is down**"



./runremote.sh " a-tc53 a-tc54 a-tc55 a-tc56 a-tc57 a-tc58 a-tc59 a-tc60 a-tc61 a-tc62 a-tc63 a-tc64 a-tc65 a-tc66 a-tc67 a-tc68 eqa-tc51 eqa-tc52" '/data/servers/tc-pnp/bin/shutdown.sh; sleep 2; pgrep -f tc-pnp | xargs kill -9; sleep 2; rm -rf /data/servers/tc-pnp/work/*'  >> ${LOGFILE}

echo "PNP shutdown complete"  >> ${LOGFILE}
echo ''  >> ${LOGFILE}


cat ${LOGFILE} | mail -s "${SUBJECT}" ${ADDRTO}

