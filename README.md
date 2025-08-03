## Setup

```bash
talhelper genconfig
talhelper gencommand apply --extra-flags --insecure | sh
talosctl bootstrap -n 192.168.0.200 -e 192.168.0.200
talosctl kubeconfig

helm repo add cilium https://helm.cilium.io/
helm upgrade -i cilium cilium/cilium \
    --version 1.17.5 \
    --namespace kube-system \
    --values ./cilium-values.yaml

helm install argocd oci://ghcr.io/argoproj/argo-helm/argo-cd -n argocd --create-namespace

kubectl apply -f ./apps/apps.yaml
kubectl create secret generic bitwarden-access-token -n external-secrets --from-literal token=$BW_ACCESS_TOKEN
```

## Notes

zfs pool creation:
```bash
k -n kube-system debug -it --profile sysadmin --image=ubuntu node/kadan
chroot /host zpool create -o ashift=12 -O mountpoint=legacy -O xattr=sa -O compression=zstd -O acltype=posixacl -O atime=off ocean raidz sdc sdd
```
