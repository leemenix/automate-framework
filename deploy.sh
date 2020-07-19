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
    "if ! command -v apt &> /dev/null 
     then
         sudo yum install -y python3 python3-pip sudo libselinux-python libselinux-python3 
     else
	 echo Checking system ...
     fi"

ssh $DEPLOY_USR@$MGMT_SRV \
    "if ! command -v yum &> /dev/null
     then
	 sudo apt install -y python3 python3-pip sudo
     else
	 echo Checking system ...
     fi"

ssh $DEPLOY_USR@$MGMT_SRV \
    "pip3 install --user ansible docker"

ssh $DEPLOY_USR@$MGMT_SRV \
    "if [[ -f /home/$DEPLOY_USR/build/$COMPONENT_NAME/$BUILD_NUMBER/$COMPONENT_NAME/main.yml ]]; then
    	ansible-playbook \
        /home/$DEPLOY_USR/build/$COMPONENT_NAME/$BUILD_NUMBER/$COMPONENT_NAME/main.yml 
     elif [[ -f /home/$DEPLOY_USR/build/$COMPONENT_NAME/$BUILD_NUMBER/$COMPONENT_NAME/Dockerfile ]]; then
     	cd /home/$DEPLOY_USR/build/$COMPONENT_NAME/$BUILD_NUMBER/$COMPONENT_NAME/; \
     	docker build . -t $COMPONENT_NAME:$BUILD_NUMBER
        docker build . -t $COMPONENT_NAME:latest
     else
     	echo "neither ansible or docker"
     fi"

exit 0
