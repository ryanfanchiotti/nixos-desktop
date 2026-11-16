{
  boot = {
    # Bootloader settings
    loader = {
      systemd-boot.enable = true;

      # Remove extra configurations
      systemd-boot.configurationLimit = 10;
      efi.canTouchEfiVariables = true;
    };
  };
}
