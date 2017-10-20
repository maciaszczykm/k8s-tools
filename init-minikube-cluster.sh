#!/bin/bash

echo "Cleaning after previous cluster"
minikube stop

source download-kubectl.sh

echo "Initializing cluster"
minikube start

source deploy-resources.sh

echo "Cluster is ready"
