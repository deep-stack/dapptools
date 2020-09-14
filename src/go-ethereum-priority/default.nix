{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "go-ethereum-priority";
  version = "v1.9.20-pq-0.0.1";
  src = fetchurl {
    url = "https://github.com/vulcanize/priority-queue-go-ethereum/releases/download/${version}/geth-linux-amd64";
    sha256 = "0rvsvggfmayiw18fnka1d4x9bvrgbp8nymh7bmx9ycayvwhlza54";
  };

  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/geth
    chmod +x $out/bin/geth
  '';
}
