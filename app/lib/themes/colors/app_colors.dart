import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xff5f33e0);
  static const lightPrimary = Color(0xffeae4ff);
  static const bottomBarColor = Color(0xffe9e3fe);
  static const bottomIconColor = Color(0xffbfb0f3);
  static const lightBlack = Color(0xff1B1B1B);
  static const backgroundColor = Color(0xff141415);
  static const purple = Color(0xff7e56f4);
  static const rose = Color(0xfff5628e);
  static const blue = Color(0xff33b6ff);
  static const orange = Color(0xfff7b633);
  static const darkOrange = Color(0xffffa83f);
  static const lightGrey = Color(0xfff3f4fc);
  static const white = Color(0xfff8f8ff);
  static const black = Color.fromARGB(255, 11, 11, 17);

  static const primaryGradient = RadialGradient(
    colors: [
      Color(0xff673ce4),
      AppColors.primary,
    ],
    center: Alignment.center,
    stops: [
      0.5,
      1,
    ],
    radius: 1,
  );

  static const whiteGradient = RadialGradient(
    colors: [AppColors.white, AppColors.white],
    center: Alignment.center,
    radius: 1,
  );

  static const lightBlackGradient = RadialGradient(
    colors: [AppColors.lightBlack, AppColors.backgroundColor],
    center: Alignment.center,
    radius: 1,
  );

  static const darkOrangeGradient = RadialGradient(
    colors: [
      Color(0xfffeaf4e),
      AppColors.darkOrange,
    ],
    center: Alignment.center,
    stops: [
      0.8,
      1,
    ],
    radius: 1,
  );

  static const roseGradient = RadialGradient(
    colors: [
      Color(0xfffc81a6),
      AppColors.rose,
    ],
    center: Alignment.center,
    stops: [
      0.1,
      1,
    ],
    radius: 1,
  );

  static const blueGradient = RadialGradient(
    colors: [
      Color(0xff57c2fe),
      AppColors.blue,
    ],
    center: Alignment.center,
    stops: [
      0.1,
      1,
    ],
    radius: 1,
  );

  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  static const purpleGradient = RadialGradient(
    colors: [
      Color(0xff9573fa),
      AppColors.purple,
    ],
    center: Alignment.center,
    stops: [
      0.1,
      1,
    ],
    radius: 1,
  );

  static const orangeGradient = RadialGradient(
    colors: [
      Color(0xfffcb931),
      AppColors.orange,
    ],
    center: Alignment.center,
    stops: [
      0.1,
      1,
    ],
    radius: 1,
  );
}

class AppThemeColor {
  static const color = 0xff5f33e0;

  static const Map<int, Color> colors = {
    50: Color.fromRGBO(144, 8, 235, 0.098),
    100: Color.fromRGBO(144, 8, 235, .2),
    200: Color.fromRGBO(144, 8, 235, .3),
    300: Color.fromRGBO(144, 8, 235, .4),
    400: Color.fromRGBO(144, 8, 235, .5),
    500: Color.fromRGBO(144, 8, 235, .6),
    600: Color.fromRGBO(144, 8, 235, .7),
    700: Color.fromRGBO(144, 8, 235, .8),
    800: Color.fromRGBO(144, 8, 235, .9),
    900: Color.fromRGBO(144, 8, 235, 1),
  };
}
