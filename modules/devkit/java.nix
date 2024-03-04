{ pkgs, ... }:
let
  # See compatibility matrix
  # https://docs.gradle.org/current/userguide/compatibility.html
  jdk = pkgs.jdk20;
  gradle = (pkgs.callPackage pkgs.gradle-packages.gradle_8 {
    # Reuse same JDK version
    java = jdk;
  });
in {
  home.packages = [
    jdk # Java DevKit 21
    gradle # Gradle build tool for Java projects
  ];

}
