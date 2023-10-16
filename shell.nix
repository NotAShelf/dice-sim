{
  self,
  callPackage,
  clang-tools,
  gnumake,
  bear,
  libcxx,
  cppcheck,
}: let
  mainPkg = callPackage ./nix/dice-sim {inherit self;};
in
  mainPkg.overrideAttrs (oa: {
    nativeBuildInputs =
      [
        clang-tools # fix headers not found
        gnumake # builder
        bear # bear.
        libcxx # stdlib for cpp
        cppcheck # static analysis
      ]
      ++ (oa.nativeBuildInputs or []);
  })
