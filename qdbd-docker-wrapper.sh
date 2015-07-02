#!/usr/bin/env sh

QDB_SERVER=`which qdbd`
IP=`which ip`
AWK=`which awk`
PORT=2836

IP=`${IP} route get 8.8.8.8 | ${AWK} 'NR==1 {print $NF}'`

${QDB_SERVER} -a ${IP}:${PORT} $@
