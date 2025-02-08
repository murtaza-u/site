{
  description = "Site - Murtaza Udaipurwala";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
            "terraform"
          ];
        };
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
            tailwindcss-language-server
            emmet-language-server
            netlify-cli
            hugo
            markdownlint-cli
            cbfmt
            shfmt
            mdformat
            python312Packages.mdformat-frontmatter
            gofumpt
            templ
            terraform
          ];
        };
      });
}
