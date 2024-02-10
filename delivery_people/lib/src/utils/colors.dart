import 'package:flutter/animation.dart';

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color orange = Color(0xFFFA641E);
  static const Color black = Color(0xFF333333);
  static const Color gray1 = Color(0xFF4B4B4B);
  static const Color gray2 = Color(0xFF676767);
  static const Color darkGray = Color(0xFF222222);
  static const Color orangeLight = Color(0xFFFF881F);
  static const Color orangeTransparent = Color(0xFFFE671F4D);
  static const Color lightGray = Color(0xFFF0F0F0);
  static const Color blackTransparent = Color(0xFF00000029);
  static const Color gray3 = Color(0xFF9F9F9F);
  static const Color gray4 = Color(0xFF707070);
  static const Color pureBlack = Color(0xFF000000);
  static const Color orangeDark = Color(0xFFFF671F);

  static Color gradientColor(double value) {
    return Color.lerp(orangeLight, orangeDark, value)!;
  }
}