{
  self,
  callPackage,
  clang-tools,
  gnumake,
  bear,
  libcxx,
  cppcheck,
  texlive,
  ...
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
        texlive.combined.scheme-full.out # latex
      ]
      ++ (oa.nativeBuildInputs or []);
  })
