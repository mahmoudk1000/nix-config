{
  config,
  theme,
  lib,
  font,
  ...
}:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  imports = [ ./poww.nix ];

  programs = {
    poww = {
      enable = lib.mkIf (!config.xsession.windowManager.awesome.enable) true;
    };
    rofi = {
      enable = true;
      font = "${font.nameTerm} 9";
      terminal = "st";
      extraConfig = {
        "location" = 5;
        "modi" = "drun,run";
        "display-drun" = "";
        "display-run" = "";
        "drun-display-format" = "{name}";
        "show-icons" = false;
      };
      theme = {
        "*" = {
          bg = mkLiteral theme.base00;
          fg = mkLiteral theme.base05;
          al = mkLiteral theme.base01;
          background-color = mkLiteral "@bg";
          text-color = mkLiteral "@fg";
        };
        window = {
          border = mkLiteral "0px";
          height = mkLiteral "40px";
          width = mkLiteral "100%";
          padding = mkLiteral "0px";
        };
        mainbox = {
          children = map mkLiteral [ "inputbar" ];
          background-color = mkLiteral "@bg";
          margin = mkLiteral "0px 20px 0px 20px";
        };
        prompt = {
          text-color = mkLiteral "@fg";
          enabled = mkLiteral "true";
          padding = mkLiteral "13px 13px 13px 0px";
        };
        inputbar = {
          children = map mkLiteral [
            "prompt"
            "textbox-prompt-divider"
            "entry"
            "listview"
          ];
          spacing = mkLiteral "0";
        };
        listview = {
          background-color = mkLiteral "@bg";
          lines = mkLiteral "100";
          cycle = mkLiteral "true";
          layout = mkLiteral "horizontal";
          horizontal-align = mkLiteral "0.5";
        };
        entry = {
          background-color = mkLiteral "@bg";
          padding = mkLiteral "13px 10px 13px 10px";
          text-color = mkLiteral "@fg";
          placeholder-color = mkLiteral "@fg";
          placeholder = mkLiteral ''"Search..."'';
          horizontal-align = mkLiteral "0";
          expand = mkLiteral "false";
          width = mkLiteral "17.5%";
          cursor = mkLiteral "text";
        };
        element = {
          text-color = mkLiteral "@fg";
          padding = mkLiteral "10px 10px 8px 10px";
          expand = mkLiteral "false";
          cursor = mkLiteral "pointer";
          margin = mkLiteral "3px";
          border-radius = mkLiteral "4px";
        };
        "element.selected" = {
          text-color = mkLiteral "@fg";
          background-color = mkLiteral "@al";
        };
        element-text = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "pointer";
        };
        "element-text selected" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "pointer";
          highlight = mkLiteral "none";
        };
        textbox-prompt-divider = {
          expand = mkLiteral "false";
          str = mkLiteral ''"::"'';
          text-color = mkLiteral "@fg";
          padding = mkLiteral "13px 0px 13px 0px";
        };
      };
    };
  };
}
