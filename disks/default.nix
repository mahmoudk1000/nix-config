# Named disk profiles, selected by name — mirroring modules/themes, where a
# host picks one with `host.diskProfile` (see flake.nix).
#
# This file is also the disko CLI entry point:
#
#   nix run .#disko -- --mode disko ./disks/default.nix \
#     --argstr device /dev/nvme0n1 --argstr passwordFile /tmp/luks-passphrase
#
# See README.md in this directory for the layouts, LUKS setup and the
# install workflow.
{
  profile ? "luks-btrfs-home",
  device ? throw "Set this to your disk device, e.g. /dev/nvme0n1",
  passwordFile ? null,
  # the disko CLI injects its own args (pkgs, lib, mode, diskoFile, ...)
  ...
}:

let
  profiles = {
    # luks(btrfs)+home: LUKS2 btrfs root (/, /nix, /persist) + plain /home
    luks-btrfs-home = import ./luks-btrfs-home.nix;
  };

  validProfiles = builtins.attrNames profiles;

  selected =
    if !builtins.elem profile validProfiles then
      throw "Error: Invalid disk profile '${profile}'. Valid disk profiles are: ${builtins.concatStringsSep ", " validProfiles}"
    else
      builtins.getAttr profile profiles;
in
{
  # disko CLI shape
  disko = {
    enableConfig = false;
    devices = selected.devices { inherit device passwordFile; };
  };

  # the raw selected profile, for NixOS-side consumers (e.g. host modules)
  profile = selected;
}
