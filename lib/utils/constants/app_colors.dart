import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/navigation/app_router.dart';

class AppColors {
  AppColors._();

  static bool isDarkMode() {
    if (rootNavigatorKey.currentState != null) {
      return Theme.of(rootNavigatorKey.currentState!.context).brightness ==
          Brightness.dark;
    } else {
      return true;
    }
  }

  static const primaryColor = Color(0xffAADB6C);
  static const complementaryPrimaryColor = Color(0xffF29E22);
  static const accentColor = Color(0xff006699);
  static final surfaceColor =
      isDarkMode() ? const Color(0xff1e1e1e) : const Color(0xffF0F0F0);

  static final lightSurfaceColor =
      isDarkMode() ? const Color(0xff282828) : const Color(0xfff6f6f6);

  static const surfaceColorSecondary = Color(0xffffe6d2);
  static const errorColor = Color(0xffea0000);
  static const textfieldLightSurfaceColor = Color(0xffffe6d2);
  static const textfieldHintColor = Colors.black26;
  static const greyShadowColor = Color(0xffb7b7b7);
  static const disabledColor = Color(0xffcecdcd);
  static const white = Color(0xFFFFFFFF);
  static final whiteTxtColor =
      isDarkMode() ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF);
  static final blackTxtColor =
      isDarkMode() ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF);

  static final hintLightBlackTxtColor =
  isDarkMode() ? const Color(0xFFC2C2C2) : const Color(0xFFE7E7E7);

  static const white80 = Color(0xCCFFFFFF);
  static const white70 = Color(0xB3FFFFFF);
  static const white60 = Color(0xFFFFFFFF);
  static const white50 = Color(0x80FFFFFF);
  static const white40 = Color(0x66FFFFFF);
  static const white30 = Color(0x4DFFFFFF);
  static const white20 = Color(0x33FFFFFF);
  static const backgroundColor = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const black80 = Color(0xCC000000);
  static const black70 = Color(0xB3000000);
  static const black60 = Color(0x99000000);
  static const black50 = Color(0x80000000);
  static const black40 = Color(0x66000000);
  static const black30 = Color(0x4D000000);
  static const black20 = Color(0x33000000);
  static const appSurfaceColor = Color(0xFFEAEAEA);
  static const dividerColor = Color(0xFFA6A6A6);
  static const successColor = Color(0xFF8DC25D);
  static const transparent = Colors.transparent;
  static final  lightModeSurfaceColor = isDarkMode()  ?const Color(0xFFEEEEEE):const Color(
      0xFF808080);

  // Light theme colors
  static const lightBackground = Color(0xFFF7F7F7);
  static const lightText = Color(0xFF000000);
  static const lightAnswerText = black40;
  static const lightCard = Color(0xFFFFFFFF);
  static const lightIcon = Color(0xFF000000);
  static const lightShadow = Color(0xFFE0E0E0);

  // Dark theme colors
  static const darkBackground = Color(0xFF000000);
  static const darkText = Color(0xFFFFFFFF);
  static const darkAnswerText = white40;
  static const darkCard = Color(0xFF1C1C1E);
  static const darkIcon = Color(0xFFFFFFFF);
  static const lightGrey = Color(0xFFF1F1F1);
  static const darkShadow = white20;
}
