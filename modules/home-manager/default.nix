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
      asciinema
      aspell
      autoconf
      gawk
      awscli2
      babashka
      cmake
      coreutils
      docutils
      fd
      fontconfig
      gd
      gdbm
      gettext
      giflib
      glib
      gmp
      go
      graphite2
      harfbuzz
      httpie
      icu
      imath
      jansson
      krb5
      libavif
      libevent
      libidn2
      libnghttp2
      libpng
      librsvg
      libsodium
      libssh2
      libtasn1
      libtiff
      libtool
      libunistring
      libvmaf
      libyaml
      lua
      lz4
      lzo
      m4
      maven
      mpdecimal
      ncurses
      nettle
      oniguruma
      opam
      openexr
      openldap
      openssl
      p11-kit
      pandoc
      pango
      pcre
      pcre2
      perl
      php
      pixman
      pkg-config
      python3
      rbenv
      readline
      ripgrep
      rlwrap
      rtmpdump
      ruby
      rustup
      semgrep
      sqlite
      terraform
      texinfo
      thefuck
      tree
      tree-sitter
      unbound
      vim
      wget
      xz
      zstd
      jetbrains.idea-ultimate
      raycast
      slack
      spotify
      telegram-desktop
      vscode
      zoom-us
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
