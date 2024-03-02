import 'package:flutter/material.dart';

@immutable
class Palette extends ThemeExtension<Palette> {
  const Palette(
      {required this.textColor,
      required this.cardBgColor,
      required this.textFieldBgColor,
      required this.bottomSheetBgColor,
      required this.scaffoldBgColor,
      required this.iconColor,
      required this.textFieldBorderColor});

  final Color? textColor, scaffoldBgColor;
  final Color? cardBgColor, textFieldBorderColor;
  final Color? textFieldBgColor, iconColor;
  final Color? bottomSheetBgColor;

  @override
  Palette copyWith({
    Color? textColor,
    Color? cardBgColor,
    Color? textFieldBgColor,
    Color? bottomSheetBgColor,
    Color? scaffoldBgColor,
    Color? textFieldColor,
    Color? iconColor,
  }) {
    return Palette(
      textColor: textColor ?? this.textColor,
      cardBgColor: cardBgColor ?? this.cardBgColor,
      scaffoldBgColor: scaffoldBgColor ?? this.scaffoldBgColor,
      textFieldBgColor: textFieldBgColor ?? this.textFieldBgColor,
      iconColor: iconColor ?? this.iconColor,
      textFieldBorderColor: textFieldBorderColor ?? this.textFieldBorderColor,
      bottomSheetBgColor: bottomSheetBgColor ?? this.bottomSheetBgColor,
    );
  }

  @override
  Palette lerp(Palette? other, double t) {
    if (other is! Palette) {
      return this;
    }
    return Palette(
      textColor: Color.lerp(textColor, other.textColor, t),
      cardBgColor: Color.lerp(cardBgColor, other.cardBgColor, t),
      scaffoldBgColor: Color.lerp(scaffoldBgColor, other.scaffoldBgColor, t),
      textFieldBgColor: Color.lerp(textFieldBgColor, other.textFieldBgColor, t),
      textFieldBorderColor:
          Color.lerp(textFieldBorderColor, other.textFieldBorderColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
      bottomSheetBgColor:
          Color.lerp(bottomSheetBgColor, other.bottomSheetBgColor, t),
    );
  }
}
