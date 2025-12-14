#!/bin/bash

cd /home/home_admin/immich-app &&
docker compose down &&
docker compose pull &&
docker compose up -d &&

cd /home/home_admin/homelab/samba &&
docker compose down &&
docker compose pull &&
docker compose up -d &&

docker image prune -f
