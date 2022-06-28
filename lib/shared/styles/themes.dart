import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/shared/styles/colors.dart';

ThemeData light = ThemeData(
  primarySwatch: defaultColor,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.grey,
      statusBarBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: defaultColor,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 20.0),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black)),
  scaffoldBackgroundColor: Colors.white,
  // fontFamily: 'CreteRound',
);

ThemeData dark = ThemeData(
  primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarBrightness: Brightness.light,
    ),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      backgroundColor: HexColor('333739'),
      elevation: 20.0),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white)),
  scaffoldBackgroundColor: HexColor('333739'),
);
