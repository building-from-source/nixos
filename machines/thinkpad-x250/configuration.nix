# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ self, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Users
    ../../users/root.nix
    ../../users/julian.nix

  ];

  mayniklas = {
    var.mainUser = "julian";
    bluetooth.enable = true;
    docker.enable = true;
    grub-luks = {
      enable = true;
      uuid = "2fcb1d42-da4a-472f-b13c-8ef727389806";
    };
    kde.enable = true;
    locale.enable = true;
    networking.enable = true;
    nix-common.enable = true;
    openssh.enable = true;
    sound.enable = true;
    yubikey.enable = true;
    zsh.enable = true;

  };

  networking = { hostName = "thinkpad-x250"; };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    with self.inputs.nixpkgs.legacyPackages.x86_64-linux; [
      bash-completion
      git
      nixfmt
      wget
    ];

  home-manager.users.julian = { imports = [ ../../home-manager/home.nix ]; };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}
