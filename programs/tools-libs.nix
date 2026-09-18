{ pkgs, ... }:

{
  # Command line tools and libraries for this system
  environment.systemPackages = with pkgs; [
    wget
    file
    qemu
    quickemu
    fastfetch
    git
    gh
    unzip
    nil
    openssl
    pkg-config
    ripgrep
    tree
    openconnect
    wl-clipboard
    quota
  ];
}
