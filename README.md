# nixos

### Using nix flakes ❅
```bash
# clone repository
git clone git@github.com:building-from-source/nixos.git ~/nixos

# deploy current state of repository
nix-build ~/nixos/krops.nix -A thinkpad-x250 && ./result
```
