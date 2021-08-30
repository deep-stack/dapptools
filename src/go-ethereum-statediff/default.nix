{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "go-ethereum-statediff";
  version = "v1.10.8-statediff-0.0.26";
  src = fetchurl {
    url = "https://github.com/vulcanize/go-ethereum/releases/download/${version}/geth-linux-amd64";
    sha256 = "11lxvnijvw11k5ds77fygbphccddwz1nb64rqa6azckjy9kmbkhg";
  };

  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/geth
    chmod +x $out/bin/geth
  '';
}
