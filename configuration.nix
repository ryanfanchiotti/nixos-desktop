# Help: configuration.nix(5) man page or nixos-help

{ config, pkgs, ... }:

{
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  imports = [ 
    ./hardware-configuration.nix
    ./programs
    ./kde
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable systemd in initial RAM disk
  boot.initrd.systemd.enable = true;

  # Define your hostname
  networking.hostName = "desktop-nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set time zone
  time.timeZone = "America/New_York";

  # Select internationalisation properties
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

  # Enable the X11 windowing system, can be disabled if only using Wayland
  services.xserver.enable = true;

  # Enable sddm with Wayland
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents
  services.printing = {
    enable = true;
    drivers = [ pkgs.gutenprint pkgs.brlaser ];
  };
  # This avahi config can be necessary to connect to network print servers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # User accounts, set passwords using passwd
  users.users.ryan = {
    isNormalUser = true;
    description = "ryan";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  users.users.sergio = {
    isNormalUser = true;
    description = "sergio";
    extraGroups = [ "networkmanager" "wheel" ];
  };	

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Configure services
  # services.openssh.enable = true;
  services.flatpak.enable = true;

  # Original install version (used for initial file locations etc.), read docs before changing
  system.stateVersion = "24.05";
  
  # Auto update operating system and use newest kernel version
  boot.kernelPackages = pkgs.linuxPackages_latest;
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Auto remove old packages / configs
  nix.settings.auto-optimise-store = true;
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  # Install fonts
  fonts.packages = with pkgs; [
    iosevka
  ];
}
