{ pkgs, lib, ... }:

{
  # Enable gamemode (optimise system on demand)
    programs.gamemode.enable = true;

  # Enable Steam
    programs.steam = {
      enable = true;

      # Microcompositor for steamgames
      gamescopeSession.enable = true;

      extraCompatPackages = [
      	pkgs.proton-ge-bin
      ];    
    };

  # Enable Retroarch 
    services.xserver.desktopManager.retroarch.enable= true;

  # Enable Other launchers 
    environment.systemPackages = with pkgs;[
   
   # launchers  
      heroic
      prismlauncher
      ryubing
      # eden
      lutris         
          
   # gaming utils
      mangohud
    ];

  # Enable NVIDIA drivers (both x11 and wayland)
    services.xserver.videoDriver = [ "nvidia" ];
    hardware.nvidia.modesetting.enable = true;

    hardware.graphics.enable = true;  
    hardware.graphics.enable32Bit = true;

  # Nvidia Optimus Prime for dual graphics
  # uncomment Sync and comment other 2 for Pure dedicated graphics
  # comment Sync and hybrid for Pure offload mode
  # comment sync and uncomment other 2 for 2 boot entry rebuilds 

  # Sync mode (always use dedicated)

    hardware.nvidia.prime = {
      sync.enable = true;
      
    # integrated
    amdgpuBusId = "PCI:6:0:0";

    # dedicated
    nvidiaBusId = "PCI:1:0:0";    

    };

###  # Offload mode (use integerated and offload to dedicated when run with enableoffload cmd)
###  
###    hardware.nvidia.prime = {
###      offload.enable =  true;
###      offload.enableOffloadCmd = true;
###  
###    # integrated
###      amdgpuBusId = "PCI:6:0:0";
###  
###    # dedicated
###      nvidiaBusId = "PCI:1:0:0";    
###    };

###  # Hybrid mode - give 2 boot entries per rebuild 
###    
###    specialisation = {
###      gaming.configuration = {
###        
###        hardware.nvidia = {
###          prime.sync.enable = lib.mkForce true;
###          prime.offload.enable = lib.mkForce false;
###          prime.offload.enableOffloadCmd = lib.mkForce false;
###          
###        };
###      };
###    };
    
}
