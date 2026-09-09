{
  ### Not needed nh comes with a garbage collector
  # Enable Automatic Garbage-Collection
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
}
