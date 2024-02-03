{ pkgs, ... }:
let
  python3 = pkgs.python311Full.buildEnv.override {
    extraLibs = [ pkgs.python311Full.pkgs.pip ];
  };

  # See compatibility matrix
  # https://docs.gradle.org/current/userguide/compatibility.html
  jdk = pkgs.jdk20;
  gradle = (pkgs.callPackage pkgs.gradle-packages.gradle_8 {
    # Reuse same JDK version
    java = jdk;
  });
in {
  home.packages = [
    python3
    pkgs.rustup # Rust toolchain manager
    jdk # Java DevKit 21
    gradle # Gradle build tool for Java projects
    pkgs.go # golang pkg
    pkgs.docker-compose
  ];
}
