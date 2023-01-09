{ config, pkgs, theme, ... }:

{
    programs.tmux = {
        enable = true;
        prefix = "C-Space";
        baseIndex = 1;
        escapeTime = 20;
        shell = "${pkgs.zsh}/bin/zsh";
        terminal = "screen-256color";
        keyMode = "vi";
        plugins = with pkgs; [
            tmuxPlugins.fingers
            tmuxPlugins.yank
            tmuxPlugins.better-mouse-mode
        ];
        extraConfig = ''
            bind q kill-pane
            bind s set status
            bind-key C-t send-prefix

            bind r source-file ~/.config/tmux/tmux.conf

            set -g mouse on
            set-option -g focus-events on

            # pane binds
            unbind-key E
            bind-key h select-pane -L
            bind-key n select-pane -D
            bind-key e select-pane -U
            bind-key i select-pane -R
            bind-key -r H resize-pane -L 5
            bind-key -r N resize-pane -D 5
            bind-key -r E resize-pane -U 5
            bind-key -r I resize-pane -R 5

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

            # statusline hide / unhide
            bind -n M-down set -q status off
            bind -n M-up set -q status on

            bind-key -r "<" swap-window -d -t -1
            bind-key -r ">" swap-window -d -t +1

            bind-key -T copy-mode-vi v send-keys -X begin-selection
            bind-key -T copy-mode-vi y send-keys -X copy-pipe "xclip -i -sel p -f | xclip -i -sel c "
            bind-key -T copy-mode-vi r send-keys -X rectangle-toggle
            bind P paste-buffer

            set-window-option -g allow-rename off

            set -g pane-border-style fg=${theme.base02}
            set -g pane-active-border-style fg=${theme.base09}

            set-option -g status-justify absolute-centre
            set-option -g status-position bottom

            set -g window-status-format         "#[fg=${theme.base06}]#[fg=${theme.base00}]#[bg=${theme.base06}]#I #[bg=${theme.base09}]#[fg=${theme.base01}] #W#[fg=${theme.base09}]#[bg=${theme.base00}]  "
            set -g window-status-current-format "#[fg=${theme.base08}]#[fg=${theme.base00}]#[bg=${theme.base08}]#I #[bg=${theme.base09}]#[fg=${theme.base01}] #W#[fg=${theme.base09}]#[bg=${theme.base00}]  "

            set -g status-style "bg=${theme.base00}"
            set -ag status-style "fg=${theme.base01}"

            # status right
            set -g status-right-length 70
            set -g status-right "#[fg=${theme.base07}]█#[fg=${theme.base01}]#[bg=${theme.base09}] %a, %d %b #[fg=${theme.base03}]#[bg=${theme.base09}]•#[fg=${theme.base07}]#[bg=${theme.base09}] %R#[fg=${theme.base09}]#[bg=${theme.base00}]  "

            # status left
            set -g status-left-length 70
            set -g status-left "#[fg=${theme.base03}]█#[fg=${theme.base01}]#[bg=${theme.base09}] #(mpc current | sed 's/-/~/')#[fg=${theme.base09}]#[bg=${theme.base00}]  "
        '';
    };
}
