![2bwm desktop screenshot](https://github.com/mahmoudk1000/nix-config/blob/main/assets/2bwm.png)
# NixOS System Configurations
Welcome to my dotfiles! This repository contains my NixOS system configurations.  
> I am no Nix expert.
>
>> And I am not yet used to it and fully understand it.

## Setup
My nix configurations runs flakes and home-manager. And it's meant only for my laptop.
1. Clone config repo
```
$ https://github.com/mahmoudk1000/nix-config.git ~/.config/nixpkgs
```
2. Install (**labbi** is the only profile I have atm.)
```
$ sudo nixos-rebuild switch --flake .#labbi
```

## Credits
[nerdypepper](https://git.peppe.rs/config/nixos/about/) Most thanks goes to you. I have built my config based on yours :)  
[JavaCafe01](https://github.com/JavaCafe01/frostedflakes)
