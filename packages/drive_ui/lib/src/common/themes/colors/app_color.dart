import 'package:flutter/material.dart';

abstract interface class AppColor {
  Brightness get brightness;
  Color get primary;
  Color get surfaceTint;
  Color get onPrimary;
  Color get primaryContainer;
  Color get onPrimaryContainer;
  Color get secondary;
  Color get onSecondary;
  Color get secondaryContainer;
  Color get onSecondaryContainer;
  Color get tertiary;
  Color get onTertiary;
  Color get tertiaryContainer;
  Color get onTertiaryContainer;
  Color get error;
  Color get onError;
  Color get errorContainer;
  Color get onErrorContainer;
  Color get background;
  Color get onBackground;
  Color get surface;
  Color get onSurface;
  Color get surfaceVariant;
  Color get onSurfaceVariant;
  Color get outline;
  Color get outlineVariant;
  Color get shadow;
  Color get scrim;
  Color get inverseSurface;
  Color get inverseOnSurface;
  Color get inversePrimary;
  Color get primaryFixed;
  Color get onPrimaryFixed;
  Color get primaryFixedDim;
  Color get onPrimaryFixedVariant;
  Color get secondaryFixed;
  Color get onSecondaryFixed;
  Color get secondaryFixedDim;
  Color get onSecondaryFixedVariant;
  Color get tertiaryFixed;
  Color get onTertiaryFixed;
  Color get tertiaryFixedDim;
  Color get onTertiaryFixedVariant;
  Color get surfaceDim;
  Color get surfaceBright;
  Color get surfaceContainerLowest;
  Color get surfaceContainerLow;
  Color get surfaceContainer;
  Color get surfaceContainerHigh;
  Color get surfaceContainerHighest;

  /// Torna uma cor mais clara com base na cor original e em um fator dado.
  ///
  /// Dada uma [originalColor] e um [factor] opcional, este método calcula e
  /// retorna uma nova cor que é mais clara do que a cor original. O fator
  /// determina o grau de clareza, com um valor padrão de 0.7.
  ///
  /// O parâmetro [originalColor] especifica a cor cujos componentes (vermelho,
  /// verde e azul) serão usados para calcular a cor mais clara.
  ///
  /// O parâmetro [factor] ajusta o grau de clareza. É um valor double entre 0 e
  /// 1. Um fator de 0 não produz nenhuma mudança na cor, enquanto um fator de
  /// 1 produz branco. Por padrão, o fator é definido como 0.7, resultando em
  /// uma cor moderadamente mais clara.
  ///
  /// Retorna a nova cor mais clara como um objeto Color.
  static Color makeColorLighter(Color originalColor, {double factor = 0.7}) {
    // Obtém os componentes de cor do originalColor
    var red = originalColor.red;
    var green = originalColor.green;
    var blue = originalColor.blue;

    // Calcula novos componentes de cor mais claros com base no fator
    red = (red + ((255 - red) * factor)).round();
    green = (green + ((255 - green) * factor)).round();
    blue = (blue + ((255 - blue) * factor)).round();

    // Retorna a nova cor mais clara
    return Color.fromARGB(255, red, green, blue);
  }
}
