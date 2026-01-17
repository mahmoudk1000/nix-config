{
  config,
  pkgs,
  ...
}:

let
  thunar-with-plugins =
    with pkgs;
    (thunar.override {
      thunarPlugins = [
        thunar-volman
        thunar-archive-plugin
      ];
    });
in
{
  home = {
    packages = [
      thunar-with-plugins
      pkgs.xfce.xfconf
      pkgs.dconf
      pkgs.gvfs
    ];

    sessionVariables = {
      GIO_EXTRA_MODULES = "${pkgs.gvfs}/lib/gio/modules:${pkgs.dconf.lib}/lib/gio/modules";
    };

    file.".config/Thunar/uca.xml".text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <actions>
        <action>
          <icon>terminal</icon>
          <name>Open Terminal Here</name>
          <submenu></submenu>
          <unique-id>1660384349155826-1</unique-id>
          <command>wezterm start --cwd %f</command>
          <description>Open terminal emulator in current directory</description>
          <range></range>
          <patterns>*</patterns>
          <startup-notify/>
          <directories/>
        </action>
        <action>
          <icon>folder-root</icon>
          <name>Open as Root</name>
          <submenu></submenu>
          <unique-id>1660384349155838-2</unique-id>
          <command>${pkgs.polkit}/bin/pkexec thunar %f</command>
          <description>Open a root instance of thunar</description>
          <range></range>
          <patterns>*</patterns>
          <directories/>
        </action>
        <action>
          <icon>7zip</icon>
          <name>Unzip</name>
          <submenu></submenu>
          <unique-id>1671272219906785-1</unique-id>
          <command>${pkgs.unzip}/bin/unzip %f</command>
          <description>unzip files</description>
          <range></range>
          <patterns>*.zip</patterns>
          <other-files/>
        </action>
        <action>
          <icon>${pkgs.vscode}/share/pixmaps/vscode.png</icon>
          <name>Open VSCode Here</name>
          <unique-id>1612104464586265-1</unique-id>
          <command>code %f</command>
          <description></description>
          <patterns>*</patterns>
          <startup-notify/>
          <directories/>
        </action>
      </actions>
    '';
  };

  xfconf.settings = {
    thunar = {
      "last-view" = "ThunarIconView";
      "last-icon-view-zoom-level" = "THUNAR_ZOOM_LEVEL_150_PERCENT";
      "last-menubar-visible" = false;
      "misc-single-click" = false;
      "shortcuts-icon-size" = "THUNAR_ICON_SIZE_16";
      "tree-icon-size" = "THUNAR_ICON_SIZE_16";
      "last-separator-position" = 181;
      "last-show-hidden" = false;
      "hidden-bookmarks" = [
        "file://${config.home.homeDirectory}/Desktop"
        "computer:///"
        "network:///"
      ];
      "misc-confirm-close-multiple-tabs" = false;
      "misc-text-beside-icons" = false;
      "misc-change-window-icon" = true;
      "last-details-view-zoom-level" = "THUNAR_ZOOM_LEVEL_38_PERCENT";
      "last-details-view-column-widths" = "50,125,126,50,1353,90,50,63,1258,63,50,87,50,157";
      "shortcuts-icon-emblems" = true;
      "last-side-pane" = "ThunarShortcutsPane";
      "misc-open-new-window-as-tab" = true;
      "misc-show-delete-action" = false;
      "misc-thumbnail-draw-frames" = false;
      "misc-middle-click-in-tab" = true;
      "tree-icon-emblems" = true;
      "misc-file-size-binary" = true;
      "last-sort-column" = "THUNAR_COLUMN_NAME";
      "last-sort-order" = "GTK_SORT_ASCENDING";
      "misc-folders-first" = true;
      "last-toolbar-item-order" = "0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20";
      "last-toolbar-visible-buttons" = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0";
      "last-image-preview-visible" = false;
      "last-statusbar-visible" = false;
      "last-location-bar" = "void";
      "last-details-view-visible-columns" =
        "THUNAR_COLUMN_DATE_MODIFIED,THUNAR_COLUMN_NAME,THUNAR_COLUMN_SIZE,THUNAR_COLUMN_TYPE";
      "misc-volume-management" = true;
      "misc-full-path-in-tab-title" = false;
      "misc-thumbnail-max-file-size" = 0;
    };
  };

  xdg.mimeApps = {
    defaultApplications = {
      "inode/directory" = [ "thunar.desktop" ];
    };
    associations.added = {
      "inode/directory" = [ "thunar.desktop" ];
    };
  };

  systemd.user.services.thunar = {
    Unit = {
      Description = "Thunar file manager";
      Documentation = "man:Thunar(1)";
    };
    Service = {
      Type = "dbus";
      ExecStart = "${thunar-with-plugins}/bin/Thunar --daemon";
      WantedBy = [ "graphical-session.target" ];
      BusName = "org.xfce.FileManager";
      KillMode = "process";
      # NOTE: PATH is necessary for when thunar is launched by browsers
      PassEnvironment = [ "PATH" ];
    };
  };
}
