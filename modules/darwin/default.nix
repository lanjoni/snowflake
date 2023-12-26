{ pkgs, ... }: {
  # here go the darwin preferences and config items
  programs.zsh.enable = true;
  users.users.guto.home = "/Users/guto";
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  imports = [
    ./settings/system.nix
    ./settings/environment.nix
    ./settings/homebrew.nix
    ./settings/yabai.nix
    ./settings/skhd.nix
    ./settings/spacebar.nix
  ];
}
