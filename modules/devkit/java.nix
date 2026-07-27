{ pkgs, ... }:
let
  # See compatibility matrix
  # https://docs.gradle.org/current/userguide/compatibility.html
  jdk = pkgs.jdk25_headless;
in
{
  home.packages = [
    jdk
    pkgs.gradle # Gradle build tool for Java projects
    pkgs.maven
  ];

  home.sessionVariables = {
    JAVA_HOME = "${jdk}";
  };
}
