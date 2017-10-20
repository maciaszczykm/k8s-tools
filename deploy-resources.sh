#!/bin/bash

TEST_RESOURCES_DIR=./test-resources

echo "Deploying Kubernetes Dashboard"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard-head.yaml

echo "Deploying test resources from ${TEST_RESOURCES_DIR}"
kubectl apply -R -f ${TEST_RESOURCES_DIR}

echo "Resources are deployed"
