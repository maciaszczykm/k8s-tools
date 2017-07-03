# Delete cluster.
sudo kubeadm reset

# Init cluster.
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# Setup kubectl.
sudo cp /etc/kubernetes/admin.conf /home/maciaszczykm/.kube/config
sudo chown -R maciaszczykm /home/maciaszczykm

# Taint master node for development usage.
kubectl taint nodes --all node-role.kubernetes.io/master-

# Deploy flannel.
export ARCH=amd64
curl -sSL "https://github.com/coreos/flannel/blob/master/Documentation/kube-flannel.yml?raw=true" | sed "s/amd64/${ARCH}/g" | kubectl create -f -
