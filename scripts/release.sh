#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Utility script that stitches the tags and release script togetherr
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
${SCRIPTDIR}/build-and-push.sh $(${SCRIPTDIR}/detect-tags.sh)
