#########################################################################################
## Dockerfile for grails container with openjdk8 ########################################
#########################################################################################

FROM ubuntu:16.04
MAINTAINER Francesc Sola <zeliard4@gmail.com>

RUN apt-get update

RUN apt-get -y install curl unzip git vim zip software-properties-common

RUN add-apt-repository ppa:openjdk-r/ppa

RUN apt-get update

RUN apt-get -y install openjdk-8-jdk
RUN update-alternatives --config java

RUN curl -s get.sdkman.io | bash
RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh; sdk install grails 3.3.10"

WORKDIR /var/productApp/
