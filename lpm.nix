{
  pkgs ? import <nixpkgs> { },
  system ? builtins.currentSystem,
}:

let
  # GENERATED VERSION CONTROL - BEGIN
  releaseTag = "v0.8.0";
  platform_attrs = {
    "aarch64-darwin" = {
      url = "https://github.com/codebycruz/lpm/releases/download/v0.8.0/lpm-macos-aarch64";
      sha256 = "0jlp5fjyvagdmynycv5ag67hpwmnkpxm3125qwyzh1j81fgii9i2";
    };
    "aarch64-linux" = {
      url = "https://github.com/codebycruz/lpm/releases/download/v0.8.0/lpm-linux-aarch64";
      sha256 = "171m4xm355hrjwmlb7v0ddzgmgg88bys72yr68xmjqipp75hfb9z";
    };
    "x86_64-linux" = {
      url = "https://github.com/codebycruz/lpm/releases/download/v0.8.0/lpm-linux-x86-64";
      sha256 = "1kcrlfcbx247i21v1p5incifakb1nibm27zpf8abkkpy4xi36a4f";
    };
  };
  # GENERATED VERSION CONTROL - END
in
pkgs.stdenv.mkDerivation {
  pname = "lpm";
  version = releaseTag;
  src = pkgs.fetchurl platform_attrs.${system};
  nativeBuildInputs = [ pkgs.autoPatchelfHook ];
  buildInputs = [
    pkgs.glibc
    pkgs.gcc-unwrapped
  ];
  unpackPhase = "true";
  installPhase = ''
    install -D "$src" "$out/bin/lpm"
  '';
}
