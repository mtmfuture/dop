import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeSetting {
  static const int lightThemeFontColor = 0xFF002359;
  static const int lightThemePrimaryColorColor = 0xFFFAFCFF;
  static const int lightThemeAccentColorColorColor = 0xFFE3EEFF;
  static ThemeData lightTheme = ThemeData(
    // Define the default brightness and colors.

    brightness: Brightness.dark,
    primaryColor: Color(lightThemePrimaryColorColor),
    accentColor: const Color(lightThemeAccentColorColorColor),
    primaryColorLight: const Color(0xFFFFFFFF),
    appBarTheme: const AppBarTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      shadowColor: Colors.transparent,
      elevation: 0,
      backgroundColor: const Color(lightThemeAccentColorColorColor),
      iconTheme: IconThemeData(
        color: Color(0xFF002359),
        size: 30,
      ),
      centerTitle: true,
      toolbarHeight: 111,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: Color(lightThemeFontColor),
        fontFamily: 'MontserratRegular',
      ),
      headlineLarge: TextStyle(
        fontSize: 60.0,
        fontWeight: FontWeight.w600,
        color: Color(lightThemeFontColor),
        fontFamily: 'MontserratBold',
      ),
      subtitle1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Color(lightThemeFontColor),
        fontFamily: 'MontserratRegular',
      ),
      headline1: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w600,
        color: Color(lightThemeFontColor),
        fontFamily: 'MontserratBold',
      ),
      headline2: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: Color(lightThemeFontColor),
        fontFamily: 'MontserratBold',
      ),
      headline3: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: Color(lightThemeFontColor),
        fontFamily: 'MontserratRegular',
      ),
      headline4: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w300,
        color: Color(0xFF002359),
        fontFamily: 'MontserratRegular',
      ),
      headline5: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: Color(lightThemeFontColor),
        fontFamily: 'MontserratBold',
      ),
    ),
    iconTheme: IconThemeData(color: Color(0xFF002359)),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: Color(0xFF8FAFE0), width: 1.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: Color(0xFF8FAFE0), width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: Color(0xFF002359), width: 1.1),
      ),
      labelStyle: TextStyle(
          color: Color(lightThemeFontColor),
          fontWeight: FontWeight.w300,
          fontSize: 12,
          fontFamily: 'MontserratRegular'),
      filled: true,
      fillColor: Colors.white,
    ),
  );

  static const int darkThemeFontColor = 0xFFFFFFFF;
  static const int darkThemeprimaryColorColor = 0xFF002359;
  static const int darkThemeaccentColorColorColor = 0xFF02327D;
  static ThemeData darkTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: const Color(darkThemeprimaryColorColor),
    accentColor: const Color(darkThemeaccentColorColorColor),
    primaryColorLight: const Color(0xFF02327D),
    appBarTheme: const AppBarTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      shadowColor: Colors.transparent,
      elevation: 0,
      backgroundColor: const Color(darkThemeaccentColorColorColor),
      iconTheme: IconThemeData(
        color: Color(0xFF002359),
        size: 30,
      ),
      centerTitle: true,
      toolbarHeight: 111,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: Color(darkThemeFontColor),
        fontFamily: 'MontserratRegular',
      ),
      headlineLarge: TextStyle(
        fontSize: 60.0,
        fontWeight: FontWeight.w600,
        color: Color(darkThemeFontColor),
        fontFamily: 'MontserratBold',
      ),
      subtitle1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Color(darkThemeFontColor),
        fontFamily: 'MontserratRegular',
      ),
      headline1: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w600,
        color: Color(darkThemeFontColor),
        fontFamily: 'MontserratBold',
      ),
      headline2: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: Color(darkThemeFontColor),
        fontFamily: 'MontserratBold',
      ),
      headline3: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: Color(darkThemeFontColor),
        fontFamily: 'MontserratRegular',
      ),
      headline4: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w300,
        color: Color(darkThemeFontColor),
        fontFamily: 'MontserratRegular',
      ),
      headline5: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: Color(darkThemeFontColor),
        fontFamily: 'MontserratBold',
      ),
    ),
    iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: Color(0xFF02327D), width: 1.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: Color(0xFF02327D), width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(color: Color(0xFF02327D), width: 1.1),
      ),
      labelStyle: TextStyle(
          color: Color(0xFF002359),
          fontWeight: FontWeight.w300,
          fontSize: 12,
          fontFamily: 'MontserratRegular'),
      filled: true,
      fillColor: Colors.white,
    ),
  );
}
