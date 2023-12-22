{ config, pkgs, ... }:

{
    programs = {
        eza = {
            enable = true;
            enableAliases = true;
            git = true;
            icons = true;
            extraOptions = [ "--group-directories-first" ];
        };
        bat = {
            enable = true;
            config = {
                theme = "base16";
            };
            extraPackages = with pkgs.bat-extras; [
                batdiff
                batman
                batgrep
                batwatch
                batpipe
            ];
        };
    };
}
