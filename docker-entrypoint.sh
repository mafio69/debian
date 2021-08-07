#!/bin/bash
#
# Brief description of your script
# Copyright 2021 mariusz

nginx -g "daemon off;"

"$@"
