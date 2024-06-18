#!/bin/bash

# Fetch the container ID of the Jenkins server
JENKINS_CONTAINER_ID=$(docker inspect --format '{{ .Id }}' jenkins-server)

# Export the environment variable to be used by envsubst
export JENKINS_CONTAINER_ID

# Use envsubst to substitute the placeholder in the docker-compose.yml file with the actual value
envsubst < docker-compose.yml > docker-compose.tmp.yml

# Replace the original docker-compose.yml with the substituted version
mv docker-compose.tmp.yml docker-compose.yml


# Run Docker Compose
docker-compose down && docker-compose up -d --build 
