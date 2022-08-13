import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
              color: isDarkTheme
                  ? const Color(0xffA2A8C2)
                  : const Color(0xff4C557E)),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color:
                isDarkTheme ? const Color(0xffFFFFFF) : const Color(0xff4C557E),
          )),
      textTheme: TextTheme(
        bodyText2: TextStyle(
          color:
              isDarkTheme ? const Color(0xffFFFFFF) : const Color(0xff4C557E),
        ),
        // subtitle1: TextStyle(color: Colors.pinkAccent),
      ),
      iconTheme: IconThemeData(
        color: isDarkTheme ? const Color(0xffA2A8C2) : const Color(0xff4C557E),
      ),
      scaffoldBackgroundColor:
          //0A1931  // white yellow 0xFFFCF8EC
          isDarkTheme ? const Color(0xff1C223D) : const Color(0xffDDE1EC),
      primaryColor:
          isDarkTheme ? const Color(0xffF9D002) : const Color(0xff0074E9),
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary:
                // isDarkTheme ? const Color(0xFF1a1f3c) : const Color(0xFFE8FDFD),
                isDarkTheme ? const Color(0xff828282) : const Color(0xff777778),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      buttonColor:
          isDarkTheme ? const Color(0xffD5D5D5) : const Color(0xffD5D5D5),
      cardColor:
          isDarkTheme ? const Color(0xff293154) : const Color(0xffFFFFFF),
      canvasColor:
          isDarkTheme ? const Color(0xff212121) : const Color(0xffE5E0E0),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          buttonColor:
              isDarkTheme ? const Color(0xffD5D5D5) : const Color(0xffD5D5D5),
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }
}
