{ pkgs, theme, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-Space";
    baseIndex = 1;
    escapeTime = 20;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-256color";
    keyMode = "vi";
    historyLimit = 10000;
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      fingers
      better-mouse-mode
    ];
    extraConfig = ''
      bind q kill-pane
      bind s set status
      bind-key C-t send-prefix

      bind r source-file ~/.config/tmux/tmux.conf

      set-option -g focus-events on

      is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?\.?(view|n?vim?x?)(-wrapped)?(diff)?$'"

      # Pane Binds
      unbind-key E
      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' 'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' 'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' 'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' 'select-pane -R'

      bind -n 'M-h' if-shell "$is_vim" 'send-keys M-h' 'resize-pane -L 1'
      bind -n 'M-j' if-shell "$is_vim" 'send-keys M-j' 'resize-pane -D 1'
      bind -n 'M-k' if-shell "$is_vim" 'send-keys M-k' 'resize-pane -U 1'
      bind -n 'M-l' if-shell "$is_vim" 'send-keys M-l' 'resize-pane -R 1'

      # Copy Mode Binds
      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R

      # Window Binds
      bind -n M-C-j previous-window
      bind -n M-C-k next-window

      bind-key "{" split-window -h -c "#{pane_current_path}"
      bind-key "}" split-window -v -c "#{pane_current_path}"

      bind-key s choose-session
      bind-key c new-window -c "#{pane_current_path}"

      bind-key ] swap-window -t +1
      bind-key [ swap-window -t -1

      bind-key c copy-mode

      # Statusline Hide/Unhide
      bind -n M-down set -q status off
      bind -n M-up set -q status on

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-pipe "xclip -i -sel p -f | xclip -i -sel c "
      bind-key -T copy-mode-vi r send-keys -X rectangle-toggle
      bind P paste-buffer

      set-window-option -g allow-rename off

      set -g pane-border-style fg=${theme.base02}
      set -g pane-active-border-style fg=${theme.base0A}

      set-option -g status-justify absolute-centre
      set-option -g status-position bottom

      set -g window-status-format         "#[fg=cyan,bg=default]▒▓█#[fg=black,bg=cyan]#I #[bg=brightblack,fg=white] #W#[fg=brightblack,bg=default]█▓▒"
      set -g window-status-current-format "#[fg=blue,bg=default]▒▓█#[fg=black,bg=blue]#I #[bg=brightblack,fg=white] #W#[fg=brightblack,bg=default]█▓▒"

      set -g status-style "bg=${theme.base00}"
      set -ag status-style "fg=${theme.base01}"

      # Status Right
      set -g status-right-length 70
      set -g status-right "#[bg=default,fg=magenta]▒▓█#[fg=white,bg=brightblack] %a, %d %b #[fg=black,bg=brightblack]• #[fg=magenta,bg=brightblack,bold]%R#[fg=brightblack,bg=default]█▓▒"

      # Status Left
      set -g status-left-length 70
      set -g status-left "#[bg=default,fg=red]▒▓█#[fg=white,bg=brightblack] #(mpc current | sed 's/-/~/')#[fg=brightblack,bg=default]█▓▒"
    '';
  };
}
