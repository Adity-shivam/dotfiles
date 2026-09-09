{
  programs.zoxide = {
    enable = true;
    flags = [ "--cmd cd" ];
    
    enableZshIntegration = true;
    enableBashIntegration = true;
  };
}
