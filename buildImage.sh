#!/bin/bash
clear
ARCH=$(uname -m)
DOCKER_VERSION=$(docker version --format '{{.Server.Version}}')
DOCKERFILE=./Dockerfile
DOCKER_TAG="jenkins_docker"

if ! test -f $DOCKERFILE; # Check if Dockerfile exist
then
    echo "The Dockefile not found" 1>&2
    exit 1
fi

if [ $# -eq 1 ]; then # Check if was missing parameter
    echo "A parameter was missing" 1>&2
    exit 1
elif [ $# -gt 2 ]; then # Check if were passed more than parameter necessary
    echo -e "ERROR\t 2 parameters were expected, $# were passed \n" 1>&2
    exit 1

elif [ $# -eq 2 ]; then #Validate if parameter tag is correct
    case $1 in
        -t) DOCKER_TAG=$2;;

        *) echo "Option $1 not recognized";;
    esac

fi

docker build --build-arg ARCH=$ARCH --build-arg DOCKER_VERSION=$DOCKER_VERSION -t $DOCKER_TAG .
exit