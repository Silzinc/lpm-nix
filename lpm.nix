{
  pkgs ? import <nixpkgs> { },
  system ? builtins.currentSystem,
}:

let
  # GENERATED VERSION CONTROL - BEGIN
  releaseTag = "v0.7.2";
  platform_attrs = {
    "aarch64-darwin" = {
      url = "https://github.com/codebycruz/lpm/releases/download/v0.7.2/lpm-macos-aarch64";
      sha256 = "0bi25gcfaq37l1msklrxha7w2k26z5al001zyqbwycjhjk67cha7";
    };
    "aarch64-linux" = {
      url = "https://github.com/codebycruz/lpm/releases/download/v0.7.2/lpm-linux-aarch64";
      sha256 = "1j9r7p3dav92cfilmdm9yk6qs0pc8h0adny72c8xz48kfi6wdris";
    };
    "x86_64-linux" = {
      url = "https://github.com/codebycruz/lpm/releases/download/v0.7.2/lpm-linux-x86-64";
      sha256 = "0sai4g5wmanaq4b8vbc8vmg7h2nikgrm2qbw1jin5x77md94zql1";
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
