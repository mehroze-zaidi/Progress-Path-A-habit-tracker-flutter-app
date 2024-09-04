import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';


class AppTheme{

  AppTheme._();

  static final ThemeData light= ThemeData(
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
    //primarySwatch: Colors.green,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,

    ),
    scaffoldBackgroundColor: AppColors.white,

    appBarTheme: const AppBarTheme(),
    useMaterial3: true,
  );




}