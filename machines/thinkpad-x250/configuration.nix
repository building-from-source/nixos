# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:

let
  mayniklas = builtins.fetchGit {
    # Updated 2020-05-14
    url = "https://github.com/mayniklas/nixos";
    rev = "d9600cce022f6c91506f0d5e965437482ea16ddb";
  };
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Users
    ../../users/root.nix
    ../../users/julian.nix

    # Modules imported from MayNiklas
    "${mayniklas}/modules/bluetooth"
    "${mayniklas}/modules/grub-luks"
    "${mayniklas}/modules/locale"
    "${mayniklas}/modules/networking"
    "${mayniklas}/modules/openssh"
    "${mayniklas}/modules/options"
    "${mayniklas}/modules/sound"
    "${mayniklas}/modules/kde"
    "${mayniklas}/modules/yubikey"
    "${mayniklas}/modules/zsh"

    # Modules
    ../../modules/nix-common.nix

  ];

  mayniklas = {
    var.mainUser = "julian";
    bluetooth.enable = true;
    grub-luks = {
      enable = true;
      uuid = "2fcb1d42-da4a-472f-b13c-8ef727389806";
    };
    kde.enable = true;
    locale.enable = true;
    networking.enable = true;
    openssh.enable = true;
    sound.enable = true;
    yubikey.enable = true;
    zsh.enable = true;

  };

  networking = { hostName = "thinkpad-x250"; };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ bash-completion git nixfmt wget ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}
