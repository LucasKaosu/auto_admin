import 'dart:ui';

import 'package:dependencias/dependencias.dart';
import 'package:drive_ui/drive_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RP',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.light,
      locale: const Locale('pt'),
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   // SfGlobalLocalizations.delegate,
      // ],
      // builder: Asuka.builder,
      // supportedLocales: const [Locale('pt')],
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.trackpad,
        },
      ),
    );
  }

  void initStatusBar(ThemeMode themeMode) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (themeMode == ThemeMode.light) {
        final themeData = AppTheme.light();
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: themeData.colorScheme.surface,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: themeData.colorScheme.surfaceContainer,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
        );
      } else {
        final themeData = AppTheme.dark();
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: themeData.colorScheme.surface,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: themeData.colorScheme.surfaceContainer,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
        );
      }
    });
  }
}
