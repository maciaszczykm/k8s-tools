#!/bin/bash

source setup-logger.sh

SCRIPT_K8S_VERSION=v1.8
REMOTE_SCRIPT=https://raw.githubusercontent.com/Mirantis/kubeadm-dind-cluster/master/fixed/dind-cluster-${SCRIPT_K8S_VERSION}.sh
LOCAL_SCRIPT=./dind-cluster-${SCRIPT_K8S_VERSION}.sh

log::info "Downloading remote scipt from ${REMOTE_SCRIPT}"
curl -LO ${REMOTE_SCRIPT} --progress-bar
chmod +x ${LOCAL_SCRIPT}

log::info "Cleaning after previous cluster"
${LOCAL_SCRIPT} down
${LOCAL_SCRIPT} clean

source download-kubectl.sh

log::info "Initializing cluster"
${LOCAL_SCRIPT} up

source deploy-resources.sh

log::info "Deleting local copy of startup script"
rm ${LOCAL_SCRIPT}

log::info "Cluster is ready"
