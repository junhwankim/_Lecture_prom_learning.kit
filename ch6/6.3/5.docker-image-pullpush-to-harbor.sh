#!/usr/bin/env bash

docker login 192.168.57.63 --username admin --password admin
docker pull nginx
docker tag nginx 192.168.57.63/library/nginx
docker push 192.168.57.63/library/nginx
