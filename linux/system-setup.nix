{ pkgs, ... }:

{
  # Original install version (used for initial file locations etc.), read docs before changing
  system.stateVersion = "24.05";

  # Auto update operating system and use newest kernel version
  boot.kernelPackages = pkgs.linuxPackages_latest;
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # User accounts, set passwords using passwd
  users.users = {
    ryan = {
      isNormalUser = true;
      description = "ryan";
      extraGroups = [ "networkmanager" "wheel" ];
    };
    sergio = {
      isNormalUser = true;
      description = "sergio";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  # Define hostname
  networking.hostName = "desktop-nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set time zone
  time.timeZone = "America/New_York";

  # Internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
}
