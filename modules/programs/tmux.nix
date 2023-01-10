{ config, pkgs, theme, ... }:

{
    programs.tmux = {
        enable = true;
        prefix = "C-Space";
        baseIndex = 1;
        escapeTime = 20;
        shell = "${pkgs.zsh}/bin/zsh";
        terminal = "rxvt-unicode-256color";
        keyMode = "vi";
        plugins = with pkgs; [
            tmuxPlugins.fingers
            tmuxPlugins.yank
            tmuxPlugins.better-mouse-mode
        ];
        extraConfig = ''
            set -ag terminal-overrides ",rxvt-unicode-256color:RGB"
            set -g -a terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'
            bind q kill-pane
            bind s set status
            bind-key C-t send-prefix

            bind r source-file ~/.config/tmux/tmux.conf

            set -g mouse on
            set-option -g focus-events on

            # pane binds
            unbind-key E
            bind-key -r C-k resize-pane -U 5
            bind-key -r C-j resize-pane -D 5
            bind-key -r C-h resize-pane -L 5
            bind-key -r C-l resize-pane -R 5
            bind-key k select-pane -U
            bind-key j select-pane -D
            bind-key h select-pane -L
            bind-key l select-pane -R

            # window binds
            bind -n M-j  previous-window
            bind -n M-k next-window
            bind-key "{" split-window -h -c "#{pane_current_path}"
            bind-key "}" split-window -v -c "#{pane_current_path}"
            bind-key s choose-session
            bind-key c new-window -c "#{pane_current_path}"
            bind-key ] swap-window -t +1
            bind-key [ swap-window -t -1
            bind-key c copy-mode
            bind-key -r "<" swap-window -d -t -1
            bind-key -r ">" swap-window -d -t +1

            # statusline hide / unhide
            bind -n M-down set -q status off
            bind -n M-up set -q status on

            bind-key -T copy-mode-vi v send-keys -X begin-selection
            bind-key -T copy-mode-vi y send-keys -X copy-pipe "xclip -i -sel p -f | xclip -i -sel c "
            bind-key -T copy-mode-vi r send-keys -X rectangle-toggle
            bind P paste-buffer

            set-window-option -g allow-rename off

            set -g pane-border-style fg=${theme.base02}
            set -g pane-active-border-style fg=${theme.base09}

            set-option -g status-justify absolute-centre
            set-option -g status-position bottom

            set -g window-status-format         "#[fg=cyan,bg=default]#[fg=black,bg=cyan]#I #[bg=brightblack,fg=white] #W#[fg=brightblack,bg=default]  "
            set -g window-status-current-format "#[fg=blue,bg=default]#[fg=black,bg=blue]#I #[bg=brightblack,fg=white] #W#[fg=brightblack,bg=default]  "

            set -g status-style "bg=${theme.base00}"
            set -ag status-style "fg=${theme.base01}"

            # status right
            set -g status-right-length 70
            set -g status-right "#[bg=default,fg=magenta]█#[fg=white,bg=brightblack] %a, %d %b #[fg=black,bg=brightblack]• #[fg=magenta,bg=brightblack]%R#[fg=brightblack,bg=default]"

            # status left
            set -g status-left-length 70
            set -g status-left "#[bg=default,fg=red]█#[fg=white,bg=brightblack] #(mpc current | sed 's/-/~/')#[fg=brightblack,bg=default]"
        '';
    };
}
