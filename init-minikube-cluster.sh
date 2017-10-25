#!/bin/bash

source setup-logger.sh

log::info "Cleaning after previous cluster"
minikube stop

source download-kubectl.sh

log::info "Initializing cluster"
minikube start

source deploy-resources.sh

log::info "Cluster is ready"
