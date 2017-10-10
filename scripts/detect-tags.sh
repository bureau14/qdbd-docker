#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Either explicitly provide the file, or detect it from working dir
FILE=${1:-}

if [[ -z "${FILE}" ]]
then
    SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    readarray -t FILES <<<`ls ${SCRIPTDIR}/../qdb-*-linux-64bit-server.tar.gz`

    if [ "${#FILES[@]}" -ne "1" ]
    then
        echo "Can only detect tags from one file, found: "
        echo ${FILES[@]}
        exit 1
    fi

    FILE=${FILES[0]}
fi

if [[ ${FILE} =~ master ]]
then
    echo "nightly"
else
    echo "unable to probe version from file: ${FILE}"
    exit 1
fi
