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
        "ext/workspaces"
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

      "ext/workspaces" = {
        format = "{id}";
        format-icons = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "7" = "7";
          "8" = "8";
          "9" = "9";
        };
        on-click = "activate";
        on-click-right = "toggle";
        sort-by-number = true;
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

    # Animations
    animations=1

    # Vertical workspace transitions
    tag_animation_direction=0

    # Animation duration
    animation_duration_tag=350

    # Smooth easing
    animation_curve_tag=0.46,1.0,0.29,1

    # Gestures
    gesture_live=1
    gesture_swipe_distance=300

    # Set all tags (workspaces) to horizontal scrolling
    tag_rule=id:*,layout_name:scroller

    # Four-finger vertical workspace navigation
    gesturebind=none,up,4,viewprev_have_client
    gesturebind=none,down,4,viewnext_have_client

    # Three-finger horizontal window navigation
    # gesturebind=none,left,3,focusdir,left
    # gesturebind=none,right,3,focusdir,right

    # Three-finger horizontal window switching
    gesturebind=none,left,3,focusstack,prev
    gesturebind=none,right,3,focusstack,next


    # Overview
    bind=SUPER,SPACE,toggleoverview

    # Workspace shortcuts
    bind=SUPER,1,view,1,0
    bind=SUPER,2,view,2,0
    bind=SUPER,3,view,3,0
    bind=SUPER,4,view,4,0
    bind=SUPER,5,view,5,0
    bind=SUPER,6,view,6,0
    bind=SUPER,7,view,7,0
    bind=SUPER,8,view,8,0
    bind=SUPER,9,view,9,0

    # Move windows to workspaces
    bind=SUPER+SHIFT,1,tag,1,0
    bind=SUPER+SHIFT,2,tag,2,0
    bind=SUPER+SHIFT,3,tag,3,0
    bind=SUPER+SHIFT,4,tag,4,0
    bind=SUPER+SHIFT,5,tag,5,0
    bind=SUPER+SHIFT,6,tag,6,0
    bind=SUPER+SHIFT,7,tag,7,0
    bind=SUPER+SHIFT,8,tag,8,0
    bind=SUPER+SHIFT,9,tag,9,0



    # Basic controls
    bind=SUPER,Return,spawn,cosmic-term
    bind=SUPER,D,spawn,wmenu-run
    bind=SUPER,Q,killclient
    bind=SUPER,F,togglefullscreen
    bind=SUPER,R,reload_config

    # Start bar
    exec_once=waybar

  '';

}

