{ pkgs, ... }: {
  # specify my home-manager configs
  imports = [
    ./settings/zsh.nix
    ./settings/kitty.nix
    ./settings/tmux.nix
  ];

  home = {
    username = "guto";
    homeDirectory = "/Users/guto";
    packages = with pkgs; [
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

    sessionVariables = {
      PAGER = "less";
      CLICLOLOR = 1;
      EDITOR = "nvim";
    };
  };

  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    bat = {
      enable = true;
      config.theme = "TwoDark";
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    eza.enable = true;
    git.enable = true;
  };

  home.file.".inputrc".source = ./settings/inputrc;
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "23.11";
}
