import 'package:core/core.dart';
import 'package:dependencias/dependencias.dart';
import 'package:gerenciador_veiculos/app/modules/home/home_module.dart';
import 'package:gerenciador_veiculos/app/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r
      ..module('/', module: SplashModule())
      ..module('/home', module: HomeModule());
  }
}
