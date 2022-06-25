{ config, pkgs, lib, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.root = {
    shell = pkgs.zsh;
    openssh.authorizedKeys.keyFiles = [
      (builtins.fetchurl {
        url = "https://github.com/MayNiklas.keys";
        sha256 = "sha256:1ynj0bn9cpj80w8kfhdfrhmch8358n0j16rs0q7n1cqjpxxag2ip";
      })
      (builtins.fetchurl {
        url = "https://github.com/building-from-source.keys";
        sha256 = "0z4jhi81ql6kq37gjfdkn192ilpp282ypri1ilhak9696hhs77p9";
      })
    ];
  };
}
