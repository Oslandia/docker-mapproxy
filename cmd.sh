#!/bin/bash


ARGS=""

# prepare uWSGI arguments
[[ -n ${PROCESSES} ]] && ARGS="$ARGS --processes ${PROCESSES}"
[[ -n ${UID} && ${UID} -ne 0 ]] && ARGS="$ARGS --uid ${UID}"
[[ -n ${GID} ]] && ARGS="$ARGS --gid ${GID}"

# create a MapProxy test configuration if none is provided
[[ -f /mapproxy/mapproxy.yaml ]] || mapproxy-util create -t base-config /mapproxy

# execute MapProxy
exec uwsgi --yaml /uwsgi.yml $ARGS
