# Desktop environment: i3 | dwm | none.
# Returns a single Home Manager module with common + WM-specific config merged.
{ pkgs, desktop ? "none", ... }:
let
  valid = [ "i3" "dwm" "none" ];
  _ = if builtins.elem desktop valid then true
      else throw ''
        Invalid desktop environment: ${desktop}
        Must be one of: i3, dwm, none
      '';
in
(
 if desktop == "i3" then import ./i3.nix { inherit pkgs; }
 else if desktop == "dwm" then import ./default-dwm.nix { inherit pkgs; }
 else {}
)
