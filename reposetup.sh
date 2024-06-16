#!/bin/bash

# AWS account ID and region
AWS_ACCOUNT_ID=328863170107
AWS_REGION=us-east-1

# ECR repository name
REPO_NAME=supermario

# Docker image name and tag
IMAGE_NAME=nirmalnaveen/supermario
IMAGE_TAG=latest

# Authenticate to AWS ECR
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# Create a new ECR repository
aws ecr create-repository --repository-name $REPO_NAME --region $AWS_REGION

# Pull the Docker image
docker pull $IMAGE_NAME

# Tag the Docker image with the ECR repository URL
docker tag $IMAGE_NAME $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG

# Push the tagged image to ECR
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG