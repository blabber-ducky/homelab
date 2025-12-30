#!/bin/bash

if [[ $1 ]]
then
    if [[ "$1" = "all" ]]
    then
        export services=$(cat current_svc);
    else
        export services=$1;
    fi
else
    echo -e "\e[31mNeed any of these arguments: all <service name>\e[0m"
fi

echo -e "\e[32mFollowing services are running:\e[0m"
echo $services

for service in $services;
do
        echo -e "\e[32mWorking on $service .....\e[0m"

        if [[ "$service" = "samba" ]];
        then
                cd ~/homelab/samba &&
                docker compose up -d;
        elif [[ "$service" = "immich" ]];
        then
                cd ~/immich-app &&
                docker compose up -d;
        elif [[ "$service" = "copyparty" ]];
        then
                cd ~/homelab/copyparty &&
                docker compose up -d;
        elif [[ "$service" = "karakeep" ]];
        then
                cd ~/homelab/karakeep &&
                docker compose up -d;
        elif [[ "$service" = "jellyfin" ]];
        then
                cd ~/homelab/jellyfin &&
                docker compose up -d;
        elif [[ "$service" = "arr" ]];
        then
                cd ~/homelab/arr &&
                docker compose up -d;
        else
                echo -e "\e[31mDid not find $service in configuration\e[0m";
        fi

done;

echo -e "\e[32mFinished restarting the following services:\e[0m"
echo $services
