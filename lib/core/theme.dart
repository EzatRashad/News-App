import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';

class MyTheme {
  static bool dTheme = false;
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    primaryColor: ColorsManager.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.primaryLight,
       elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
       ),
      iconTheme: IconThemeData(
        color: ColorsManager.white,
      ),
    ),
     
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: ColorsManager.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
         ),
      titleMedium: TextStyle(
          color: ColorsManager.black,
          fontWeight: FontWeight.w700,
          fontSize: 23,
           ),
      titleSmall: TextStyle(
          color: ColorsManager.black,
          fontWeight: FontWeight.w400,
          fontSize: 20,
           ),
    ),
  );
  //-------------------------------------------------------------------------------------------------
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    primaryColor: ColorsManager.primaryLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
 
          color: Color(0Xff9E6F21),
          fontSize: 25,
          fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(
        color: ColorsManager.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: ColorsManager.yellow,
      unselectedItemColor: ColorsManager.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: ColorsManager.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
         ),
      titleMedium: TextStyle(
          color: ColorsManager.white,
          fontWeight: FontWeight.w700,
          fontSize: 23,
         ),
      titleSmall: TextStyle(
          color: ColorsManager.white,
          fontWeight: FontWeight.w400,
          fontSize: 20,
         ),
    ),
  );
}