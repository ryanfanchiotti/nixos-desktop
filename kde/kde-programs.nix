{ pkgs, ... }:

{
  # KDE specific packages
  environment.systemPackages = with pkgs.kdePackages; [
    kate
  ];
}
