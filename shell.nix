{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    kubectl
    talosctl
    talhelper
    age
    argocd
    cmctl
    kubectx
    kubernetes-helm
  ];

  TALOSCONFIG = "./clusterconfig/talosconfig";
}
