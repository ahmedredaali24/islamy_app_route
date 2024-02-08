import 'package:flutter/material.dart';

class MyTheme {
  /// colors,light-mode,dark mode
  ///#FACC1D
  static Color blackColor = const Color(0xff242424);
  static Color primaryLightColor = const Color(0xffB7935F);
  static Color whiteColor = const Color(0xffF8F8F8);
  static Color primaryDarktColor = const Color(0xff141A2E);
  static Color youllwColor = const Color(0xffFACC1D);

  static ThemeData lightMode = ThemeData(
    buttonTheme: ButtonThemeData(buttonColor: primaryLightColor),
    primaryColor: primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: blackColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true),
    textTheme: TextTheme(
        titleSmall: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w500, color: blackColor),
        titleLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: blackColor)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
    ),
  );
  static ThemeData darkMode = ThemeData(
    buttonTheme: ButtonThemeData(buttonColor: primaryDarktColor),
    primaryColor: primaryDarktColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true),
    textTheme: TextTheme(
        titleSmall: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: whiteColor),
        bodyMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w500, color: whiteColor),
        titleLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: whiteColor)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: youllwColor,
    ),
  );
}
