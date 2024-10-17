import 'package:dependencias/dependencias.dart';
import 'package:gerenciador_veiculos/app/modules/splash/views/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SplashPage());
  }
}
