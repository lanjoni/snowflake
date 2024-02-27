{ pkgs, ... }: {
  # .zshenv
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    history = {
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      save = 1000000;
      size = 1000000;
    };

    shellAliases = {
      nixswitch = "darwin-rebuild switch --flake ~/.config/snowflake/.#";
      nixup = "pushd ~/.config/snowflake; nix flake update; nixswitch; popd";
      ls = "ls --color=auto";
      ll = "ls -lahrts";
      l = "ls -l";
      vi = "nvim";
      python = "python3";
      k = "kubectl";
      tmux = "TERM=screen-256color-bce tmux";
      ocaml = "rlwrap ocaml";
      felix = "ssh felix@209.133.204.26 -p 13031";
      docker-clean = "docker rmi $(docker images -f 'dangling=true' -q)";
    };

    initExtra = ''
      # SPACESHIP_SCALA_SHOW=false
      export ZSH="/Users/guto/.oh-my-zsh"
      export EDITOR=vi
      export TERM=xterm-256color
      export LANG=en_US.UTF-8
      export PATH="$HOME/.emacs.d/bin:$PATH"
      eval "$(rbenv init - zsh)"
      . "$HOME/.asdf/asdf.sh"
      eval $(opam env)
      export PATH="/Users/guto/go/bin/:$PATH"
      export PATH="/Users/guto/.layerform/:$PATH"
      # Ok, if Nix doesn't work, try this:
      # export PATH="/run/current-system/sw/bin:$PATH"
      source <(kubectl completion zsh)
      export NVM_DIR="$HOME/.nvm"
      export KERL_BUILD_DOCS="yes"
      export ERL_AFLAGS="-kernel shell_history enabled"
      export SDKMAN_DIR="$HOME/.sdkman"
      [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

      # And enable this
      # if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
      #   . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      # fi
      '';

    oh-my-zsh = {
      enable = true;
      # theme = "spaceship";
      plugins = [ 
        "aws"
        "git" 
        "docker" 
        "kubectl" 
        "asdf" 
        "rbenv" 
        "terraform" 
        "history" 
        "history-substring-search" 
      ];
    };
  };
}
