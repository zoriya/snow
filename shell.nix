{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    kubectl
    talosctl
    talhelper
    age
  ];

  TALOSCONFIG = "./clusterconfig/talosconfig";
}
