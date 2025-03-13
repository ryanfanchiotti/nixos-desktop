{
  boot = {
    # Bootloader settings
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Enable systemd in initial RAM disk
    initrd.systemd.enable = true;
  };
}
