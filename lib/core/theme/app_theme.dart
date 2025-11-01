import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[200],
      centerTitle: true,
      elevation: 0,
      titleTextStyle: AppTextThemes.lightTextTheme.displayLarge,
    ),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextThemes.lightTextTheme,
    brightness: Brightness.light,
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[800],
      centerTitle: true,
      elevation: 0,
      titleTextStyle: AppTextThemes.darkTextTheme.displayLarge,
    ),
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextThemes.darkTextTheme,
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}

class AppTextThemes {
  static final TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
  static final TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
  
  
}

