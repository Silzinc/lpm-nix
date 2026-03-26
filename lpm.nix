{
  pkgs ? import <nixpkgs> { },
  system ? builtins.currentSystem,
}:

let
  # GENERATED VERSION CONTROL - BEGIN
  releaseTag = "nightly";
  platform_attrs = {
    "aarch64-darwin" = {
      url = "https://github.com/codebycruz/lpm/releases/download/nightly/lpm-macos-aarch64";
      sha256 = "0a6717dw5c1hhdh1yhvxqrnfplyjxl51g3hi1klgyg196ylmg97d";
    };
    "aarch64-linux" = {
      url = "https://github.com/codebycruz/lpm/releases/download/nightly/lpm-linux-aarch64";
      sha256 = "0q4zl73gk9fpbq7gc18jbhqv0rars4ypvzby16gl6phw291jnpyq";
    };
    "x86_64-linux" = {
      url = "https://github.com/codebycruz/lpm/releases/download/nightly/lpm-linux-x86-64";
      sha256 = "1a0a1z5mkn527jv2694sv0n9pcgmc9f4zzk1df26prvvjmbs59x4";
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
