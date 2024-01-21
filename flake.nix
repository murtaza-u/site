{
  description = "Portfolio website";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = pkgs.nixpkgs-fmt;
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          nodejs
          nodePackages.pnpm
          prettierd
          tailwindcss-language-server
          typescript
          nodePackages.typescript-language-server
          nodePackages.vscode-langservers-extracted
        ];
      };
    };
}
