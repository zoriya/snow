{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    kubectl
    talosctl
    talhelper
    age
    argocd
    cmctl
    kubectl-cnpg
    kubernetes-helm
    kubectl-cnpg
  ];

  TALOSCONFIG = "./clusterconfig/talosconfig";
}
