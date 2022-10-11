import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData themeData() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    fontFamily: 'TsunagiGothic',
    appBarTheme: const AppBarTheme(
      color: Color(0xFF424242),
      elevation: 0,
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 18,
        fontFamily: 'TsunagiGothic',
      ),
      iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Color(0xFF212121)),
      bodyText2: TextStyle(color: Color(0xFF212121)),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

const TextStyle kTitleStyle = TextStyle(
  color: Color(0xFF212121),
  fontSize: 36,
  fontWeight: FontWeight.bold,
);

const TextStyle kMessageStyle = TextStyle(
  color: Color(0xFF212121),
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
