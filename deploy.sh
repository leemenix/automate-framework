#!/bin/bash

# include 
#CURRENT_DIR=$(pwd)
source ./.global_vars
source ./include/.current_build_number-$COMPONENT_NAME
#source ./.build_counter

# vars
#MGMT_SRV=192.168.0.42
#DEPLOY_USR=deploy

# main
ssh $DEPLOY_USR@$MGMT_SRV \
    "sudo apt install -y python3 python3-pip sudo"

ssh $DEPLOY_USR@$MGMT_SRV \
    "sudo pip3 install ansible"

ssh $DEPLOY_USR@$MGMT_SRV \
    "if [[ -f /home/$DEPLOY_USR/build/$COMPONENT_NAME/$BUILD_NUMBER/$COMPONENT_NAME/main.yml ]]; then
    	ansible-playbook \
        /home/$DEPLOY_USR/build/$COMPONENT_NAME/$BUILD_NUMBER/$COMPONENT_NAME/main.yml 
     elif [[ -f /home/$DEPLOY_USR/build/$COMPONENT_NAME/$BUILD_NUMBER/$COMPONENT_NAME/Dockerfile ]]; then
     	cd /home/$DEPLOY_USR/build/$COMPONENT_NAME/$BUILD_NUMBER/$COMPONENT_NAME/; \
     	docker build .
     else
     	echo "neither ansible or docker"
     fi"

exit 0
