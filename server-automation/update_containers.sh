#!/bin/bash

if [[ $1 ]]
then
    export services=$1;
else
    export services=$(docker ps --filter "label=com.docker.compose.project" -q | xargs docker inspect --format='{{index .Config.Labels "com.docker.compose.project"}}'| sort | uniq)
fi

echo -e "\e[32mFollowing services are running:\e[0m"
echo $services

for service in $services;
do
        echo -e "\e[32mWorking on $service .....\e[0m"

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
        elif [[ "$service" = "copyparty" ]];
        then
                cd ~/homelab/copyparty &&
                docker compose down &&
                docker compose pull &&
                docker compose up -d;
        elif [[ "$service" = "karakeep" ]];
        then
                cd ~/homelab/karakeep &&
                docker compose down &&
                docker compose pull &&
                docker compose up -d;
        elif [[ "$service" = "jellyfin" ]];
        then
                cd ~/homelab/jellyfin &&
                docker compose down &&
                docker compose pull &&
                docker compose up -d;
        elif [[ "$service" = "arr" ]];
        then
                cd ~/homelab/arr &&
                docker compose down &&
                docker compose pull &&
                docker compose up -d;
        else
                echo -e "\e[31mDid not find $service in configuration\e[0m";
        fi

done;

docker image prune -f

echo -e "\e[32mFinished updating the following services:\e[0m"
echo $services
