{ pkgs, lib, ... }:

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in

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
  services.xserver.desktopManager.retroarch.enable = true;

  # Allow Proprietary drivers
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true; # Enable Other launchers
  environment.systemPackages = with pkgs; [

    # launchers
    heroic
    prismlauncher
    ryubing
    # eden
    lutris

    # gaming utils
    mangohud

    # install legacy drivers and offload cmd for legacy gpu
    linuxKernel.packages.linux_6_1.nvidia_x11_legacy390
    nvidia-offload
  ];

  # Enable NVIDIA drivers (both x11 and wayland)
  services.xserver.videoDriver = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
  };
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  # Nvidia Optimus Prime for dual graphics
  # uncomment Sync and comment other 2 for Pure dedicated graphics
  # comment Sync and hybrid for Pure offload mode
  # comment sync and uncomment other 2 for 2 boot entry rebuilds

  # Sync mode (always use dedicated)

  ###  hardware.nvidia.prime = {
  ###    sync.enable = true;
  ###
  ###    # integrated
  ###    amdgpuBusId = "PCI:6:0:0";
  ###
  ###    # dedicated
  ###    nvidiaBusId = "PCI:1:0:0";
  ###
  ###  };

  # Offload mode (use integerated and offload to dedicated when run with enableoffload cmd)

  hardware.nvidia.prime = {
    offload.enable = true;
    # Use script offload cmd, since this option doesnt work with old gpus
    offload.enableOffloadCmd = false;

    # integrated
    amdgpuBusId = "PCI:6:0:0";

    # dedicated
    nvidiaBusId = "PCI:1:0:0";
  };

  # Hybrid mode - give 2 boot entries per rebuild

  ###  specialisation = {
  ###    gaming.configuration = {
  ###
  ###      hardware.nvidia = {
  ###        prime.sync.enable = lib.mkForce true;
  ###        prime.offload.enable = lib.mkForce false;
  ###        prime.offload.enableOffloadCmd = lib.mkForce false;
  ###
  ###      };
  ###    };
  ###  };

}

