{ pkgs, ... }:

{
  environment.variables = { EDITOR = "vim"; };

  environment.systemPackages = with pkgs; [
    ((vim_configurable.override {  }).customize{
      name = "vim";

      # Install plugins
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-nix vim-lastplace ];
        opt = [];
      };

      vimrcConfig.customRC = builtins.readFile ./vimrc;
    }
  )];
}
