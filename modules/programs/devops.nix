{
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
        opentofu
        ansible
        kubernetes-helm
        helm-docs
        kubectl
        krew
        kubectl-tree
        kubectl-ktop
        kubectl-view-secret
        kubectx
        stern
        docker-compose
        gnumake
        kustomize
        terraform
        chart-testing
        tfsec
        trivy
        azure-cli
        awscli2
        powershell
        mkcert
        eksctl
        openssl
        k9s
      ];
    })

    (lib.mkIf cfgNetwork.enable {
      home.packages = with pkgs; [
        nmap
        wireshark
        tcpdump
        mtr
        traceroute
        whois
        dig
        nslookup
        curl
        wget
        hoppscotch
      ];
    })
  ];
}
