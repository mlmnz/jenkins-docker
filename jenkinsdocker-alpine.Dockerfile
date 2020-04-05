# This dockerfile build a Jenkis image to run Docker inside the container

FROM jenkins/jenkins:lts-alpine

#Arguments from run script
ARG ARCH=x86_64
ARG DOCKER_VERSION=19.03.8

#Installation as Root
USER root
WORKDIR /tmp

#  Getthe static binaries 
RUN wget https://download.docker.com/linux/static/stable/${ARCH}/docker-${DOCKER_VERSION}.tgz

# Uncompress and remove download file
RUN tar -xzf docker-19.03.8.tgz && rm docker-19.03.8.tgz

# Copy binaries to bin folder
RUN mv docker/* /usr/bin/

# Add user jenkis to root group
RUN adduser jenkins root

USER jenkins
