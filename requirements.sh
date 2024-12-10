#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Updating system packages..."
sudo apt-get update -y

echo "Installing Docker..."
sudo apt-get install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker

echo "Installing Kubernetes tools (kubectl, kubeadm)..."
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl kubeadm

echo "Installing Python and Ansible..."
sudo apt-get install -y python3 python3-pip
pip3 install ansible

echo "Setting up Docker for non-root user..."
sudo groupadd docker || true
sudo usermod -aG docker $USER

echo "Preparing environment is complete. Please log out and log back in to apply changes."
