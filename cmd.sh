#!/bin/bash

cd /home/mapproxy

# renseigner le nombre de processus dans la configuration uWSGI
sed -i -e 's/{PROCESSES}/'"$PROCESSES"'/g' /home/mapproxy/uwsgi.yml

# créer une configuration MapProxy de test si aucune configuration n'est présente
[[ -d /home/mapproxy/conf ]] || mapproxy-util create -t base-config conf

# exécuter MapProxy
exec uwsgi --yaml /home/mapproxy/uwsgi.yml
