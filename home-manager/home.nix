{ config, pkgs, ... }:
let anki-bin = pkgs.callPackage ./packages/anki-bin.nix { };
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "julian";
  home.homeDirectory = "/home/julian";

  # Allow "unfree" licenced packages
  nixpkgs.config = { allowUnfree = true; };

  # Imports
  imports = [
    ./modules/devolopment.nix
    ./modules/chromium.nix
    ./modules/firefox.nix
    ./modules/zsh.nix
  ];

  home.packages = with pkgs; [
    _1password-gui
    anki-bin
    ark
    atom
    calibre
    discord
    filebot
    gradle
    gparted
    htop
    intel-gpu-tools
    libreoffice
    mcomix3
    mpv
    okular
    qolibri
    signal-desktop
    spotify
    sublime-merge
    sublime3
    unrar
    unzip
    vim
    youtube-dl
  ];

  home.sessionVariables = {
    GTK_IM_MODULE = "ibus";
    QT_IM_MODULE = "ibus";
    XMODIFIERS = "@im=ibus";
  };

  programs = {
    git = {
      enable = true;
      userEmail = "51420514+building-from-source@users.noreply.github.com";
      userName = "building-from-source";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
