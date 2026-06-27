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
          vim-strip-trailing-whitespace
          vim-smt2
          Coqtail
        ];
        opt = [];
      };

      vimrcConfig.customRC = builtins.readFile ./vimrc;
    }
  )];
}
