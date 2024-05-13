{ pkgs ? import<nixpkgs>{} }: 
pkgs.stdenv.mkDerivation rec {
  pname = "NoMAD";
  version = "1.3.0";
  src = pkgs.fetchurl {
    url = "https://github.com/jamf/NoMAD/releases/download/${version}/NoMAD-1.3.0.RC1.zip";
    sha256 = "af1766a83daf2580ac556f0954dd645fd6756d20d4d2de222d8144f214d1c12f";
  };
  buildInputs = [pkgs.unzip];
  installPhase = ''
    mkdir -p $out/bin
    ${pkgs.unzip}/bin/${pkgs.unzip.pname} ${src} -d $out/bin
  '';
}