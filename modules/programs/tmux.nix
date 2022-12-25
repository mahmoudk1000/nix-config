{ config, pkgs, theme, ... }:

let
    date-bst = pkgs.writeScriptBin "date-bst" ''
        env TZ=Africa/Cairo date +"%H%M"
    '';
in
{
    programs.tmux = {
        enable = true;
        plugins = with pkgs; [
            tmuxPlugins.fingers
            tmuxPlugins.yank
            tmuxPlugins.vim-tmux-navigator
            tmuxPlugins.better-mouse-mode
        ];
        extraConfig = ''
            unbind-key C-b
            set -g prefix C-Space
            setw -g mode-keys vi
            bind q kill-pane
            bind s set status
            bind-key C-t send-prefix

            bind r source-file ~/.config/tmux/tmux.conf

            set-option -g default-terminal "xterm-256color"
            set -ag terminal-overrides ",xterm-256color:RGB"

            set escape-time 20
            set -q -g status-utf8 on
            setw -q -g utf8 on
            set -g mouse on
            set-option -g focus-events on

            set -g base-index 1
            setw -g pane-base-index 1

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

            set -g pane-border-style fg=${theme.base01}
            set -g pane-active-border-style fg=colour8

            set-option -g status-justify absolute-centre
            set-option -g status-position bottom

            set -g window-status-current-format " #[fg=${theme.base01}]#W#{?window_zoomed_flag, #[fg=${theme.base02}]+,}#{?window_activity_flag, #[fg=${theme.base03}]!,}"
            set -g window-status-format         " #[fg=${theme.base01}]#W#{?window_zoomed_flag, #[fg=${theme.base02]+,}"

            # status right
            set -g  status-style "bg=${theme.base00}"
            set -ag status-style "fg=${theme.base06}"

            set status-right-length 70
            set -g  status-right "#[fg=colour15]#(date +"%H%M") #[fg=${theme.base03}]IST  "
            set -ag status-right "#[fg=colour15]#(${date-bst}/bin/date-bst) #[fg=${theme.base03}]BST  "
            set -ag status-right "#[fg=colour15]#(date +"%d/%m")#[fg=${theme.base06}] #(date +"%Y")"

            # status left
            set status-left-length 70
            set -g status-left "#[fg=colour7]#(cat /sys/class/power_supply/BAT0/capacity)%  "
        '';
    };
}
