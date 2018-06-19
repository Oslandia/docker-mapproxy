#!/bin/bash

cd /mapproxy

# renseigner le nombre de processus dans la configuration uWSGI
sed -i -e 's/{PROCESSES}/'"$PROCESSES"'/g' /mapproxy/uwsgi.yml

# créer une configuration MapProxy de test si aucune configuration n'est présente
[[ -d /mapproxy/conf ]] || mapproxy-util create -t base-config conf

# exécuter MapProxy
exec uwsgi --yaml /mapproxy/uwsgi.yml
