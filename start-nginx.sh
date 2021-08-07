#!/bin/bash
#
# Brief description of your script
# Copyright 2021 mariusz
IMAGE_NAME=phpdebian01

docker run -d --rm --name devilbox-nginx-stable \
  -v $(pwd)/htdocs:/var/www/default/htdocs \
  -e PHP_FPM_ENABLE=1 \
  -e PHP_FPM_SERVER_ADDR=${IMAGE_NAME} \
  -p 8080:80 \
  --link ${IMAGE_NAME} \
  devilbox/nginx-stable




