{ config, pkgs, lib, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nik = {
    isNormalUser = true;
    home = "/home/nik";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    openssh.authorizedKeys.keyFiles = [
      (builtins.fetchurl {
        url = "https://github.com/mayniklas.keys";
        sha256 = "sha256:1ynj0bn9cpj80w8kfhdfrhmch8358n0j16rs0q7n1cqjpxxag2ip";
      })
    ];
  };
  nix.allowedUsers = [ "nik" ];
}
