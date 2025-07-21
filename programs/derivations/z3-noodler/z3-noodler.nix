{ config, pkgs, ... }:

let
  mata = pkgs.stdenv.mkDerivation {
    name = "mata";
    version = "1.22.1";

    src = pkgs.fetchFromGitHub {
      owner = "VeriFIT";
      repo = "mata";
      rev = "2c67fe18ce683da2fcb7849ba9d9578e86ac4dbf";
      hash = "sha256-CeK5ThGFcjayl31wdUaFg2uVGNwDvSzPNfF5d6aB6xg=";
    };

    nativeBuildInputs = with pkgs; [ cmake makeWrapper gcc ];

    buildPhase = ''
      runHook preBuild
      runHook postBuild
    '';
    installPhase = ''
      runHook preInstall
      cd ..
      make install
      runHook postInstall
    '';
  };

  z3-noodler = pkgs.stdenv.mkDerivation {
    name = "z3-noodler";
    version = "1.4.0";

    src = pkgs.fetchFromGitHub {
      owner = "VeriFIT";
      repo = "z3-noodler";
      rev = "6f8825d52c90f2d62e46aac97eec3e11dc24ecd8";
      hash = "sha256-pFXIl/IbepNIjwjEEFMBBk9dRNck+/AeXaRif7oVN0k=";
    };

    nativeBuildInputs = with pkgs; [ python3 pkg-config cmake makeWrapper gcc mata git ];

    patches = [
      ./fix-pkg-config-paths.patch
    ];
    doInstallCheck = true;
    enableParallelBuilding = true;
  };
in
{
  environment.systemPackages = [
    z3-noodler
  ];
}
