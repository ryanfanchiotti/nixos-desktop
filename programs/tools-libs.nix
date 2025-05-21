{ pkgs, ... }:

{
  # Command line tools and libraries for this system
  environment.systemPackages = with pkgs; [
    wget
    file
    wineWowPackages.stable
    winetricks
    qemu
    quickemu
    clang-tools
    fastfetch
    git
    gh
    unzip
    nil
    openssl
    pkg-config
    ripgrep
    tree
    haskell-language-server
  ];
}
