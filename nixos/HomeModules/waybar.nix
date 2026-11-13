{ ... }:

{
  programs.waybar = {
    enable = true;

    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 34;
      spacing = 8;

      modules-left = [
        "mango/workspaces"
        "mango/layout"
        "mango/window"
      ];

      modules-center = [
        "clock"
      ];

      modules-right = [
        "cpu"
        "memory"
        "network"
        "pulseaudio"
        "battery"
        "tray"
      ];

      "mango/workspaces" = {
        format = "{icon}";
        hide-empty = false;
        on-click = "activate";
        on-click-right = "toggle";
      };

      "mango/layout" = {
        format = "{}";
      };

      "mango/window" = {
        format = "{}";
        max-length = 40;
      };

      clock = {
        format = "{:%a %d %b  %H:%M}";
        tooltip = false;
      };

      cpu.format = " {usage}%";
      memory.format = "󰍛 {percentage}%";

      network = {
        format-wifi = "󰖩 {essid}";
        format-ethernet = "󰈀 Connected";
        format-disconnected = "󰖪 Disconnected";
      };

      pulseaudio = {
        format = "󰕾 {volume}%";
        format-muted = "󰝟 Muted";
      };

      battery = {
        format = "󰁹 {capacity}%";
        format-charging = "󰂄 {capacity}%";
      };
    };
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 12px;
        border: none;
        min-height: 0;
      }

      window#waybar {
        background: #1e1e2e;
        color: #cdd6f4;
      }

      #workspaces button {
        padding: 0 8px;
        color: #a6adc8;
        background: transparent;
      }

      #workspaces button.active {
        color: #1e1e2e;
        background: #89b4fa;
        border-radius: 6px;
      }

      #clock, #cpu, #memory, #network,
      #pulseaudio, #battery, #tray, #layout,
      #window {
        padding: 0 10px;
        margin: 4px;
        background: #313244;
        border-radius: 6px;
      }
    '';
  };

  xdg.configFile."mango/config.conf".text = ''
    # Number of tags
    tag_num=9

    # Trackpad
    tap_to_click=1
    tap_and_drag=1
    trackpad_natural_scrolling=0
    trackpad_disable_while_typing=1

    # Gestures
    gesture_live=1
    gesture_swipe_distance=300

    gesturebind=NONE,left,4,viewnext_have_client
    gesturebind=NONE,right,4,viewprev_have_client

    gesturebind=NONE,up,4,enteroverview
    gesturebind=NONE,down,4,leaveoverview

    # Three-finger window focus
    gesturebind=NONE,left,3,focusdir,left
    gesturebind=NONE,right,3,focusdir,right

    # Workspace shortcuts
    ${builtins.concatStringsSep "\n" (
      map (n: "bind=SUPER,${toString n},view,${toString n},0") (builtins.genList (i: i + 1) 9)
    )}

    # Move windows to workspaces
    ${builtins.concatStringsSep "\n" (
      map (n: "bind=SUPER+SHIFT,${toString n},tag,${toString n},0") (builtins.genList (i: i + 1) 9)
    )}

    # Basic controls
    bind=SUPER,Return,spawn,foot
    bind=SUPER,D,spawn,wmenu-run
    bind=SUPER,Q,killclient
    bind=SUPER,F,togglefullscreen
    bind=SUPER,R,reload_config

    # Start bar
    exec_once=waybar
  '';

}

