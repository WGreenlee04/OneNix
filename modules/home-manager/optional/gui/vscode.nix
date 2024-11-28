# Code editor
{ config, lib, pkgs, ... }:

let
  moduleName = "vscode";
  cfg = config.modules.home-manager.${moduleName};
in
{
  options.modules.home-manager.${moduleName} = {
    enable = lib.mkEnableOption moduleName;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ 
      pkgs.alejandra
      pkgs.nixd
    ];
    programs.vscode = {
      enable = true; # code editor
      extensions = [ pkgs.vscode-extensions.jnoortheen.nix-ide ]; # nix editor extension
      userSettings = {
        "editor.formatOnSave" = "true"; # use the nixfmt formatter on save
        "git.autoFetch" = "true"; # fetch git periodically
        "nix.serverPath" = "nixd"; # nix ide lang server
        "nix.enableLanguageServer" = "true"; # enable nix ide lang server
        "nix.formatterPath" = "alejandra"; # format with nix ide
      };
    };
  };
}
