{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "go-ethereum-statediff";
  version = "v1.9.24-statediff-0.0.13";
  src = fetchurl {
    url = "https://github.com/vulcanize/go-ethereum/releases/download/${version}/geth-linux-amd64";
    sha256 = "1g5wngx1lz8rfwc5q6h04rg1jb88rxgllpxacvbhxpmswzqvcyjg";
  };

  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/geth
    chmod +x $out/bin/geth
  '';
}
