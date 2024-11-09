{
  pkgs,
  ...
}:

let
  thunar-with-plugins =
    with pkgs.xfce;
    (thunar.override {
      thunarPlugins = [
        thunar-volman
        thunar-archive-plugin
        thunar-media-tags-plugin
      ];
    });
in
{
  home.packages = with pkgs.xfce; [
    thunar-with-plugins
    exo
  ];
}
