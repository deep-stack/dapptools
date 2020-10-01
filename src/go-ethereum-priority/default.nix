{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "go-ethereum-priority";
  version = "v1.9.20-pq-0.0.2";

  src = ./geth;
  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/geth
    chmod +x $out/bin/geth
  '';
}
