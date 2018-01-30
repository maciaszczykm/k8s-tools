#!/bin/bash

source setup-logger.sh

log::info "Cleaning after previous cluster"
sudo kubeadm reset

log::info "Initializing cluster"
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

source download-kubectl.sh

log::info "Setting up kubectl"
sudo cp /etc/kubernetes/admin.conf ${HOME}/.kube/config
sudo chown -R ${USER} ${HOME}

log::info "Tainting master node for development usage"
kubectl taint nodes --all node-role.kubernetes.io/master-

log::info "Deploying weave-net"
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

source deploy-resources.sh

log::info "Cluster is ready"
