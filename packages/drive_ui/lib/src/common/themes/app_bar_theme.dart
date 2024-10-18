import 'package:drive_ui/src/common/themes/colors/app_color.dart';
import 'package:drive_ui/src/common/themes/text_theme.dart';
import 'package:flutter/material.dart';

class DriveAppBarTheme {
  const DriveAppBarTheme._();

  static AppBarTheme theme(AppColor color) {
    return AppBarTheme(
      titleTextStyle: AppTextTheme.theme(color).titleMedium,
      elevation: 2,
      shadowColor: Colors.black,
      backgroundColor: color.background,
      surfaceTintColor: color.background,
      toolbarHeight: 64,
      iconTheme: IconThemeData(),
    );
  }
}
