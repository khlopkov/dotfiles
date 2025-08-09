{ pkgs, ... }:
let
  gcloud = pkgs.google-cloud-sdk.withExtraComponents (
    with pkgs.google-cloud-sdk.components; [ gke-gcloud-auth-plugin ]
  );
in
{
  home.sessionVariables = {
    USE_GKE_GCLOUD_AUTH_PLUGIN = "True";
  };

  home.packages = [ gcloud ];
}
