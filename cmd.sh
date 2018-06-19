#!/bin/bash

cd /mapproxy

ARGS=""

# prepare uWSGI arguments
[[ -n ${PROCESSES} ]] && ARGS="$ARGS --processes ${PROCESSES}"
[[ -n ${UID} && ${UID} -ne 0 ]] && ARGS="$ARGS --uid ${UID}"
[[ -n ${GID} ]] && ARGS="$ARGS --gid ${GID}"

# create a MapProxy test configuration if none is provided
[[ -d /mapproxy/conf ]] || mapproxy-util create -t base-config conf

# execute MapProxy
exec uwsgi --yaml /mapproxy/uwsgi.yml $ARGS
