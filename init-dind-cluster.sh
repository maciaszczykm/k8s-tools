# Script initializing multi node dind cluster.
# Tested on macOS.

# Use remote script to delete cluster.
curl -s https://raw.githubusercontent.com/Mirantis/kubeadm-dind-cluster/master/fixed/dind-cluster-v1.7.sh | bash /dev/stdin down
curl -s https://raw.githubusercontent.com/Mirantis/kubeadm-dind-cluster/master/fixed/dind-cluster-v1.7.sh | bash /dev/stdin clean

# Update kubectl to newest version.
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/darwin/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Use remote script to init cluster.
curl -s https://raw.githubusercontent.com/Mirantis/kubeadm-dind-cluster/master/fixed/dind-cluster-v1.7.sh | bash /dev/stdin up

# Deploy Dashboard.
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard-head.yaml

# Deploy other resources for testing.
kubectl apply -R -f ./yamls
