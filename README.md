## Setup

```bash
talhelper genconfig
talosctl kubeconfig -n 192.168.0.200 -e 192.168.0.200
talosctl bootstrap

helm repo add cilium https://helm.cilium.io/
helm install cilium cilium/cilium \
    --version 1.17.5 \
    --namespace \
    --set ipam.mode=kubernetes \
    --set kubeProxyReplacement=true \
    --set securityContext.capabilities.ciliumAgent="{CHOWN,KILL,NET_ADMIN,NET_RAW,IPC_LOCK,SYS_ADMIN,SYS_RESOURCE,DAC_OVERRIDE,FOWNER,SETGID,SETUID}" \
    --set securityContext.capabilities.cleanCiliumState="{NET_ADMIN,SYS_ADMIN,SYS_RESOURCE}" \
    --set cgroup.autoMount.enabled=false \
    --set cgroup.hostRoot=/sys/fs/cgroup \
    --set k8sServiceHost=localhost \
    --set k8sServicePort=7445 \
    --set=bpf.masquerade=true \
    --set=l2announcements.enabled=true \
    --set=l2announcements.leaseDuration="300s" \
    --set=l2announcements.leaseRenewDeadline="60s" \
    --set=l2announcements.leaseRetryPeriod="10s" \
    --set=k8sClientRateLimit.qps="50" \
    --set=k8sClientRateLimit.burst="100" \
    --set=externalIPs.enabled=true \
    --set=ingressController.enabled=true \
    --set=ingressController.loadbalancerMode=dedicated \
    --set=gatewayAPI.enabled=true \
    --set=operator.replicas="1"

helm install argocd oci://ghcr.io/argoproj/argo-helm/argo-cd -n argocd --create-namespace

kubectl apply -f ./apps/apps.yaml
```
