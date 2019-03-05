#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ln -s $(echo $DIR)/docker-compose.override.yml $(echo $DIR)/../docker/docker-compose.override.yml
