{ pkgs, ... }:
let
  nixGL = pkgs.nixgl.auto.nixGLDefault;
  nixGLWrap =
    pkg:
    let
      bin = "${pkg}/bin";
      executables = builtins.attrNames (builtins.readDir bin);
    in
    pkgs.buildEnv {
      name = "nixGL-${pkg.name}";
      paths = map (
        name:
        pkgs.writeShellScriptBin name ''
          exec -a "$0" ${nixGL}/bin/nixGL ${bin}/${name} "$@"
        ''
      ) executables;
    };
  nixGLWrapPerSystem =
    pkg:
    let
      isLinux = pkgs.stdenv.isLinux;
    in
    if isLinux then (nixGLWrap pkg) else pkg;
in
{
  nixGLWrap = nixGLWrapPerSystem;
}
