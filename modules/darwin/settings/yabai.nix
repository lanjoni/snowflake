{ pkgs, ... }: {
  services.yabai = {
    enable = true;
    config = {
      layout = "bsp";
      window_placement = "second_child";

      # padding set to 6px
      top_padding = 6;
      bottom_padding = 6;
      left_padding = 6;
      right_padding = 6;
      window_gap = 6;

      mouse_follows_focus = "on";
      mouse_modifier = "alt";
      mouse_action1 = "move";
      mouser_action2 = "resize";
      mouse_drop_action = "swap";

      window_topmost = "off";
      window_opacity = "off";
      window_border = "off";
      window_border_width = 1;
      active_window_border_color = "0xff775759";
      normal_window_border_color = "0xff555555";
      insert_window_border_color = "0xffd75f5f";
      split_ratio = 0.5;
      auto_balance = "off";

      external_bar = "all:32:0";
    };
    extraConfig = ''
      # rules for specific apps
      yabai -m rule --add app="^System Settings$" manage=off
      yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
      yabai -m rule --add label="Safari" app="^Safari$" title="^(General|(Tab|Password|Website|Extension)s|AutoFill|Se(arch|curity)|Privacy|Advance)$" manage=off
      yabai -m rule --add label="macfeh" app="^macfeh$" manage=off
      yabai -m rule --add label="System Preferences" app="^System Preferences$" title=".*" manage=off
      yabai -m rule --add label="App Store" app="^App Store$" manage=off
      yabai -m rule --add label="Activity Monitor" app="^Activity Monitor$" manage=off
      yabai -m rule --add label="KeePassXC" app="^KeePassXC$" manage=off
      yabai -m rule --add label="Calculator" app="^Calculator$" manage=off
      yabai -m rule --add label="Dictionary" app="^Dictionary$" manage=off
      yabai -m rule --add label="mpv" app="^mpv$" manage=off
      yabai -m rule --add label="Software Update" title="Software Update" manage=off
      yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off
      yabai -m rule --add label="HHKB" app="HHKB Keymap Tool" title="About This Mac" manage=off
    '';
  };
}
