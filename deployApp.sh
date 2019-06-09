#!/usr/bin/env bash


#########################################################################################################
## script to build war and deploy it to tomcat container
#########################################################################################################
echo -e "\e[32m\nDEPLOYING PRODUCT APP...\e[39m\n"
cd grails-app/infrastructure
source infrastructure
app-grails-war-build
app-tomcat-build
app-tomcat-run
echo -e "\e[32m\nDEPLOYED!\e[39m\n"
