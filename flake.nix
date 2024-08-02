{
  description = "Site - Murtaza Udaipurwala";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        formatter = pkgs.nixpkgs-fmt;
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nixd
            nixpkgs-fmt
            nodejs
            nodePackages.pnpm
            nodePackages.vscode-langservers-extracted
            nodePackages.typescript-language-server
            prettierd
            tailwindcss-language-server
            netlify-cli
            hugo
          ];
        };
      });
}
