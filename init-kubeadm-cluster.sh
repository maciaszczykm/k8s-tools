#!/bin/bash

echo "Cleaning after previous cluster"
sudo kubeadm reset

echo "Initializing cluster"
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

source download-kubectl.sh

echo "Setting up kubectl"
sudo cp /etc/kubernetes/admin.conf ${HOME}/.kube/config
sudo chown -R ${USER} ${HOME}

echo "Tainting master node for development usage"
kubectl taint nodes --all node-role.kubernetes.io/master-

echo "Deploying flannel"
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel-rbac.yml

source deploy-resources.sh

echo "Cluster is ready"
