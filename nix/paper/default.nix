{
  self,
  stdenv,
  texlive,
}:
stdenv.mkDerivation {
  pname = "paper";
  version = "0.0.1";

  buildInputs = [
    texlive.combined.scheme-small.out
  ];

  src = self;

  buildPhase = ''
    runHook preBuild
    pdflatex paper.tex
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp paper.pdf $out
    runHook postInstall
  '';
}
