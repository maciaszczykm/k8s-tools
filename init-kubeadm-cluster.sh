# Script initializing single node kubeadm cluster.
# Tested on Ubuntu.
# Requires kubeadm.

# Delete cluster.
sudo kubeadm reset

# Init cluster.
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# Update kubectl to newest version.
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Setup kubectl.
sudo cp /etc/kubernetes/admin.conf ${HOME}/.kube/config
sudo chown -R ${USER} ${HOME}

# Taint master for development usage.
kubectl taint nodes --all node-role.kubernetes.io/master-

# Deploy Flannel.
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel-rbac.yml

# Deploy Dashboard.
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/kubernetes-dashboard.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/kubernetes-dashboard-head.yaml

# Deploy other resources for testing.
# TODO
