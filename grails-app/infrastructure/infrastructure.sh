#!/usr/bin/env bash

INFRASTRUCTURE_ROOTPATH=/var/productApp/grails-app/infrastructure

DOCKER_PATH=$INFRASTRUCTURE_ROOTPATH/docker

GRAILS_DOCKERPATH=$DOCKER_PATH/grails
GRAILS_IMAGE_NAME=grails
GRAILS_DOCKER_CONTAINER_NAME=grails

################################################################################################################################################
## Build Grails container image for war builds
################################################################################################################################################
pi-backend-grails-build(){
    echo -e "\e[32m\nBuilding Grails image ... \e[39m\n"
    if ! docker build -t $GRAILS_IMAGE_NAME $GRAILS_DOCKERPATH
        then
            echo -e "\e[91m\nGrails image build failed!\n"
            return
    fi
    echo -e "\n\e[32mBuilt Grails image !\e[39m\n"
}




################################################################################################################################################
## Deploys Grails container
################################################################################################################################################
pi-backend-grails-deploy(){
    pi-backend-grails-build
    pi-backend-grails-run
}

################################################################################################################################################
## Build grails backend war
################################################################################################################################################
pi-backend-war-build(){
    WAR_CMD="/root/.sdkman/candidates/grails/2.3.11/bin/grails war -Dgrails.env=${ENVIRONMENT,,} -Dapplication.config.credentials=$BACKEND_CREDENTIALS $BACKEND_TARGET_WAR/ROOT.war"
    echo -e "\e[32m\nRemoving backend war...\e[39m\n"
    rm -rf $BACKEND_TARGET_WAR/*
    cd $PI_BACKEND_ROOTPATH
    echo -e "\e[32m\nBuilding backend Grails war...\e[39m\n"
    $WAR_CMD
    echo -e "\e[32m\nBuilt backend Grails war.\e[39m\n"
}


echo -e "\e[32m\nLoaded Infrastructure!\e[39m\n"
