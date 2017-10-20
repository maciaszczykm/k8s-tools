#!/bin/bash

SCRIPT_K8S_VERSION=v1.8
REMOTE_SCRIPT=https://raw.githubusercontent.com/Mirantis/kubeadm-dind-cluster/master/fixed/dind-cluster-${SCRIPT_VERSION}.sh
echo "Using remote scipt from ${REMOTE_SCRIPT}"

echo "Cleaning after previous cluster"
curl -s ${REMOTE_SCRIPT} | bash /dev/stdin down
curl -s ${REMOTE_SCRIPT} | bash /dev/stdin clean

source download-kubectl.sh

echo "Initializing cluster"
curl -s ${REMOTE_SCRIPT} | bash /dev/stdin up

source deploy-resources.sh

echo "Cluster is ready"
