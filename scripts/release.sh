#!/usr/bin/env bash

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IMAGE="bureau14/qdb"

docker build -t ${IMAGE}:build ${SCRIPTDIR}/..

for TAG in "$@"
do
    docker tag ${IMAGE}:build ${IMAGE}:$TAG
    docker push ${IMAGE}:$TAG
done
