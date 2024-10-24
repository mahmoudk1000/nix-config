# NixOS System Configurations

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)
[![built with garnix](https://img.shields.io/endpoint?url=https%3A%2F%2Fgarnix.io%2Fapi%2Fbadges%2Fmahmoudk1000%2Fnix-config%3Fbranch%3Dmain)](https://garnix.io)

Welcome to nix configuration! This repository contains my NixOS system configurations and [dotfiles](https://github.com/mahmoudk1000/dotfiles)
> I am no Nix expert.

## Screenshot

![awesomewm desktop screenshot](https://github.com/mahmoudk1000/nix-config/blob/main/assets/awesomewm.png)

## Setup

My nix configurations runs flakes and home-manager. And it's meant mainly only for my laptop.

1. Clone config repo

```bash
git clone https://github.com/mahmoudk1000/nix-config.git ~/.config/nixpkgs
```

2. Install (**labbi** is the only profile I have atm.)

```bash
sudo nixos-rebuild switch --flake '.#labbi'
```

## Credits

[nerdypepper](https://git.peppe.rs/config/nixos/about/) Most thanks goes to you. I have built my config based on yours :)

[JavaCafe01](https://github.com/JavaCafe01/frostedflakes)
