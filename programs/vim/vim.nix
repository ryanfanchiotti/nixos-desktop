{ pkgs, ... }:

{
  environment.variables = { EDITOR = "vim"; };

  environment.systemPackages = with pkgs; [
    ((vim-full.override {  }).customize{
      name = "vim";

      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [
          vim-nix
          vim-lastplace
          vim-commentary
        ];
        opt = [];
      };

      vimrcConfig.customRC = builtins.readFile ./vimrc;
    }
  )];
}
