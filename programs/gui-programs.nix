{ pkgs, ... }:

{
  # Programs that have a graphical user interface
  environment.systemPackages = with pkgs; [
    spotify
    vesktop
    zoom-us
    citrix_workspace
  ];
  programs.firefox.enable = true;
}
