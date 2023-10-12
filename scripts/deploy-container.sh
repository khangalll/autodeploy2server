#!/bin/bash

DOCKER_IMAGE="ghcr.io/$GHCR_USERNAME/flask-app:latest"
CONTAINER_NAME="flask-app"

echo "$GHCR_TOKEN" | docker login ghcr.io -u $GHCR_USERNAME --password-stdin
docker pull $DOCKER_IMAGE

if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping and removing existing container: $CONTAINER_NAME"
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

echo "Starting container: $CONTAINER_NAME"
docker run -d -p 80:8080 --name $CONTAINER_NAME $DOCKER_IMAGE
