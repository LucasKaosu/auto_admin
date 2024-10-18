import 'package:dependencias/dependencias.dart';
import 'package:gerenciador_veiculos/app/modules/home/views/pages/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }
}
