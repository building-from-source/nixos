{ config, pkgs, lib, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.julian = {
    isNormalUser = true;
    home = "/home/julian";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keyFiles =
      [ (builtins.fetchurl { url = "https://github.com/building-from-source.keys"; }) ];
  };
  nix.allowedUsers = [ "julian" ];
}
