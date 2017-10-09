#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ -z "$1" ]
then
    echo "Usage: build-and-push.sh [tag & tags..]"
    exit 1
fi

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IMAGE="bureau14/qdb"

docker build -t ${IMAGE}:build ${SCRIPTDIR}/..

for TAG in "$@"
do
    docker tag ${IMAGE}:build ${IMAGE}:$TAG
    docker push ${IMAGE}:$TAG
done
