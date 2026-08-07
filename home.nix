{ config, pkgs, ... }:

{
    home.username = "isaac";
    home.homeDirectory = "/home/isaac";

    programs.git = {
      enable = true;
      userName = "Isaac Blanco";
      userEmail = "nuclearhands2001@gmail.com";
    };
 
    home.stateVersion = "26.05";
    
    programs.bash = {
      enable = true;
      shellAliases = {
        btw = "echo I use nixOS, btw";
      };
    };
    
    programs.ghostty = {
      enable = true;

      settings = {
        theme = "Catppuccin Mocha";
        font-size = 14;
        background-opacity = 0.8;
      };

      enableZshIntegration = true;
    };

    xdg.configFile."niri/config.kdl".source = ./config/niri/config.kdl;
    xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-dotfiles/config/nvim";

    home.packages = with pkgs; [
      nil
      nixpkgs-fmt
      nodejs
      neovim
      gcc
      fzf
      ripgrep
      fd
      lua-language-server
      tree-sitter
      btop
    ];
}
