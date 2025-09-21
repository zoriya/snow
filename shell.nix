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
  ];

  TALOSCONFIG = "./clusterconfig/talosconfig";
}
