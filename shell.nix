{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    kubectl
    talosctl
    talhelper
    age
    argocd
    kubernetes-helm
  ];

  TALOSCONFIG = "./clusterconfig/talosconfig";
}
