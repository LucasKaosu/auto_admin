import 'package:drive_ui/src/common/common.dart';
import 'package:drive_ui/src/common/themes/app_bar_theme.dart';
import 'package:drive_ui/src/common/themes/color_scheme.dart';
import 'package:drive_ui/src/common/themes/colors/app_color_dark.dart';
import 'package:drive_ui/src/common/themes/colors/app_color_light.dart';
import 'package:drive_ui/src/common/themes/icon_theme.dart';
import 'package:drive_ui/src/common/themes/input_theme.dart';
import 'package:drive_ui/src/common/themes/text_theme.dart';
import 'package:drive_ui/src/common/themes/tooltip_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() => _getTheme(AppColorLight());

  static ThemeData dark() => _getTheme(AppColorDark());

  static ThemeData _getTheme(AppColor color) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: color.primary,
      scaffoldBackgroundColor: color.background,
      hintColor: color.outline,
      colorScheme: DriveColorScheme.theme(color),
      textTheme: AppTextTheme.theme(color),
      inputDecorationTheme: InputTheme.theme(color),
      iconTheme: DSIconTheme.theme(color),
      appBarTheme: DriveAppBarTheme.theme(color),
      menuButtonTheme: MenuButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStateProperty.all(color.onSurfaceVariant),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStateProperty.all(color.onSurfaceVariant),
        ),
      ),
      tooltipTheme: DriveTooltipTheme.theme(color),
    );
  }
}
