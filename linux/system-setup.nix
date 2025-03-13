{ pkgs, ... }:

{
  # Use latest kernel version
  boot.kernelPackages = pkgs.linuxPackages_latest;

  system = {
    # Original install version (used for initial file locations etc.), read docs before changing
    stateVersion = "24.05";

    # Auto update operating system 
    autoUpgrade.enable = true;
    autoUpgrade.allowReboot = true;
  };

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

  networking = {
    # Define hostname
    hostName = "desktop-nixos";

    # Enable networking through network manager
    networkmanager.enable = true;
  };

  # Set time zone
  time.timeZone = "America/New_York";
  
  i18n = {
    # Internationalisation properties
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };
}
