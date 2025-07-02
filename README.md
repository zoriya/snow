## Setup

```bash
talhelper genconfig
talosctl kubeconfig -n 192.168.0.200 -e 192.168.0.200
talosctl bootstrap

helm repo add cilium https://helm.cilium.io/
helm upgrade -i cilium cilium/cilium \
    --version 1.17.5 \
    --namespace kube-system \
    --values ./cilium-values.yaml

helm install argocd oci://ghcr.io/argoproj/argo-helm/argo-cd -n argocd --create-namespace

kubectl apply -f ./apps/apps.yaml
```
