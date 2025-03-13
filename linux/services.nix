{ pkgs, ... }:

{
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

  # Enable flatpaks to be installed
  services.flatpak.enable = true;
}
