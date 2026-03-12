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
  imports = [
    ./k9s.nix
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
        azure-cli
        chart-testing
        docker-compose
        eksctl
        etcd
        gnumake
        helm-docs
        krew
        kubectl
        kubectl-ktop
        kubectl-tree
        kubectl-view-secret
        kubelogin-oidc
        kubernetes-helm
        kubeseal
        kubie
        kustomize
        ocm
        openshift
        openssl
        opentofu
        powershell
        stern
        terraform
        tfsec
        trivy
        vcluster
      ];
    })

    (lib.mkIf cfgNetwork.enable {
      home.packages = with pkgs; [
        curl
        dig
        dnsutils
        hoppscotch
        mtr
        nmap
        nslookup
        tcpdump
        traceroute
        wget
        whois
        wireshark
      ];
    })
  ];
}
