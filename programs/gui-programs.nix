{ pkgs, ... }:

{
  # Programs that have a graphical user interface
  environment.systemPackages = with pkgs; [
    spotify
    zoom-us
    discord
    slack
    chromium
  ];
  programs.firefox.enable = true;
}
