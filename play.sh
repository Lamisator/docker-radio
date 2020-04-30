#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if (($(docker-compose -f ${DIR}/docker-compose.yml ps | grep -o "Up" | wc -l) < 2)) ; then
    echo "Starting containers ..."
    docker-compose -f ${DIR}/docker-compose.yml up -d
fi

docker-compose -f ${DIR}/docker-compose.yml exec mpd bash -c "mpc ls | mpc add && mpc play"
