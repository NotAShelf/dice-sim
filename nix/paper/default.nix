{
  self,
  stdenv,
  texlive,
}:
stdenv.mkDerivation {
  pname = "paper";
  version = "0.0.1";

  nativeBuildInputs = [
    texlive.combined.scheme-full.out
  ];

  src = self + "/paper";

  buildPhase = ''
    runHook preBuild
    pdflatex $src/paper.tex
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp paper.pdf $out
    cp paper.toc $out
    runHook postInstall
  '';
}
