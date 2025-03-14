{ config, ... }:

{
  imports = [
    ./ryan-programs
  ];

  # Username and home
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";

  # Initial state, don't edit
  home.stateVersion = "24.11";

  # Enable home manager
  programs.home-manager.enable = true;
}
