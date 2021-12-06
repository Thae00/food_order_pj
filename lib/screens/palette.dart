import 'package:flutter/material.dart';

class Palette {
  static MaterialColor bgColor = MaterialColor(
    0xff1D2335, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff9CA7C9), //10%
      100: const Color(0xff8996BE), //20%
      200: const Color(0xff7584B3), //30%
      300: const Color(0xff6173A8), //40%
      400: const Color(0xff536497), //50%
      500: const Color(0xff485784), //60%
      600: const Color(0xff3E4A70), //70%
      700: const Color(0xff333D5C), //80%
      800: const Color(0xff283048), //90%
      900: const Color(0xff1D2335), //100%
    },
  );

  static Color speciColor = Color(0xffFF3B30);
  static Color titleColor = Color(0xffE4E5E9);
  static Color showColor = Color(0xff5F697B);
  static Color boxColor = Color(0xff181C2D);
} // you
