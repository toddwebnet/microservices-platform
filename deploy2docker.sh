#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $(echo $DIR)/adminer/devops && ./deploy.sh && cd $(echo $DIR)
cd $(echo $DIR)/cdn/devops && ./deploy-conf.sh && cd $(echo $DIR)
cd $(echo $DIR)/auth-server/devops && ./deploy-conf.sh && cd $(echo $DIR)
