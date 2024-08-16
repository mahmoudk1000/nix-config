{ pkgs, ... }:

{
  programs.chromium = {
    enable = false;
    # package = pkgs.ungoogled-chromium;
    commandLineArgs = [
      "--enable-features=VaapiVideoDecodeLinuxGL,VaapiVideoDecoder,VaapiVideoEncoder"
      "--disable-features=UseChromeOSDirectVideoDecoder"
    ];
    dictionaries = with pkgs.hunspellDictsChromium; [
      en_US
      de_DE
    ];
    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; }
      { id = "gcbommkclmclpchllfjekcdonpmejbdp"; }
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; }
      { id = "hdokiejnpimakedhajhdlcegeplioahd"; }
    ];
  };
}
