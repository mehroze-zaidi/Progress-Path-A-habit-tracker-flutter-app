import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';


class AppTheme{

  AppTheme._();
  static String fontFamily = "Cairo";
  static final ThemeData light= ThemeData(
    fontFamily:fontFamily ,
  //primarySwatch: Colors.green,
  colorScheme: ColorScheme.fromSeed(
  seedColor: AppColors.primaryColor,
    brightness: Brightness.light,

  ),
  scaffoldBackgroundColor: AppColors.white,

  appBarTheme: const AppBarTheme(),
  useMaterial3: true,
  );


  static final ThemeData dark= ThemeData(
    fontFamily:fontFamily ,
    //primarySwatch: Colors.green,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.dark,

    ),
    scaffoldBackgroundColor: AppColors.black,

    appBarTheme: const AppBarTheme(),
    useMaterial3: true,
  );




}