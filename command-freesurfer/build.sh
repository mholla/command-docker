#!/usr/bin/env bash

DIR=$(dirname "$0");

LICENSE_FILE=$DIR'/license.txt';
echo -n "Enter license.txt file location [$LICENSE_FILE]: ";
read INPUT;
LICENSE_FILE=${INPUT:-$LICENSE_FILE};
if [ ! -f $LICENSE_FILE ]; then
    echo "File not found: $LICENSE_FILE";
    exit 1;
fi;

USER=$(whoami);
echo -n "Enter username [$USER]: ";
read INPUT;
USER=${INPUT:-$USER};

# Script arguments are passed to the docker build command; e.g., --no-cache
echo "Building Docker image..." \
    && docker build --no-cache \
    --build-arg LICENSE_FILE=$LICENSE_FILE \
    --build-arg USER=$USER \
    --tag=command-freesurfer $@ $DIR \
    && echo "Docker image successfully built!" \
    && echo "You can now run a container with, for example: "\
    && echo "	docker run -it --rm command-freesurfer";
