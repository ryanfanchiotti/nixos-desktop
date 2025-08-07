{ pkgs, ... }:

{
  # Programs that have a graphical user interface
  environment.systemPackages = with pkgs; [
    spotify
    vesktop
    zoom-us
    networkmanagerapplet
  ];
  programs.firefox.enable = true;
}
