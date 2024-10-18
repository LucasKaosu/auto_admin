import 'dart:async';

import 'package:dependencias/dependencias.dart';
import 'package:flutter/material.dart';
import 'package:gerenciador_veiculos/app/app_module.dart';
import 'package:gerenciador_veiculos/app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await runZonedGuarded(
    () async {
      runApp(
        ModularApp(
          module: AppModule(),
          child: AppWidget(),
        ),
      );
    },
    (object, stackTrace) {},
  );
}
