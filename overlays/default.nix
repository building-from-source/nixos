self: super: {
  # override with newer version from nixpkgs-unstable
  # tautulli = self.unstable.tautulli;

  # override with newer version from nixpkgs-unstable (home-manager related)
  chromium = self.unstable.chromium;
  discord = self.unstable.discord;
  firefox = self.unstable.firefox;
  jetbrains.jdk = self.unstable.jetbrains.jdk;
  jetbrains.clion = self.unstable.jetbrains.clion;
  jetbrains.idea-ultimate = self.unstable.jetbrains.idea-ultimate;
  jetbrains.pycharm-professional = self.unstable.jetbrains.pycharm-professional;
  obs-studio = self.unstable.obs-studio;
  signal-desktop = self.unstable.signal-desktop;
  spotify = self.unstable.spotify;
  sublime-merge = self.unstable.sublime-merge;
  sublime3 = self.unstable.sublime3;
  teamspeak_client = self.unstable.teamspeak_client;
  youtube-dl = self.unstable.youtube-dl;
  zoom-us = self.unstable.zoom-us;
}
