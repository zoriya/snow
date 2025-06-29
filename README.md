## Setup

```bash
talhelper genconfig
talosctl kubeconfig -n 192.168.0.200 -e 192.168.0.200
talosctl bootstrap

helm install argocd oci://ghcr.io/argoproj/argo-helm/argo-cd -n argocd --create-namespace
kubectl apply -f ./apps/apps.yaml
```
