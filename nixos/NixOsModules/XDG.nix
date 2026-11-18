{ pkgs, ... }:

{
  xdg.mime = {
    enable = true;

    defaultApplications = {
      # Web browser
      "text/html" = "zen-beta.desktop";
      "application/xhtml+xml" = "zen-beta.desktop";
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";

      # Documents
      "application/pdf" = "org.gnome.Papers.desktop";

      # Video and audio
      "video/mp4" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "audio/mpeg" = "mpv.desktop";
      "audio/flac" = "mpv.desktop";

      # Text and code
      "text/plain" = "nvim.desktop";
      "text/x-c" = "nvim.desktop";
      "text/x-python" = "nvim.desktop";
      "text/x-shellscript" = "nvim.desktop";

      # Terminal
      "application/x-terminal-emulator" = "com.system76.CosmicTerm.desktop";
    };
  };
}

