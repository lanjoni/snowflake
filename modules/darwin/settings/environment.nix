{ pkgs, ... }: {
  environment = {
    shells = with pkgs; [ bash zsh ];
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/usr/local/bin" ];
    pathsToLink = [ "/Applications" ];
  };
}
