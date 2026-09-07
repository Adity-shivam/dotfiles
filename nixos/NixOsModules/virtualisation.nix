{ pkgs, ... }:

{
  # Enable Docker (for winboat)
    virtualisation.docker.enable = true;  
    # disable winboat container imperatively as the container was created by winboat not nix. 
    # so it doesn't take resources upon boot
      # virtualisation.oci-containers.containers.WinBoat.autoStart = false; 

###    virtualisation.libvirtd.enable = true;
###    programs.virt-manager.enable = true;
  
}
