{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "go-ethereum-statediff";
  version = "v1.10.8-statediff-0.0.27";
  src = fetchurl {
    url = "https://github.com/vulcanize/go-ethereum/releases/download/${version}/geth-linux-amd64";
    sha256 = "12i3wrriza99ka42f6wr0kf1mpdapw92cz2kvb56ng6ci7s0dizs";
  };

  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/geth
    chmod +x $out/bin/geth
  '';
}
