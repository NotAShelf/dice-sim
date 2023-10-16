{
  description = "Dice Simulation with C++";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    inherit (nixpkgs) lib;

    systems = ["x86_64-linux" "aarch64-linux"];
    forEachSystem = nixpkgs.lib.genAttrs systems;
    pkgsForEach = nixpkgs.legacyPackages;
  in {
    packages = forEachSystem (system: {
      # provide the dice simulation package
      dice-sim = pkgsForEach.${system}.callPackage ./nix/dice-sim {inherit self;};
      # package the "paper" separately
      paper = pkgsForEach.${system}.callPackage ./nix/paper {inherit self;};

      default = throw ''
        There is no default package! You must instead build one of the available packages:
        ${builtins.concatStringsSep "\n" (lib.filter (name: name != "default") (lib.attrNames self.packages.${system}))}
      '';
    });

    devShells = forEachSystem (system: {
      default = pkgsForEach.${system}.callPackage ./shell.nix {inherit self;};
    });
  };
}
