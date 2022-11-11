{ config, pkgs, theme, ... }:

{
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            add_newline = true;
            scan_timeout = 30;
            command_timeout = 500;
            line_break = {
                disabled = false;
            };
            character = {
                success_symbol = "[⨟](bold green) ";
                error_symbol = "[⦂](bold red) ";
            };
            package = {
                disabled = true;
            };
            directory = {
                truncation_length = 5;
                truncate_to_repo = false;
                fish_style_pwd_dir_length = 2;
                format = "[ \$path ](\$style)[\$read_only](\$read_only_style)";
                repo_root_format = "[ \$before_root_path](\$style)[\$repo_root](\$repo_root_style)[\$path ](\$style)[\$read_only](\$read_only_style)";
                style = "fg:${theme.base05} bg:${theme.base00}";
                read_only_style = "fg:${theme.base07} bg:${theme.base00}";
                repo_root_style = "bold fg:${theme.base06} bg:${theme.base00}";
            };
            hostname = {
                ssh_only = false;
                format = "[mö](\$style) in ";
                trim_at = "-";
                style = "bold dimmed purple";
                disabled = false;
            };
            cmd_duration = {
                format = "took [\$duration](\$style) ";
                style = "bold yellow";
                disabled = false;
            };
            time = {
                disabled = true;
                format = "[\[ \$time \]](\$style) ";
                time_format = "%T";
                utc_time_offset = "+2";
                time_range = "00:00:00-24:00:00";
            };
            git_branch = {
                disabled = false;
                symbol = "療";
                style = "fg:${theme.base04} bg:${theme.base09}";
                format = "[[ ](fg:${theme.base09} bg:${theme.base00})$symbol$branch[ ](bg:${theme.base00} fg:${theme.base09})]($style)";
            };
            git_commit = {
                style = "fg:${theme.base07} bg:${theme.base09}";
                commit_hash_length = 4;
                format = "[[ ](fg:${theme.base09} bg:${theme.base00})#$hash[ ](fg:${theme.base09} bg:${theme.base00})]($style)";
            };
            git_state = {
                style = "fg:${theme.base05} bg:${theme.base09}";
                rebase = "rebasing";
                merge = "merging";
                revert = "reverting";
                cherry_pick = " picking";
                bisect = "bisecting";
                am = "am'ing";
                am_or_rebase = "am/rebase";
                format = "\([[ ](fg:${theme.base09} bg:${theme.base00})$state($progress_current/$progress_total)[ ](fg:${theme.base09} bg:${theme.base00})]($style)\)";
            };
            git_status = {
                style = "fg:${theme.base05} bg:${theme.base09}";
                stashed = " ⊎ \${count}";
                ahead = " ⇈ \${count}";
                behind = " ⇊ \${count}";
                diverged = "  \${ahead_count} \${behind_count}";
                conflicted = " ✘ \${count}";
                deleted = " ␡ \${count}";
                renamed = "  \${count} ";
                modified = "  \${count}";
                staged = " ✔ \${count}";
                untracked = "  \${count}";
                format = "([[ ](fg:${theme.base09} bg:${theme.base00})$stashed$staged$modified$renamed$untracked$deleted$conflicted$ahead_behind[ ](fg:${theme.base09} bg:${theme.base00})]($style))";
            };
            nix_shell = {
                symbol = "";
                style = "bold blue";
                format = "[ $symbol  $name ]($style)";
            };
        };
    };
}
