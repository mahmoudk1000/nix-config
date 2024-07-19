{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    commandLineArgs = [
      "--enable-features=VaapiVideoDecodeLinuxGL,VaapiVideoDecoder,VaapiVideoEncoder"
      "--disable-features=UseChromeOSDirectVideoDecoder"
    ];
    dictionaries = [ pkgs.hunspellDictsChromium.en_US ];
    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; }
      { id = "gcbommkclmclpchllfjekcdonpmejbdp"; }
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; }
      { id = "hdokiejnpimakedhajhdlcegeplioahd"; }
    ];
  };
}
