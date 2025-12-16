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
    libclang
    gdb
    llvmPackages_latest.lldb
    llvmPackages_latest.libllvm
    llvmPackages_latest.libcxx
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
    ghc
    cabal-install
    openconnect
  ];
}
