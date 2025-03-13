# Help: configuration.nix(5) man page or nixos-help

{
  imports = [ 
    ./hardware-configuration.nix
    ./programs
    ./kde
    ./fonts
    ./nix
    ./linux
  ];
}
