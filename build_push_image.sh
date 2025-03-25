#!/bin/bash

# Variabel untuk repository Docker Hub (ganti dengan username Docker Hub Anda)
DOCKER_USERNAME="anggraitowas"
IMAGE_NAME="item-app"
IMAGE_TAG="v1"
FULL_IMAGE_NAME="$DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG"

# 1. Build Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME:$IMAGE_TAG .

# 2. Melihat daftar image di lokal
echo "Listing local images..."
docker images | grep $IMAGE_NAME

# 3. Menandai image agar sesuai dengan format Docker Hub
echo "Tagging image..."
docker tag $IMAGE_NAME:$IMAGE_TAG $FULL_IMAGE_NAME

# 4. Login ke Docker Hub
echo "Logging in to Docker Hub..."
docker login

# 5. Push image ke Docker Hub
echo "Pushing image to Docker Hub..."
docker push $FULL_IMAGE_NAME

echo "Image pushed successfully: $FULL_IMAGE_NAME"

