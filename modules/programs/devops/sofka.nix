{ theme, ... }:

{
  programs.sofka = {
    enable = true;
    settings = {
      debug.image = "docker.io/nicolaka/netshoot:v0.13";
      default_resource = "pods";
      default_namespace = "kube-system";
      favorite_namespaces = [ "kube-system" ];
      readonly = false;
      mouse = false;
      hide_header = true;
      aliases = {
        dep = "deployments";
        sec = "v1/secrets";
        jo = "jobs";
        cr = "clusterroles";
        crb = "clusterrolebindings";
        ro = "roles";
        rb = "rolebindings";
        np = "networkpolicies";
      };
      logs = {
        tail = 1000;
        buffer = 5000;
        since = "-1s";
        wrap = false;
        show_time = false;
      };
      skin = {
        background = false;
        colors = {
          base = "#${theme.base00}";
          text = "#${theme.base07}";
          mantle = "#${theme.base01}";
          crust = "#${theme.base01}";
          surface0 = "#${theme.base01}";
          surface1 = "#${theme.base02}";
          surface2 = "#${theme.base03}";
          overlay0 = "#${theme.base02}";
          overlay1 = "#${theme.base04}";
          subtext0 = "#${theme.base05}";
          subtext1 = "#${theme.base04}";

          lavender = "#${theme.base0D}";
          red = "#${theme.base08}";
          maroon = "#${theme.base08}";
          peach = "#${theme.base09}";
          yellow = "#${theme.base0A}";
          green = "#${theme.base0B}";
          teal = "#${theme.base0D}";
          blue = "#${theme.base0D}";
          sapphire = "#${theme.base0D}";
          sky = "#${theme.base08}";
          mauve = "#${theme.base0D}";
          rosewater = "#${theme.base0A}";
          pink = "#${theme.base0F}";
          flamingo = "#${theme.base0F}";
        };
      };
      thresholds = {
        restarts = {
          warn = 3;
          critical = 10;
        };
        utilization = {
          warn = 75;
          critical = 90;
        };
      };
      views = {
        "v1/pods" = {
          replace = true;
          sort = "NAME:asc";
          columns = [
            {
              name = "NAME";
              builtin = "NAME";
            }
            {
              name = "READY";
              builtin = "READY";
            }
            {
              name = "STATUS";
              builtin = "STATUS";
            }
            {
              name = "RESTARTS";
              builtin = "RESTARTS";
            }
            {
              name = "CPU";
              metric = "cpu";
            }
            {
              name = "%CPU/R";
              metric = "cpu-request-utilization";
            }
            {
              name = "%CPU/L";
              metric = "cpu-limit-utilization";
              wide = true;
            }
            {
              name = "MEM";
              metric = "memory";
            }
            {
              name = "%MEM/R";
              metric = "memory-request-utilization";
            }
            {
              name = "%MEM/L";
              metric = "memory-limit-utilization";
              wide = true;
            }
            {
              name = "IP";
              path = "/status/podIP";
            }
            {
              name = "NODE";
              path = "/spec/nodeName";
            }
            {
              name = "IMAGE-TAG";
              path = "/spec/containers/0/image";
              format = "image-tag";
              wide = true;
            }
            {
              name = "AGE";
              builtin = "AGE";
            }
          ];
        };
        "v1/services" = {
          replace = true;
          sort = "NAME:asc";
          columns = [
            {
              name = "NAME";
              builtin = "NAME";
            }
            {
              name = "TYPE";
              path = "/spec/type";
            }
            {
              name = "CLUSTER-IP";
              path = "/spec/clusterIP";
            }
            {
              name = "EXTERNAL-IP";
              path = "/status/loadBalancer/ingress/0/ip";
              wide = true;
            }
            {
              name = "PORT";
              path = "/spec/ports/0/port";
              type = "number";
            }
            {
              name = "TARGET-PORT";
              path = "/spec/ports/0/targetPort";
              wide = true;
            }
            {
              name = "AGE";
              builtin = "AGE";
            }
          ];
        };
        "apps/v1/deployments" = {
          replace = true;
          sort = "NAME:asc";
          columns = [
            {
              name = "NAME";
              builtin = "NAME";
            }
            {
              name = "READY";
              builtin = "READY";
            }
            {
              name = "UP-TO-DATE";
              path = "/status/updatedReplicas";
              type = "number";
            }
            {
              name = "AVAILABLE";
              path = "/status/availableReplicas";
              type = "number";
            }
            {
              name = "IMAGE-TAG";
              path = "/spec/template/spec/containers/0/image";
              format = "image-tag";
            }
            {
              name = "PROGRESSING";
              path = "Progressing";
              type = "condition";
              wide = true;
            }
            {
              name = "AGE";
              builtin = "AGE";
            }
          ];
        };
        "v1/nodes" = {
          replace = true;
          sort = "NAME:asc";
          columns = [
            {
              name = "NAME";
              builtin = "NAME";
            }
            {
              name = "STATUS";
              builtin = "STATUS";
            }
            {
              name = "ROLES";
              builtin = "ROLES";
            }
            {
              name = "TAINTS";
              builtin = "TAINTS";
            }
            {
              name = "GPU";
              path = "/metadata/labels/nvidia.com~1gpu.present";
              wide = true;
            }
            {
              name = "PODS";
              metric = "node-pods";
            }
            {
              name = "%CPU";
              metric = "node-cpu-utilization";
            }
            {
              name = "%MEM";
              metric = "node-memory-utilization";
            }
            {
              name = "ZONE";
              path = "/metadata/labels/topology.kubernetes.io~1zone";
              wide = true;
            }
            {
              name = "INTERNAL-IP";
              path = "/status/addresses/0/address";
            }
            {
              name = "AGE";
              builtin = "AGE";
            }
          ];
        };
        "v1/persistentvolumeclaims" = {
          replace = true;
          sort = "NAME:asc";
          columns = [
            {
              name = "NAME";
              builtin = "NAME";
            }
            {
              name = "STATUS";
              path = "/status/phase";
            }
            {
              name = "VOLUME";
              path = "/spec/volumeName";
            }
            {
              name = "CAPACITY";
              path = "/status/capacity/storage";
            }
            {
              name = "STORAGECLASS";
              path = "/spec/storageClassName";
            }
            {
              name = "AGE";
              builtin = "AGE";
            }
          ];
        };
        "apiextensions.k8s.io/v1/customresourcedefinitions" = {
          sort = "GROUP:asc";
        };
      };
    };
  };
}
