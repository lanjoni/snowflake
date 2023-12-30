# Not using anymore
{ pkgs, ... }: {
  homebrew = {
    brewPrefix = "/opt/homebrew/bin";
    enable = true;
    caskArgs.no_quarantine = true;
    global = {
      brewfile = true;
      # lockfiles = true;
    };
    casks = [ 
      "raycast"
      "firefox"
      "spotify"
      "slack"
      "visual-studio-code"
      "zoom"
      "brave-browser"
      "intellij-idea"
      "font-sf-mono-nerd-font"
      "obs"
      "telegram"
    ];
    taps = [
      "homebrew/core"
      "homebrew/cask"
      "homebrew/cask-fonts"
      "d12frosted/emacs-plus"
      # "xorpse/formulae"
      "cmacrae/formulae"
    ];
    # brews = [ "trippy" ];

    extraConfig = ''
      brew "d12frosted/emacs-plus/emacs-plus@28", args: ["with-elrumo2-icon", "with-native-comp", "with-xwidgets", "without-imagemagick"]
      brew "cmacrae/formulae/spacebar"
    '';
  };
}
