{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "go-ethereum-statediff";
  version = "v1.10.9-statediff-0.0.27";
  src = fetchurl {
    url = "https://github.com/vulcanize/go-ethereum/releases/download/${version}/geth-linux-amd64";
    sha256 = "0sah9cmc7k1s7bf8m5slhp3dhiwf436pmjg8553n0kpkgig9n6cg";
  };

  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/geth
    chmod +x $out/bin/geth
  '';
}
