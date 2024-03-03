import 'package:flutter/material.dart';
import 'package:smart_pay/theme/palette.dart';


extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  Palette? get palette => theme.extension<Palette>();
}
