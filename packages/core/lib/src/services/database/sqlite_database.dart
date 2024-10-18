import 'package:dependencias/dependencias.dart';
import 'i_database.dart';

/// A classe `SQLiteDatabase` implementa a interface `IDatabase` usando o pacote `sqflite`.
///
/// Esta classe fornece métodos para conectar, desconectar e realizar operações CRUD em um banco de dados SQLite.
///
/// Construtor:
/// - [SQLiteDatabase]: Cria uma instância da classe com o nome do banco de dados especificado.
///
/// Métodos:
/// - [connect]: Estabelece uma conexão com o banco de dados SQLite.
/// - [disconnect]: Encerra a conexão com o banco de dados SQLite.
/// - [insert]: Insere um novo registro na tabela especificada.
/// - [update]: Atualiza registros existentes na tabela especificada.
/// - [delete]: Remove registros da tabela especificada.
/// - [query]: Consulta registros na tabela especificada com várias opções de filtragem e ordenação.
class SQLiteDatabase implements IDatabase {
  Database? _db;
  final String _dbName;

  /// Cria uma instância da classe `SQLiteDatabase`.
  ///
  /// [dbName]: O nome do banco de dados SQLite.
  SQLiteDatabase(this._dbName);

  /// Estabelece uma conexão com o banco de dados SQLite.
  ///
  /// Este método abre o banco de dados especificado e cria as tabelas iniciais, se necessário.
  ///
  /// Retorna um [Future] que resolve quando a conexão é estabelecida.
  @override
  Future<void> connect() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), _dbName),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS usuarios(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            email TEXT NOT NULL,
            user TEXT NOT NULL,
            senha TEXT NOT NULL
          )
        ''');

        // Criar tabela de Veículos
        await db.execute('''
          CREATE TABLE IF NOT EXISTS veiculos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            marca TEXT NOT NULL,
            modelo TEXT NOT NULL,
            ano INTEGER NOT NULL,
            placa TEXT NOT NULL,
            kmAtual REAL NOT NULL
          )
        ''');

        // Criar tabela de Abastecimentos
        await db.execute('''
          CREATE TABLE IF NOT EXISTS abastecimentos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            data TEXT NOT NULL,
            kmAtual REAL NOT NULL,
            tipoCombustivel TEXT NOT NULL,
            valorCombustivel TEXT NOT NULL,
            litros INTEGER NOT NULL,
            veiculoId INTEGER NOT NULL,
            FOREIGN KEY (veiculoId) REFERENCES veiculos(id) ON DELETE CASCADE
          )
        ''');

        // Criar tabela de Despesas
        await db.execute('''
          CREATE TABLE IF NOT EXISTS despesas (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tipoDespesa TEXT NOT NULL,
            data TEXT NOT NULL,
            descricao TEXT NOT NULL,
            parcela INTEGER NOT NULL,
            veiculoId INTEGER NOT NULL,
            FOREIGN KEY (veiculoId) REFERENCES veiculos(id) ON DELETE CASCADE
          )
        ''');
      },
    );
  }

  /// Encerra a conexão com o banco de dados SQLite.
  ///
  /// Este método fecha a conexão com o banco de dados e define `_db` como `null`.
  ///
  /// Retorna um [Future] que resolve quando a conexão é encerrada.
  @override
  Future<void> disconnect() async {
    await _db?.close();
    _db = null;
  }

  /// Insere um novo registro na tabela especificada.
  ///
  /// [table]: O nome da tabela onde o registro será inserido.
  /// [data]: Um mapa contendo os dados a serem inseridos, onde as chaves são os nomes das colunas
  /// e os valores são os valores a serem inseridos.
  ///
  /// Retorna um [Future] que resolve para o ID do registro inserido.
  @override
  Future<dynamic> insert(String table, Map<String, dynamic> data) async {
    return await _db!.insert(table, data);
  }

  /// Atualiza registros existentes na tabela especificada.
  ///
  /// [table]: O nome da tabela onde os registros serão atualizados.
  /// [data]: Um mapa contendo os dados a serem atualizados, onde as chaves são os nomes das colunas
  /// e os valores são os novos valores.
  /// [where]: Uma cláusula WHERE para especificar quais registros serão atualizados.
  /// [whereArgs]: Uma lista de argumentos para a cláusula WHERE.
  ///
  /// Retorna um [Future] que resolve para o número de registros afetados.
  @override
  Future<dynamic> update(
    String table,
    Map<String, dynamic> data, {
    String? where,
    List<dynamic>? whereArgs,
  }) async {
    return await _db!.update(table, data, where: where, whereArgs: whereArgs);
  }

  /// Remove registros da tabela especificada.
  ///
  /// [table]: O nome da tabela de onde os registros serão removidos.
  /// [where]: Uma cláusula WHERE para especificar quais registros serão removidos.
  /// [whereArgs]: Uma lista de argumentos para a cláusula WHERE.
  ///
  /// Retorna um [Future] que resolve para o número de registros afetados.
  @override
  Future<dynamic> delete(String table,
      {required String? where, List<dynamic>? whereArgs}) async {
    return await _db!.delete(table, where: where, whereArgs: whereArgs);
  }

  /// Consulta registros na tabela especificada com várias opções de filtragem e ordenação.
  ///
  /// [table]: O nome da tabela de onde os registros serão consultados.
  /// [distinct]: Se `true`, retorna apenas registros distintos.
  /// [columns]: Uma lista de colunas a serem retornadas.
  /// [where]: Uma cláusula WHERE para especificar quais registros serão consultados.
  /// [whereArgs]: Uma lista de argumentos para a cláusula WHERE.
  /// [groupBy]: Uma cláusula GROUP BY para agrupar os registros.
  /// [having]: Uma cláusula HAVING para filtrar os grupos.
  /// [orderBy]: Uma cláusula ORDER BY para ordenar os registros.
  ///
  /// Retorna um [Future] que resolve para uma lista de mapas, onde cada mapa representa um registro.
  @override
  Future<List<Map<String, dynamic>>> query(String table,
      {bool? distinct,
      List<String>? columns,
      String? where,
      List<Object?>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy}) async {
    return await _db!.query(
      table,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
    );
  }
}
