{ pkgs, ... }:

let
  # Using Owl-Maintain fork, which addresses issues printing large graphicals documents.
  #   - https://github.com/pdewacht/brlaser/issues/40
  #   - https://github.com/pdewacht/brlaser/issues/52
  #   - https://github.com/pdewacht/brlaser/issues/95
  brlaser-master = pkgs.brlaser.overrideAttrs (finalAttrs: previousAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "Owl-Maintain";
      repo = "brlaser";
      rev = "bfaf936bf46f7d3a8a993352fbbb9615b4fc532a";
      sha256 = "d5pS75Z7iUaw8qo4U6tqsZR7IJa/PJzJUApz/27elaM=";
    };
    cmakeFlags = (previousAttrs.cmakeFlags or []) ++ [
      "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
    ];
  });
in
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
      drivers =  [
        pkgs.gutenprint
        pkgs.gutenprintBin
        brlaser-master
      ];
    };
    # This avahi config can be necessary to connect to network print servers
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
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
