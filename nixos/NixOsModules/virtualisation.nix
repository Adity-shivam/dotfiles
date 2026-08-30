{
  # Enable Docker (for winboat)
    virtualisation.docker.enable = true;  
    # disable winboat container imperatively as the container was created by winboat not nix
      # virtualisation.oci-containers.containers.WinBoat.autoStart = false; 
}
