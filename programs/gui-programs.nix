{ pkgs, ... }:

{
  # Programs that have a graphical user interface
  environment.systemPackages = with pkgs; [
    spotify
    vesktop
    zoom-us
  ];
  programs.firefox.enable = true;
}
