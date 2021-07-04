# Full example:
# https://tech.ingolf-wagner.de/nixos/krops/

let

  # Basic krops setup
  krops = builtins.fetchGit { url = "https://cgit.krebsco.de/krops/"; };
  lib = import "${krops}/lib";
  pkgs = import "${krops}/pkgs" { };

  source = name:
    lib.evalSource [{

      # Copy over the whole repo. By default nixos-rebuild will use the
      # currents system hostname to lookup the right nixos configuration in
      # `nixosConfigurations` from flake.nix
      machine-config.file = toString ./.;
    }];

  command = targetPath: ''
    nix-shell -p git --run '
      nixos-rebuild switch -v --show-trace --flake ${targetPath}/machine-config || \
        nixos-rebuild switch -v --show-trace --flake ${targetPath}/machine-config
    '
  '';

  # Convenience function to define machines with connection parameters and
  # configuration source
  createHost = name: target:
    pkgs.krops.writeCommand "deploy-${name}" {
      inherit command;
      source = source name;
      target = target;
    };

in rec {

  # Define deployments

  # Run with (e.g.):
  # nix-build ./krops.nix -A all && ./result

  # Individual machines
  thinkpad-x250 = createHost "thinkpad-x250" "root@thinkpad-x250";

  # Groups
  all =
    pkgs.writeScript "deploy-all" (lib.concatStringsSep "\n" [ thinkpad-x250 ]);
}
