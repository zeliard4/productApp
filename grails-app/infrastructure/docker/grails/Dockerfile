#########################################################################################
## Dockerfile for grails container with opènjdk8 ########################################


FROM ubuntu:16.04
MAINTAINER Francesc Sola <zeliard4@gmail.com>


RUN apt-get update
RUN apt-get -y install curl unzip git vim zip

RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update
RUN apt-get install openjdk-8-jdk
RUN update-alternatives --config java

RUN curl -s get.sdkman.io | bash
RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh; sdk install grails 3.3.10"


#ENV PATH /root/.gvm/grails/current/bin:$PATH
#ENV JAVA_HOME /usr/java/jdk1.7.0_75/

WORKDIR /var/apps/productApp/infrastructure
