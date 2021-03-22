#!/bin/bash

DOCKER_HUB_USER=$1

buildAndPush() {

    IMAGE_REPO="$DOCKER_HUB_USER/$1"
    if [ "$1" = "weatherservice" ]; then
        pack build $IMAGE_REPO --path ./$1 --builder gcr.io/buildpacks/builder:v1
        docker push $IMAGE_REPO
    elif [ "$1" = "toposervice" ]; then
        mvn compile jib:build -Dimage=$IMAGE_REPO -f ./$1/pom.xml
    else
        docker build -t $IMAGE_REPO ./$1 
        docker push $IMAGE_REPO
    fi
}

# Por cada servicio construimos y publicamos en dockerhub
for folder in */; do
    echo "Building ${folder%%/}"
    buildAndPush ${folder%%/}
done

