{ pkgs, ... }:

{
  # Programs that have a graphical user interface
  environment.systemPackages = with pkgs; [
    spotify
    vesktop
  ];
  programs.firefox.enable = true;
}
