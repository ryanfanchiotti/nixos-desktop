{ pkgs, ... }:

{
  # Install fonts
  fonts.packages = with pkgs; [
    # this bundles fucking node js???
    # iosevka
    iosevka-bin
    comic-mono
    paratype-pt-mono
    mno16
    hermit
    monaspace
  ];
}
