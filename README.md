# NixOS System Configurations

![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20With%20Nix&color=5277C3)
![Nix Channel](https://img.shields.io/badge/NixOS-unstable-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8AADF4)
[![built with garnix](https://img.shields.io/endpoint?url=https%3A%2F%2Fgarnix.io%2Fapi%2Fbadges%2Fmahmoudk1000%2Fnix-config%3Fbranch%3Dmain)](https://garnix.io)
[![Statix Lint](https://github.com/mahmoudk1000/nix-config/actions/workflows/lint.yml/badge.svg)](https://github.com/mahmoudk1000/nix-config/actions/workflows/lint.yml)

Welcome to nix configuration! This repository contains my NixOS system configurations and [dotfiles](https://github.com/mahmoudk1000/dotfiles)
> I am no Nix expert.

## Screenshot

![awesomewm desktop screenshot](https://github.com/mahmoudk1000/nix-config/blob/main/assets/awesomewm.png)

## Installation

> [!CAUTION]
> This hosts system and home configurations are public for your own learning and
> research. They are not meant to be used with any hardware other than mine.
> Trying to build and deploy them to other systems without appropriate changes
> can render your machines unbootable and damage data.

My nix configurations runs flakes and home-manager. And it's meant mainly only for my laptop.

<details>
    <summary>Installation Steps</summary>

After mounting the partitions, you can move to the second part...

```shell
# go inside a nix shell with the specified programs
nix-shell -p git nixUnstable neovim

# create this folder if necessary
mkdir -p /mnt/etc/

# clone the repo
git clone https://github.com/mahmoudk1000/nix-config.git /mnt/etc/nixos

# remove this file
rm /mnt/etc/nixos/hosts/redyf/hardware-configuration.nix

# generate the config and take some files
nixos-generate-config --root /mnt
mv /mnt/etc/nixos/configuration.nix
mv /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/hosts/labbi

# make sure you're in this path
cd /mnt/etc/nixos

# Install my config:
nixos-install --flake '.#labbi'

If you'd like to use my config as a template, all you need to do is replace "hosts" with your username.
```

</details>

<hr>

Disko is also available for formatting partitions (Only for advanced users)

<details>

<summary>Disko</summary>

If you save disko's config file in **./disks/default.nix**, and run the following command:

```nix
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./disks/default.nix --arg device '/dev/nvme0n1'
```

you will partition, format and mount the disk for /dev/nvme0n1 (change as needed).

</details>

<hr>

## Credits

[nerdypepper](https://git.peppe.rs/config/nixos/about/)

[JavaCafe01](https://github.com/JavaCafe01/frostedflakes)

[Gvolpe](https://github.com/gvolpe/nix-config/)

[redyf](https://github.com/redyf/nixdots)

[linuxmobile](https://github.com/linuxmobile/kaku)
