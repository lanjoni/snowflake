{ pkgs, ... }: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "23.11";
  # specify my home-manager configs
  home.packages = with pkgs; [
    ripgrep
    fd
    curl
    less
    neofetch
    neovim
    kubectl
    kind
    httpie
    clojure
    clojure-lsp
    leiningen
    htop
    pfetch
    crystal
  ];
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };

  imports = [
    ./settings/zsh.nix
    ./settings/kitty.nix
    ./settings/tmux.nix
  ];

  programs.bat.enable = true;
  programs.bat.config.theme = "TwoDark";
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.eza.enable = true;
  programs.git.enable = true;
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  
  home.file.".inputrc".source = ./settings/inputrc;
}
