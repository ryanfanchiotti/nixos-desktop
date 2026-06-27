{ pkgs, ... }:

{
  # Programs that have a graphical user interface
  environment.systemPackages = with pkgs; [
    spotify
    vesktop
    zoom-us
    networkmanagerapplet
    slack
    bluejay
    chromium
  ];
  programs.firefox.enable = true;
}
