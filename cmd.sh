#!/bin/bash

cd /mapproxy

ARGS=""

# préparer les options à passer à uWSGI
[[ -n ${PROCESSES} ]] && ARGS="$ARGS --processes ${PROCESSES}"
[[ -n ${UID} && ${UID} -ne 0 ]] && ARGS="$ARGS --uid ${UID}"
[[ -n ${GID} ]] && ARGS="$ARGS --gid ${GID}"

# créer une configuration MapProxy de test si aucune configuration n'est présente
[[ -d /mapproxy/conf ]] || mapproxy-util create -t base-config conf

# exécuter MapProxy
exec uwsgi --yaml /mapproxy/uwsgi.yml $ARGS
