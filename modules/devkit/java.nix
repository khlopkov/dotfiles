{ pkgs, ... }:
let
  # See compatibility matrix
  # https://docs.gradle.org/current/userguide/compatibility.html
  jdk = pkgs.jdk21;

  gradle = pkgs.callPackage pkgs.gradle-packages.gradle_8 {
    # Reuse same JDK version
    java = jdk;
  };

  maven = pkgs.maven.override { jdk_headless = jdk; };
in {
  home.packages = [
    jdk # Java DevKit 21
    gradle # Gradle build tool for Java projects
    maven
  ];

  home.sessionVariables = { JAVA_HOME = "${jdk}"; };
}
