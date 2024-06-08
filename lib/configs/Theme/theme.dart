import 'package:flutter/material.dart';
import 'package:rupeetracker/configs/Theme/customtheme/appbar_theme.dart';
import 'package:rupeetracker/configs/Theme/customtheme/bottom_sheet_theme.dart';
import 'package:rupeetracker/configs/Theme/customtheme/checkbox_theme.dart';
import 'package:rupeetracker/configs/Theme/customtheme/chip_theme.dart';
import 'package:rupeetracker/configs/Theme/customtheme/elevented_button_theme.dart';
import 'package:rupeetracker/configs/Theme/customtheme/text_field_theme.dart';
import 'package:rupeetracker/configs/Theme/customtheme/text_theme.dart';

class TAppTheme {
  TAppTheme._();
  // here we create a constructure with private sign that not use again and again

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TEleventedButtonTheme.lightEleventedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TEleventedButtonTheme.darkEleventedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
