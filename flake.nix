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
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        name = "public";
        src = self;
        buildInputs = [ pkgs.zola ];
        buildPhase = "zola build";
        installPhase = "cp -r public $out";
      };
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          zola
          nodePackages.vscode-langservers-extracted
          typescript
          nodePackages.typescript-language-server
          nodePackages.live-server
          imagemagick
        ];
      };
    };
}
