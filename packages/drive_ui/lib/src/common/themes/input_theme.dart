import 'package:drive_ui/src/common/common.dart';
import 'package:flutter/material.dart';

class InputTheme {
  InputTheme._();

  static InputDecorationTheme theme(AppColor color) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: color.outline,
        width: 2,
      ),
    );

    return InputDecorationTheme(
      border: border,
      fillColor: color.background,
      filled: true,
      enabledBorder: border,
      iconColor: color.primary,
      prefixIconColor: color.outline,
      suffixIconColor: color.outline,
      focusedBorder: border.copyWith(
        borderSide: border.borderSide.copyWith(color: color.primary),
      ),
      errorBorder: border.copyWith(
        borderSide: border.borderSide.copyWith(color: color.error),
      ),
      focusedErrorBorder: border.copyWith(
        borderSide: border.borderSide.copyWith(color: color.error),
      ),
      disabledBorder: border.copyWith(
        borderSide: border.borderSide.copyWith(color: color.outlineVariant),
      ),
    );
  }
}
