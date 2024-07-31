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
      # kubernetes
      # minikube
      kubectl
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
      powershell
      # docker-machine-kvm2
      # runc
    ];
  };
}
