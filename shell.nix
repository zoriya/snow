{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    kubectl
    talosctl
    talhelper
  ];

  TALOSCONFIG = "./clusterconfig/talosconfig";
}
