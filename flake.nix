{
  description = "Code for https://murtazau.xyz";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = pkgs.nixpkgs-fmt;
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          hugo
          nodePackages.vscode-langservers-extracted
          typescript
          nodePackages.typescript-language-server
          nodePackages.live-server
          imagemagick
        ];
      };
    };
}
