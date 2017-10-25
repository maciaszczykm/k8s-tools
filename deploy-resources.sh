#!/bin/bash

source setup-logger.sh

TEST_RESOURCES_DIR=./test-resources

log::info "Deploying Kubernetes Dashboard"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard-head.yaml

log::info "Deploying test resources from ${TEST_RESOURCES_DIR}"
kubectl apply -R -f ${TEST_RESOURCES_DIR}

log::info "Resources are deployed"
