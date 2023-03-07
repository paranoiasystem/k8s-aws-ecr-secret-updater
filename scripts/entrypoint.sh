#!/bin/bash

create_secret() {
  kubectl create secret docker-registry regcred \
    --docker-server=${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com \
    --docker-username=AWS \
    --docker-password=$(aws ecr get-login-password --region ${AWS_REGION})
}

# Check if the secret exists
if kubectl get secret regcred; then
  # If it exists, delete it
  kubectl delete secret regcred
  # Create the secret again
  create_secret
else
  # If it doesn't exist, create it
  create_secret
fi