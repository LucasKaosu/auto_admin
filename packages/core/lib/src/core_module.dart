import 'package:core/src/services/database/i_database.dart';
import 'package:core/src/services/database/sqlite_database.dart';
import 'package:dependencias/dependencias.dart';

class CoreModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<IDatabase>(() => SQLiteDatabase('gerenciador_veiculos.db'));
  }
}
