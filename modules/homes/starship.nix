# Cross shell prompt
{ ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
    };
  };
}
