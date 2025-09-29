{
  theme ? null,
}:

let
  themeGallery = {
    blaulicht = import ./blaulicht.nix;
    blind = import ./blind.nix;
    bliss = import ./bliss.nix;
    bluewery = import ./bluewery.nix;
    coral = import ./coral.nix;
    crystal = import ./crystal.nix;
    fujin = import ./fuji.nix;
    iceberg = import ./iceberg.nix;
    idx = import ./idx.nix;
    jotai = import ./jotai.nix;
    kalt = import ./kalt.nix;
    kanagawa = import ./kanagawa.nix;
    late = import ./late.nix;
    melle = import ./melle.nix;
    mellow = import ./mellow.nix;
    momo = import ./momo.nix;
    mongo = import ./mongo.nix;
    mountain = import ./mountain.nix;
    night = import ./night.nix;
    oxo = import ./oxo.nix;
    poimandres = import ./poimandres.nix;
    rnvy = import ./rnvy.nix;
    rogue = import ./rogue.nix;
    seaul = import ./seaul.nix;
    techbase = import ./techbase.nix;
    tokyonight = import ./tokyonight.nix;
    uwu = import ./uwu.nix;
    yuto = import ./yuro.nix;
  };

  validThemes = builtins.attrNames themeGallery;

in
if theme == null then
  throw "Error: No theme specified. Please choose one of the following themes: ${builtins.concatStringsSep ", " validThemes}"
else if !builtins.elem theme validThemes then
  throw "Error: Invalid theme '${theme}'. Valid themes are: ${builtins.concatStringsSep ", " validThemes}"
else
  builtins.getAttr theme themeGallery
