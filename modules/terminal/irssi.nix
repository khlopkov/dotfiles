{ pkgs, ... }:
let
  scriptsRepo = builtins.fetchGit {
    url = "https://github.com/shabble/irssi-scripts";
    rev = "67f236729177a62a370b3d7cb7e4a4c91baf8f41";
  };
in {
  home.packages = with pkgs; [ irssi ];

  home.file = {
    ".irssi/scripts/vim_mode.pl".source = "${scriptsRepo}/vim-mode/vim_mode.pl";
    ".irssi/scripts/uberprompt.pl".source =
      "${scriptsRepo}/prompt_info/uberprompt.pl";
  };
}
