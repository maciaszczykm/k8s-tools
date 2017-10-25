#!/bin/bash

source setup-logger.sh

SCRIPT_K8S_VERSION=v1.8
REMOTE_SCRIPT=https://raw.githubusercontent.com/Mirantis/kubeadm-dind-cluster/master/fixed/dind-cluster-${SCRIPT_VERSION}.sh
log::info "Using remote scipt from ${REMOTE_SCRIPT}"

log::info "Cleaning after previous cluster"
curl -s ${REMOTE_SCRIPT} | bash /dev/stdin down
curl -s ${REMOTE_SCRIPT} | bash /dev/stdin clean

source download-kubectl.sh

log::info "Initializing cluster"
curl -s ${REMOTE_SCRIPT} | bash /dev/stdin up

source deploy-resources.sh

log::info "Cluster is ready"
