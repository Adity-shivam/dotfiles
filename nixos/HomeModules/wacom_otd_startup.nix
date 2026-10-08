{ pkgs, ... }: {
  # custom systemd services to start otd-daemon on startup
  systemd.user.services.otd-daemon = {
    Unit = {
      Description = "OpenTabletDriver daemon";
    };

    Service = {
      ExecStart = "${pkgs.opentabletdriver}/bin/otd-daemon";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };

}

