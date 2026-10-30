{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:

let
  cfgDevops = config.programs.devops;
  cfgNetwork = config.programs.network;
in
{
  imports = [
    inputs.sofka.homeManagerModules.default
    ./k9s.nix
    ./sofka.nix
  ];

  options = {
    programs.devops = {
      enable = lib.mkOption {
        default = false;
        description = "Enable DevOps tools";
        type = lib.types.bool;
      };
    };
    programs.network = {
      enable = lib.mkOption {
        default = false;
        description = "Enable network tools";
        type = lib.types.bool;
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfgDevops.enable {
      home.packages = with pkgs; [
        # awscli2
        ansible
        # azure-cli
        chart-testing
        docker-compose
        gnumake
        helm-docs
        kubectl
        kubectl-images
        kubectl-ktop
        kubectl-tree
        kubectl-view-secret
        kubelogin-oidc
        kubernetes-helm
        kubeseal
        kubie
        kustomize
        ocm
        openssl
        opentofu
        stern
        terraform
        tfsec
        trivy
      ];
    })

    (lib.mkIf cfgNetwork.enable {
      home.packages = with pkgs; [
        curl
        mtr
        nmap
        tcpdump
        traceroute
        wget
        whois
        # wireshark
        dnsutils
      ];
    })
  ];
}
