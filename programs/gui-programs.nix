{ pkgs, ... }:

{
  # Programs that have a graphical user interface
  environment.systemPackages = with pkgs; [
    spotify
    vesktop
    zoom-us
    slack
    chromium
  ];
  programs.firefox.enable = true;
}
