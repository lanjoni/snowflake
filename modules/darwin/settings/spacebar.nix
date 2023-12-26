{ pkgs, ... }: {
  services.spacebar = {
    enable = true;
    package = pkgs.spacebar;
    config = {
     position = "top";
     height = 32;
     title = "off";
     spaces = "on";
     clock = "on";
     power = "on";
     padding_left = 20;
     padding_right = 20;
     spacing_left = 25;
     spacing_right = 15;
     text_font = "Roboto:Regular:12.0";
     icon_font = "Roboto:Regular:12.0";
     display = "all";
     spaces_for_all_displays = "off";

     background_color = "0xff0D1014";
     foreground_color = "0xffd5d5d5";

     display_separator = "off";
     display_separator_icon = "-";

     space_icon_color = "0xff947fb8";
     power_icon_color = "0xffcd950c";
     battery_icon_color = "0xffd75f5f";
     dnd_icon_color = "0xffa8a8a8";
     clock_icon_color = "0xffa8a8a8";
     power_icon_strip = "";
     space_icon_strip = "www code term msg db 6 7 8 9 10";
     space_icon = "•";
     clock_icon = " ";
     dnd_icon = "";
     clock_format = "%a %d %b %l:%M%p";
     right_shell = "off";
     right_shell_icon = " ";
     right_shell_command = " ";

     debug_output = "on";
    };
  };
}
