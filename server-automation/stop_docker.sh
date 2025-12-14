#!/bin/bash

cd /home/home_admin/immich-app &&
docker compose down &&

cd /home/home_admin/homelab/samba &&
docker compose down
