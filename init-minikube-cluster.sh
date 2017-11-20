#!/bin/bash

source setup-logger.sh

MINIKUBE_K8S_VERSION=v1.8.0

log::info "Cleaning after previous cluster"
minikube stop

source download-kubectl.sh

log::info "Initializing cluster ${MINIKUBE_K8S_VERSION}"
minikube start --kubernetes-version=${MINIKUBE_K8S_VERSION}

source deploy-resources.sh

log::info "Cluster is ready"
