{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-Space";
    baseIndex = 1;
    escapeTime = 5;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
    keyMode = "vi";
    historyLimit = 10000;
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      yank
      fingers
      better-mouse-mode
    ];
    extraConfig = ''
      bind q kill-pane
      bind s set status
      bind-key C-t send-prefix

      bind r source-file ~/.config/tmux/tmux.conf

      set -g renumber-windows on
      set-option -g focus-events on
      set-option -ga terminal-overrides ',screen-256color:Tc'

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

      bind-key r command-prompt "rename-window %%"
      bind-key s choose-session
      bind-key c new-window -c "#{pane_current_path}"

      bind-key ] swap-window -t +1
      bind-key [ swap-window -t -1

      # Copy/Paste
      bind-key c copy-mode
      unbind p
      bind p paste-buffer
      bind P choose-buffer

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"
      bind-key -T copy-mode-vi r send-keys -X rectangle-toggle

      # Statusline Hide/Unhide
      bind -n M-down set -q status off
      bind -n M-up set -q status on

      # Appearance
      set -g pane-border-style fg=white,bg=default
      set -g pane-active-border-style fg=white,bg=default

      set-option -g status-justify absolute-centre
      set-option -g status-position bottom

      set -g message-style bg=black,fg=yellow
      set -g status-style bg=black

      setw -g window-status-format          "#[fg=white,bg=brightblack] #I #[fg=white,bg=black] #W "
      setw -g window-status-current-format  "#[fg=black,bg=blue] #I #[fg=white,bg=brightblack] #W "

      # Status Right
      set -g status-right-length 70
      set -g status-right "#[fg=white,bg=magenta] %b %d %Y #[fg=white,bg=blue] %R "

      # Status Left
      set -g status-left-length 0
      set -g status-left ""
    '';
  };
}
