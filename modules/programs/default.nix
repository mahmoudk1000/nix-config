{
  host,
  ...
}:

{
  imports = [
    ./accounts
    ./awesome
    ./firefox
    ./ncmpcpp
    ./neovim
    ./vscode
    ./2bwm.nix
    ./alacritty.nix
    ./atuin.nix
    ./bash.nix
    ./bitwarden.nix
    ./bspwm.nix
    ./chromium.nix
    ./devops.nix
    ./fetch.nix
    ./git.nix
    ./gnu.nix
    ./herbstluftwm.nix
    ./mpv.nix
    ./newsboat.nix
    ./obsidian.nix
    ./rofi.nix
    ./spotify.nix
    ./starship.nix
    ./texlive.nix
    ./thunar.nix
    ./tmux.nix
    ./urxvt.nix
    ./vencord.nix
    ./wezterm.nix
    ./yt-dlp.nix
    ./zathura.nix
    ./zsh.nix
  ];

  programs = {
    obsidian = {
      enable = true;
      gitSync = true;
      vaultDir = "/home/${host.username}/Notes/obsidian";
    };
  };
}
