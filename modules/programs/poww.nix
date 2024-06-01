{
  config,
  lib,
  theme,
  ...
}:

let
  cfg = config.programs.poww;
in
{
  options = {
    programs.poww = {
      enable = lib.mkOption {
        default = false;
        description = "Weather to enable rofi power menu";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/rofi/poww.rasi".text = ''
      configuration {
        font:   "Material Design Icons Desktop 18";
        disable-history:    false;
        sidebar-mode:   false;
        show-icons:    false;
      }
      @theme "/dev/null"
        * {
          bg:	    ${theme.base00};
          lg:	    ${theme.base02};
          fg:	    ${theme.base01};
          se:         ${theme.base06};
          background-color:   @bg;
          text-color:         @fg;
        }
      window {
        transparency:   "real";
        border-radius:  4px;
        location:   center;
        width:      400px;
      }
      listview {
        columns:	5;
        lines:	1;
        spacing:    12px;
        cycle:      true;
        dynamic:    true;
        layout:     vertical;
      }
      mainbox {
        children:	[ listview ];
        spacing:	20px;
        margin:	20px;
      }
      element {
        background-color:   @lg;
        border-radius:      4px;
      }
      element-text {
        background-color:   inherit;
        text-color:       	inherit;
        expand:             true;
        horizontal-align:   0.5;
        vertical-align:     0.5;
      margin:             15px 15px 15px 10px;
      }
      element selected {
        text-color: 	@bg;
        background-color:   @se;
        border-radius:      4px;
      }
    '';
  };
}
