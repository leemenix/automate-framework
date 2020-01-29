#!/bin/bash

# include 
#CURRENT_DIR=$(pwd)

source ./.build_counter
source ./include/.current_build_number-$COMPONENT_NAME
#source ./.global_vars


# main
tar zcvf $COMPONENT_NAME-$BUILD_NUMBER.tar.gz $COMPONENT_NAME
ssh $DEPLOY_USR@$MGMT_SRV \
    "mkdir -p /home/$DEPLOY_USR/build/$COMPONENT_NAME"

scp $COMPONENT_NAME-$BUILD_NUMBER.tar.gz deploy@$MGMT_SRV:/home/$DEPLOY_USR/build/$COMPONENT_NAME
ssh $DEPLOY_USR@$MGMT_SRV \
    "mkdir -p /home/$DEPLOY_USR/build/$COMPONENT_NAME/$BUILD_NUMBER/"
ssh $DEPLOY_USR@$MGMT_SRV \
    "tar xvf /home/$DEPLOY_USR/build/$COMPONENT_NAME/$COMPONENT_NAME-$BUILD_NUMBER.tar.gz \
    -C /home/$DEPLOY_USR/build/$COMPONENT_NAME/$BUILD_NUMBER/"

# cleanup
ssh $DEPLOY_USR@$MGMT_SRV \
    "rm -rf /home/$DEPLOY_USR/build/$COMPONENT_NAME/$COMPONENT_NAME-$BUILD_NUMBER.tar.gz"
rm -rf $1-$BUILD_NUMBER.tar.gz

exit 0