{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.programs.devops;
in
{
  options = {
    programs.devops = {
      enable = lib.mkOption {
        default = false;
        description = "Enable DevOps tools";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      opentofu
      ansible
      kubernetes-helm
      helm-docs
      # kubernetes
      # minikube
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
      wireshark
      hoppscotch
      powershell
      mkcert
      eksctl
      openssl
      # docker-machine-kvm2
      # runc
    ];
  };
}
