import 'package:drive_ui/src/common/common.dart';
import 'package:flutter/material.dart';

class DSIconTheme {
  DSIconTheme._();

  static IconThemeData theme(AppColor color) {
    return IconThemeData(
      color: color.onSurfaceVariant,
    );
  }
}
