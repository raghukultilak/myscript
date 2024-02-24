#!/bin/bash

# Variables
DOCKER_IMAGE="your_docker_image_name:latest"
REMOTE_SERVER="user@remote_server_address"
REMOTE_DIR="/path/to/remote/directory"
SSH_KEY="/path/to/your/ssh/key"

# Build the Docker image
docker build -t $DOCKER_IMAGE .

# Push the Docker image to a container registry (e.g., Docker Hub, AWS ECR, Google Container Registry)
docker push $DOCKER_IMAGE

# SSH into the remote server and pull the latest Docker image
ssh -i $SSH_KEY $REMOTE_SERVER "docker pull $DOCKER_IMAGE"

# Stop and remove the existing Docker container
ssh -i $SSH_KEY $REMOTE_SERVER "docker stop your_container_name && docker rm your_container_name"

# Run the Docker container with the new image
ssh -i $SSH_KEY $REMOTE_SERVER "docker run -d --name your_container_name -p 80:80 $DOCKER_IMAGE"
