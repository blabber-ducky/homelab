#!/bin/bash

export services=$(docker ps --filter "label=com.docker.compose.project" -q | xargs docker inspect --format='{{index .Config.Labels "com.docker.compose.project"}}'| sort | uniq)

echo -e "\e[31mFollowing services are running:\e[0m"
echo $services

for service in $services;
do
        echo -e "\e[31mWorking on $service .....\e[0m"

        if [[ "$service" = "samba" ]];
        then
                cd ~/homelab/samba &&
                docker compose down &&
                docker compose pull &&
                docker compose up -d;
        elif [[ "$service" = "immich" ]];
        then
                cd ~/immich-app &&
                docker compose down &&
                docker compose pull &&
                docker compose up -d;
        else
                echo "Did not find $service in configuration";
        fi

done;

docker image prune -f

echo -e "\e[31mFinished updating the following services:\e[0m"
echo $services
