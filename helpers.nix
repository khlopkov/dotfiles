{ pkgs, lib, ... }:
let 
  nixGL = import <nixgl> {};
  nixGLWrap = pkg:
    let
      bin = "${pkg}/bin";
      executables = builtins.attrNames (builtins.readDir bin);
    in
    pkgs.buildEnv {
      name = "nixGL-${pkg.name}";
      paths = map
        (name: pkgs.writeShellScriptBin name ''
          exec -a "$0" ${nixGL.auto.nixGLDefault}/bin/nixGL ${bin}/${name} "$@"
        '')
        executables;
    };
in {
  nixGLWrap = nixGLWrap;
}
