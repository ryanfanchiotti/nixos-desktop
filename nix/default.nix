{
  nix = {
    # Enable flakes (needed for flake based setup!)
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    # Remove old packages automatically
    settings.auto-optimise-store = true;
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
