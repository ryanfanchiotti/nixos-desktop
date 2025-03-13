{ pkgs, ... }:

{
  # Install fonts
  fonts.packages = with pkgs; [
    iosevka
  ];
}
