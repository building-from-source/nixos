{ config, pkgs, lib, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.root = {
    shell = pkgs.zsh;
    openssh.authorizedKeys.keyFiles = [
      (builtins.fetchurl { url = "https://github.com/MayNiklas.keys"; })
      (builtins.fetchurl { url = "https://github.com/building-from-source.keys"; })
    ];
  };
}
