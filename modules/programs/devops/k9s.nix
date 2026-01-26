{ theme, ... }:

{
  programs.k9s = {
    enable = true;
    aliases = {
      pp = "v1/pods";
      sv = "v1/services";
      dp = "deployments";
      sec = "v1/secrets";
      jo = "jobs";
      cr = "clusterroles";
      crb = "clusterrolebindings";
      ro = "roles";
      rb = "rolebindings";
      np = "networkpolicies";
    };
    skins = {
      default = {
        k9s = {
          body = {
            fgColor = "${theme.base05}";
            bgColor = "${theme.base00}";
            logoColor = "${theme.base0D}";
          };
          prompt = {
            fgColor = "${theme.base05}";
            bgColor = "${theme.base00}";
            suggestColor = "${theme.base03}";
          };
          help = {
            fgColor = "${theme.base05}";
            bgColor = "${theme.base01}";
            keyColor = "${theme.base0D}";
            numKeyColor = "${theme.base03}";
            sectionColor = "${theme.base0B}";
          };
          dialog = {
            fgColor = "${theme.base05}";
            bgColor = "${theme.base01}";
            buttonFgColor = "${theme.base06}";
            buttonBgColor = "${theme.base02}";
            buttonFocusFgColor = "${theme.base07}";
            buttonFocusBgColor = "${theme.base03}";
            labelFgColor = "${theme.base07}";
            fieldFgColor = "${theme.base0D}";
          };
          info = {
            fgColor = "${theme.base05}";
            sectionColor = "${theme.base0D}";
          };
          frame = {
            border = {
              fgColor = "${theme.base02}";
              focusColor = "${theme.base03}";
            };
            menu = {
              fgColor = "${theme.base06}";
              keyColor = "${theme.base0D}";
              numKeyColor = "${theme.base08}";
            };
            crumbs = {
              fgColor = "${theme.base05}";
              bgColor = "${theme.base00}";
              activeColor = "${theme.base02}";
            };
            status = {
              newColor = "${theme.base0B}";
              modifyColor = "${theme.base09}";
              addColor = "${theme.base0C}";
              errorColor = "${theme.base08}";
              highlightcolor = "${theme.base03}";
              killColor = "${theme.base08}";
              completedColor = "${theme.base02}";
            };
            title = {
              fgColor = "${theme.base0D}";
              bgColor = "${theme.base00}";
              highlightColor = "${theme.base05}";
              counterColor = "${theme.base0F}";
              filterColor = "${theme.base0A}";
            };
          };
          views = {
            table = {
              fgColor = "${theme.base05}";
              bgColor = "${theme.base00}";
              cursorColor = "${theme.base02}";
              header = {
                fgColor = "${theme.base0D}";
                bgColor = "${theme.base00}";
                sorterColor = "${theme.base08}";
              };
            };
            yaml = {
              keyColor = "${theme.base05}";
              colonColor = "${theme.base0A}";
              valueColor = "${theme.base0B}";
            };
            logs = {
              fgColor = "${theme.base07}";
              bgColor = "${theme.base00}";
            };
          };
        };
      };
    };
    settings = {
      k9s = {
        liveViewAutoRefresh = true;
        refreshRate = 2;
        maxConnRetry = 5;
        enableMouse = false;
        enableImageScan = false;
        ui = {
          skin = "default";
          headless = false;
          logoless = true;
          crumbsless = false;
          reactive = false;
          noIcons = false;
        };
        view = {
          allNamespaces = true;
          favNamespaces = [
            "kube-system"
          ];
        };
        readOnly = false;
      };
    };
    views = {
      "v1/pods" = {
        columns = [
          "NAMESPACE"
          "NAME"
          "IP"
          "NODE"
          "STATUS"
          "READY"
          "AGE"
        ];
      };
      "v1/services" = {
        columns = [
          "NAMESPACE"
          "NAME"
          "CLUSTER-IP"
          "EXTERNAL-IP"
          "PORT(S)"
          "SELECTOR"
          "AGE"
        ];
      };
    };
  };
}
