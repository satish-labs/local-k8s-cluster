#!/bin/bash

# install vcluster CLI
brew install vcluster
vcluster upgrade

# add helm loft repo
helm repo add loft-sh https://charts.loft.sh
helm repo update

# Install vcluster
helm upgrade vcluster loft-sh/vcluster \
  --namespace vcluster \
  --create-namespace \
  --install \
  --values vcluster/values.yaml

# Connect to vcluster and use kubectl commands to install applications
vcluster connect vcluster -n vcluster >/tmp/vcluster.session.log 2>&1 &

# run one liner command
vcluster connect vcluster -n vcluster -- kubectl get ns
