import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social_app/style/color.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('#263238'),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    actionsIconTheme: const IconThemeData(
      color: Colors.white,

    ),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'jannah',
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('#263238'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('#263238'),
    elevation: 0.0,
  ),

  primarySwatch: defaultColor,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'jannah',
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    elevation: 40.0,
    backgroundColor: HexColor('#263238') ,
    unselectedItemColor: Colors.grey,
  ),
  fontFamily: 'jannah',
);


ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'jannah',
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: defaultColor,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor:Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    elevation: 0.0,
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'jannah',

    ),
    subtitle1: TextStyle(
      color: Colors.black,
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'jannah',
      height: 1.2,

    ),
  ),
  primarySwatch: defaultColor,

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor:defaultColor,
    elevation: 40.0,
  ),
  fontFamily: 'jannah',
);