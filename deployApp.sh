#!/usr/bin/env bash


#########################################################################################################
## script to build war and deploy it to tomcat container
#########################################################################################################
echo -e "\e[32m\nDEPLOYING PRODUCT APP...\e[39m\n"
rm -rf build/libs/*
source grails-app/infrastructure/infrastructure
app-grails-war-deploy
app-tomcat-build
app-tomcat-run
echo -e "\e[32m\nDEPLOYED!\e[39m\n"
