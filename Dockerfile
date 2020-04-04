# This dockerfile build a Jenkis Alpine image to run Docker inside the container

FROM jenkins/jenkins:lts
#Installation as Root
USER root
WORKDIR /tmp

#  Getthe static binaries 
RUN wget https://download.docker.com/linux/static/stable/x86_64/docker-19.03.8.tgz

# Uncompress and remove download file
RUN tar -xzf docker-19.03.8.tgz && rm docker-19.03.8.tgz

# Copy binaries to bin folder
RUN mv docker/* /usr/bin/

# Add user jenkis to root group
RUN usermod -aG root jenkins

USER jenkins
