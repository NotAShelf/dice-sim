{
  self,
  clangStdenv,
  cxxopts,
  gcc,
}:
clangStdenv.mkDerivation {
  pname = "dice-sim";
  version = "0.0.1";

  src = self + "/src";
  buildInputs = [
    cxxopts
    gcc
  ];

  dontConfigure = true;

  buildPhase = ''
    runHook preBuild
    g++ -o dice-sim main.cpp
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp dice-sim $out/bin
    runHook postInstall
  '';
}
