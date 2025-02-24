import 'package:drive_ui/src/common/common.dart';
import 'package:flutter/material.dart';

class DriveColorScheme {
  DriveColorScheme._();

  static ColorScheme theme(AppColor color) {
    return ColorScheme(
      brightness: color.brightness,
      primary: color.primary,
      surfaceTint: color.surfaceTint,
      onPrimary: color.onPrimary,
      primaryContainer: color.primaryContainer,
      onPrimaryContainer: color.onPrimaryContainer,
      secondary: color.secondary,
      onSecondary: color.onSecondary,
      secondaryContainer: color.secondaryContainer,
      onSecondaryContainer: color.onSecondaryContainer,
      tertiary: color.tertiary,
      onTertiary: color.onTertiary,
      tertiaryContainer: color.tertiaryContainer,
      onTertiaryContainer: color.onTertiaryContainer,
      error: color.error,
      onError: color.onError,
      errorContainer: color.errorContainer,
      onErrorContainer: color.onErrorContainer,
      // background: color.background,
      // onBackground: color.onBackground,
      surface: color.surface,
      onSurface: color.onSurface,
      // surfaceVariant: color.surfaceVariant,
      onSurfaceVariant: color.onSurfaceVariant,
      outline: color.outline,
      outlineVariant: color.outlineVariant,
      shadow: color.shadow,
      scrim: color.scrim,
      inverseSurface: color.inverseSurface,
      // inverseOnSurface: color.inverseOnSurface,
      inversePrimary: color.inversePrimary,
      primaryFixed: color.primaryFixed,
      onPrimaryFixed: color.onPrimaryFixed,
      primaryFixedDim: color.primaryFixedDim,
      onPrimaryFixedVariant: color.onPrimaryFixedVariant,
      secondaryFixed: color.secondaryFixed,
      onSecondaryFixed: color.onSecondaryFixed,
      secondaryFixedDim: color.secondaryFixedDim,
      onSecondaryFixedVariant: color.onSecondaryFixedVariant,
      tertiaryFixed: color.tertiaryFixed,
      onTertiaryFixed: color.onTertiaryFixed,
      tertiaryFixedDim: color.tertiaryFixedDim,
      onTertiaryFixedVariant: color.onTertiaryFixedVariant,
      surfaceDim: color.surfaceDim,
      surfaceBright: color.surfaceBright,
      surfaceContainerLowest: color.surfaceContainerLowest,
      surfaceContainerLow: color.surfaceContainerLow,
      surfaceContainer: color.surfaceContainer,
      surfaceContainerHigh: color.surfaceContainerHigh,
      surfaceContainerHighest: color.surfaceContainerHighest,
    );
  }
}
