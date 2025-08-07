{
  boot = {
    # Bootloader settings
    loader = {
      systemd-boot.enable = true;

      # Remove extra configurations
      systemd-boot.configurationLimit = 10;
      efi.canTouchEfiVariables = true;
    };

    # Enable systemd in initial RAM disk
    initrd.systemd.enable = true;
  };
}
