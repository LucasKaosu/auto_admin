import 'package:drive_ui/src/common/themes/colors/app_color.dart';
import 'package:drive_ui/src/common/themes/text_theme.dart';
import 'package:flutter/material.dart';

class DriveTooltipTheme {
  DriveTooltipTheme._();

  static TooltipThemeData theme(AppColor color) {
    return TooltipThemeData(
      textStyle: AppTextTheme.theme(color).bodyMedium,
      decoration: BoxDecoration(
        color: color.brightness == Brightness.light
            ? color.surface
            : color.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.shadow.withOpacity(0.3),
            blurRadius: 5,
          ),
        ],
      ),
    );
  }
}
