#!/bin/bash

K8S_VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
UNAME=$(uname)
KUBECTL_DOWNLOAD_LINK=https://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/${UNAME,,}/amd64/kubectl

echo "Downloading kubectl ${K8S_VERSION} for ${UNAME,,}"
curl -LO ${KUBECTL_DOWNLOAD_LINK}
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo "kubectl is ready to use"
