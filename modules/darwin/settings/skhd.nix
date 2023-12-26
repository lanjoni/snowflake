{ pkgs, ... }: {
  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = ''
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - h : yabai -m window --focus west
      alt - l : yabai -m window --focus east

      alt - s: yabai -m display --focus west
      alt - g: yabai -m display --focus east

      shift + alt - r : yabai -m space --rotate 270
      shift + alt - y : yabai -m space --mirror y-axis
      shift + alt - x : yabai -m space --mirror x-axis
      shift + alt - t : yabai -m window --toggle float --grid 4:4:1:1:2:2

      shift + alt - m : yabai -m window --toggle zoom-fullscreen

      shift + alt - e : yabai -m space --balance

      shift + alt - j : yabai -m window --swap south
      shift + alt - k : yabai -m window --swap north
      shift + alt - h : yabai -m window --swap west
      shift + alt - l : yabai -m window --swap east

      ctrl + alt - j : yabai -m window --warp south
      ctrl + alt - k : yabai -m window --warp north
      ctrl + alt - h : yabai -m window --warp west
      ctrl + alt - l : yabai -m window --warp east

      shift + alt - s : yabai -m window --display west; yabai -m display --focus west;
      shift + alt - g : yabai -m window --display east; yabai -m display --focus east;


      shift + alt - p : yabai -m window --space prev;
      shift + alt - n : yabai -m window --space next;

      shift + alt - 1 : yabai -m window --space 1;
      shift + alt - 2 : yabai -m window --space 2;
      shift + alt - 3 : yabai -m window --space 3;
      shift + alt - 4 : yabai -m window --space 4;
      shift + alt - 5 : yabai -m window --space 5;
      shift + alt - 6 : yabai -m window --space 6;
      shift + alt - 7 : yabai -m window --space 7;


      ctrl + alt - q : yabai --stop-service
      ctrl + alt - s : yabai --start-service 
      ctrl + alt - r : yabai --restart-service 

      cmd - return : /Applications/kitty.app/Contents/MacOS/kitty --single-instance -d ~
    '';
  };
}
