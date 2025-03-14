{ pkgs, ... }:

{
  # User only packages
  home.packages = with pkgs; [
    cowsay
    bat
  ];
}
