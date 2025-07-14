{ pkgs, ... }:

{
  # Install fonts
  fonts.packages = with pkgs; [
    iosevka
    comic-mono
    paratype-pt-mono
    mno16
  ];
}
