{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "go-ethereum-statediff";
  version = "v1.10.14-statediff-0.0.29";
  src = fetchurl {
    url = "https://github.com/vulcanize/go-ethereum/releases/download/${version}/geth-linux-amd64";
    sha256 = "0s1brrr7c36y0pap1f4vll07n2lvjc90yxa6rhx5g6jpsivmfci5";
  };

  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/geth
    chmod +x $out/bin/geth
  '';
}
