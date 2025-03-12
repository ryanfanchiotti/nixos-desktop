{ pkgs, ... }:

{
  # Programs simply installed as packages, configuration done manually
  environment.systemPackages = with pkgs; [
    wget
    file
    wineWowPackages.stable
    winetricks
    pkgs.qemu
    quickemu
    clang-tools
    vesktop
    spotify
    fastfetch
    htop-vim
    git
    gh
    unzip
    openssl
    pkg-config
    ripgrep
  ];
  
  # Enable firefox
  programs.firefox.enable = true;
}
