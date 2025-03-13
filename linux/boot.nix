{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable systemd in initial RAM disk
  boot.initrd.systemd.enable = true;
}
