{ config, pkgs, ... }: {
  home.username = "badcop";
  home.homeDirectory = "/home/badcop";
  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 32;
    x11 = {
      enable = true;
      defaultCursor = "Adwaita";
    };
  };

  systemd.user.targets.sway-session = {
    Unit = {
      Description = "sway compositor session";
      Documentation = [ "man:systemd.special(7)" ];
      BindsTo = [ "graphical-session.target" ];
      Wants = [ "graphical-session-pre.target" ];
      After = [ "graphical-session-pre.target" ];
    };
  };

  programs.home-manager.enable = true;
  home.packages = [ 
    pkgs.htop 
    pkgs.fzf 
    pkgs.udiskie
    pkgs.udisks
    pkgs.usbutils
  ];

  home.stateVersion = "25.11"; # Match your NixOS version
}
