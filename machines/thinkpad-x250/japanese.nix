{ config, pkgs, ... }: {
  fonts.fonts = with pkgs; [
    carlito
    dejavu_fonts
    ipafont
    kochi-substitute
    source-code-pro
    ttf_bitstream_vera
  ];

  fonts.fontconfig.defaultFonts = {
    monospace = [ "DejaVu Sans Mono" "IPAGothic" ];
    sansSerif = [ "DejaVu Sans" "IPAPGothic" ];
    serif = [ "DejaVu Serif" "IPAPMincho" ];
  };

  ###############################
  ## Input Method Editor (IME) ##
  ###############################

i18n.inputMethod = {
  enabled = "ibus";
  ibus.engines = with pkgs.ibus-engines; [ anthy hangul mozc ];
};

}
