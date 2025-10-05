{ lib, ... }:

let
  fromHex =
    hex:
    let
      digits = {
        "0" = 0;
        "1" = 1;
        "2" = 2;
        "3" = 3;
        "4" = 4;
        "5" = 5;
        "6" = 6;
        "7" = 7;
        "8" = 8;
        "9" = 9;
        "a" = 10;
        "b" = 11;
        "c" = 12;
        "d" = 13;
        "e" = 14;
        "f" = 15;
        "A" = 10;
        "B" = 11;
        "C" = 12;
        "D" = 13;
        "E" = 14;
        "F" = 15;
      };
      chars = lib.stringToCharacters hex;
    in
    if builtins.length chars == 1 then
      digits.${builtins.elemAt chars 0}
    else if builtins.length chars == 2 then
      digits.${builtins.elemAt chars 0} * 16 + digits.${builtins.elemAt chars 1}
    else
      throw "Invalid hex string: ${hex}";

  toHex =
    n:
    let
      digits = [
        "0"
        "1"
        "2"
        "3"
        "4"
        "5"
        "6"
        "7"
        "8"
        "9"
        "a"
        "b"
        "c"
        "d"
        "e"
        "f"
      ];
      toHexDigit = d: builtins.elemAt digits d;
    in
    if n < 16 then toHexDigit n else toHexDigit (n / 16) + toHexDigit (n - (n / 16) * 16);

  padHex =
    n:
    let
      hex = toHex n;
    in
    if builtins.stringLength hex == 1 then "0${hex}" else hex;
in
{
  inherit fromHex toHex padHex;

  # Adjust brightness of a hex color
  # color: hex color string (with or without # prefix)
  # adjustment: float between -1.0 (darken) and 1.0 (brighten)
  adjustBrightness =
    color: adjustment:
    let
      safeAdjustment =
        if adjustment > 1.0 then
          1.0
        else if adjustment < -1.0 then
          -1.0
        else
          adjustment;

      cleanColor = lib.strings.removePrefix "#" color;

      r = fromHex (builtins.substring 0 2 cleanColor);
      g = fromHex (builtins.substring 2 2 cleanColor);
      b = fromHex (builtins.substring 4 2 cleanColor);

      adjustComponent =
        component:
        if safeAdjustment >= 0 then
          let
            remaining = 255 - component;
          in
          component + builtins.floor (remaining * safeAdjustment)
        else
          component + builtins.floor (component * safeAdjustment);

      newR = lib.trivial.max 0 (lib.trivial.min 255 (adjustComponent r));
      newG = lib.trivial.max 0 (lib.trivial.min 255 (adjustComponent g));
      newB = lib.trivial.max 0 (lib.trivial.min 255 (adjustComponent b));
    in
    "#${padHex newR}${padHex newG}${padHex newB}";
}
