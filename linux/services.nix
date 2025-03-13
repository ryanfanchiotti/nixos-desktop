{ pkgs, ... }:

{
  # RealtimeKit system service, used by PulseAudio and PipeWire
  security.rtkit.enable = true;

  services = {
    # Enable the X11 windowing system, can be disabled if only using Wayland
    xserver.enable = true;

    # Enable sddm with Wayland
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    
    # Configure keymap in X11
    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    # Enable CUPS to print documents
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint pkgs.brlaser ];
    };
    # This avahi config can be necessary to connect to network print servers
    avahi = {
      enable = true;
      nssmdns4 = true;
    };

    # Enable sound with PipeWire 
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    # Enable flatpaks to be installed
    flatpak.enable = true;
  };
}
