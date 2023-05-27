+++
title = "Installing packages from NixOS-Unstable using Home-Manager: the Flake way"
date = 2023-05-27
+++

**Background**:  I use Nix Flakes and Home-Manager to manage my
[dotfiles](https://github.com/murtaza-u/dot) and packages.

After
[witnessing](https://www.youtube.com/watch?v=6Le0IbPRzOE&pp=ygUNbml4b3MgbWF0dGhldw%3D%3D)
the power of Nix, I recently made the switch to NixOS along with a neat
Nix- based tool called home-manager, which allows you to manage your
user profile declaratively. It was around this time that I was also
trying out the [Helix](https://helix-editor.com) text editor. When I
looked up the Helix package on
[search.nixos.org](https://search.nixos.org), I discovered that it was a
version behind the latest release. Fortunately, nixos-unstable had the
latest version available (23.05 at the time of writing this). Below is
how I figured out how to use the unstable repository to install Helix.

Firstly, `flake.nix` allows you to define multiple inputs using:

```nix
inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
  # the unstable package repository
  nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};
```

Over in the output block, using the `extraSpecialArgs` parameter, I can
pass in the `unstable-pkgs` to home manager.

```nix
outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    unstable-pkgs = nixpkgs-unstable.legacyPackages.${system};
  in
  {
    homeManagerConfigurations = {
      <username> = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = {
          inherit unstable-pkgs;
        };
      };
    };
  };
```

Finally, in `home.nix`, I can reference the `unstable-pkgs` to download
Helix from `nixos-unstable`.

```nix
# home.nix
{ config, pkgs, unstable-pkgs, ... }:

{
  home.packages = [
    unstable-pkgs.helix # installing from unstable repository
    pkgs.alacritty # installing from stable repository
  ];
}
```