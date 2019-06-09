#!/usr/bin/env bash


APP_ROOTPATH=/var/productApp/
DOCKER_PATH=$INFRASTRUCTURE_ROOTPATH/docker
INFRASTRUCTURE_ROOTPATH=$GRAILS_PROJECT_ROOTPATH/infrastructure

GRAILS_PROJECT_ROOTPATH=$APP_ROOTPATH/grails-app
GRAILS_DOCKERPATH=$DOCKER_PATH/grails
GRAILS_IMAGE_NAME=grails
GRAILS_DOCKER_CONTAINER_NAME=grails

TOMCAT_DOCKER_PATH=$DOCKER_PATH/tomcat

APP_TARGET_WAR=$INFRASTRUCTURE_ROOTPATH/sources/war


################################################################################################################################################
## docker dependencies
################################################################################################################################################
app-dependencies(){
    echo -e "\e[32m\nInstalling dependencies ... \e[39m\n"
    apt-get -y purge docker lxc-docker docker-engine docker.io
    apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable"
    apt-get -y update
    apt-get -y install docker-ce
    echo -e "\n\e[32mInstalled dependencies!\e[39m\n"
}

################################################################################################################################################
## Build Grails container image for war builds
################################################################################################################################################
app-grails-build(){
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
app-grails-deploy(){
    app-grails-build
    app-grails-run
}

################################################################################################################################################
## Build Grails app war
################################################################################################################################################
app-grails-war-build(){
    cd $APP_ROOTPATH
    CLEAN_CMD="./gradlew clean"
    $CLEAN_CMD
    WAR_CMD="/root/.sdkman/candidates/grails/3.3.10/bin/grails prod war"
    echo -e "\e[32m\nRemoving grails war...\e[39m\n"
    rm -rf $APP_TARGET_WAR/*
    echo -e "\e[32m\nBuilding Grails app war...\e[39m\n"
    $WAR_CMD
    echo -e "\e[32m\nBuilt Grails app war.\e[39m\n"
}

################################################################################################################################################
## Execute grails app war build command in grails container
################################################################################################################################################
app-grails-war-deploy(){
    if ! docker exec -ti grails bash -c "source /var/productApp/grails-app/infrastructure/infrastructure.sh; app-grails-war-build"
        then
            echo -e "\e[91m\nGrails war build failed!\n"
            return
    fi
}

################################################################################################################################################
## Run grails container
################################################################################################################################################
app-grails-run(){
    echo -e "\e[32m\nStopping Grails container...\e[39m\n"
    docker rm -f $GRAILS_DOCKER_CONTAINER_NAME
    echo -e "\e[32m\nRunning Grails container...\e[39m\n"

    if ! docker run -td                             \
        -v $APP_TARGET_WAR:$APP_TARGET_WAR          \
        -v $APP_ROOTPATH:$APP_ROOTPATH              \
        --name $GRAILS_DOCKER_CONTAINER_NAME        \
        $GRAILS_IMAGE_NAME

    then
        echo -e "\e[91m\nGrails container launch failed!\n"
        return
    fi

    echo -e "\e[32m\nGrails container started successfully.\e[39m\n"
}



################################################################################################################################################
## Build tomcat image
################################################################################################################################################
app-tomcat-build(){

    return
}


echo -e "\e[32m\nLoaded Infrastructure!\e[39m\n"






