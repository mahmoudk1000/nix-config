{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "Mahmoud Ayman";
        userEmail = "mahmoudk1000@gmail.com";
        extraConfig = {
            init = {
                defaultBranch = "main";
            };
        };
        signing = {
            signByDefault = true;
            key = "A23D3563FD90EA8F";
        };
    };

    home.packages = with pkgs; [
        git-crypt
        lazygit
    ];
}
