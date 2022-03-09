{ stdenv, fetchurl}:

stdenv.mkDerivation rec {
  name = "go-ethereum-statediff";
  version = "v1.10.14-statediff-0.0.29";
  # If you want to test locally, comment out the fetchurl src and use the local copy below.
  #src = fetchurl {
  #  url = "https://github.com/vulcanize/go-ethereum/releases/download/${version}/geth-linux-amd64";
  #  sha256 = "0s1brrr7c36y0pap1f4vll07n2lvjc90yxa6rhx5g6jpsivmfci5";
  #};
  src = ../../geth-linux-amd64;

  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/geth
    chmod +x $out/bin/geth
  '';
}
