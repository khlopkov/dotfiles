{ pkgs, ... }:
let
  python3 = pkgs.python3;

  # See compatibility matrix
  # https://docs.gradle.org/current/userguide/compatibility.html
  jdk = pkgs.jdk20;
  gradle = (pkgs.callPackage pkgs.gradle-packages.gradle_8 {
    # Reuse same JDK version
    java = jdk;
  });
in {
  home.packages = with pkgs; [
    python3
    python3.pkgs.pip
    rustup # Rust toolchain manager
    jdk # Java DevKit 21
    gradle # Gradle build tool for Java projects
    go # golang pkg
    docker-compose
    git
  ];
}
