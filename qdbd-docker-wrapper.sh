#!/usr/bin/env sh

QDB_SERVER=`which qdbd`
IP=`which ip`
AWK=`which awk`
PORT=2836

IP=`${IP} route get 8.8.8.8 | ${AWK} 'NR==1 {print $NF}'`


# Detects the presence of a license file, and provides it as an
# argument to `qdbd` if found.
POTENTIAL_LICENSE_FILE="/var/lib/qdb/license.txt"
LICENSE_FILE_PARAMETER=""

if [ -f ${POTENTIAL_LICENSE_FILE} ]; then
    echo "license file found! ${POTENTIAL_LICENSE_FILE}"
    LICENSE_FILE_PARAMETER="--license-file ${POTENTIAL_LICENSE_FILE}"
fi

${QDB_SERVER} ${LICENSE_FILE_PARAMETER} -a ${IP}:${PORT} $@
