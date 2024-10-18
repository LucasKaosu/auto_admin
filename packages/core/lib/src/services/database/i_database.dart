/// A interface `IDatabase` define os métodos essenciais para operações de banco de dados.
///
/// Esta interface fornece uma abstração para diferentes implementações de banco de dados,
/// permitindo que você troque facilmente a implementação do banco de dados sem alterar o código
/// que usa a interface.
///
/// Métodos:
/// - [connect]: Estabelece uma conexão com o banco de dados.
/// - [disconnect]: Encerra a conexão com o banco de dados.
/// - [insert]: Insere um novo registro na tabela especificada.
/// - [update]: Atualiza registros existentes na tabela especificada.
/// - [delete]: Remove registros da tabela especificada.
/// - [query]: Consulta registros na tabela especificada com várias opções de filtragem e ordenação.
abstract class IDatabase {
  /// Estabelece uma conexão com o banco de dados.
  ///
  /// Retorna um [Future] que resolve quando a conexão é estabelecida.
  Future<void> connect();

  /// Encerra a conexão com o banco de dados.
  ///
  /// Retorna um [Future] que resolve quando a conexão é encerrada.
  Future<void> disconnect();

  /// Insere um novo registro na tabela especificada.
  ///
  /// [table]: O nome da tabela onde o registro será inserido.
  /// [data]: Um mapa contendo os dados a serem inseridos, onde as chaves são os nomes das colunas
  /// e os valores são os valores a serem inseridos.
  ///
  /// Retorna um [Future] que resolve para o ID do registro inserido.
  Future<dynamic> insert(String table, Map<String, dynamic> data);

  /// Atualiza registros existentes na tabela especificada.
  ///
  /// [table]: O nome da tabela onde os registros serão atualizados.
  /// [data]: Um mapa contendo os dados a serem atualizados, onde as chaves são os nomes das colunas
  /// e os valores são os novos valores.
  /// [where]: Uma cláusula WHERE para especificar quais registros serão atualizados.
  /// [whereArgs]: Uma lista de argumentos para a cláusula WHERE.
  ///
  /// Retorna um [Future] que resolve para o número de registros afetados.
  Future<dynamic> update(
    String table,
    Map<String, dynamic> data, {
    String? where,
    List<dynamic>? whereArgs,
  });

  /// Remove registros da tabela especificada.
  ///
  /// [table]: O nome da tabela de onde os registros serão removidos.
  /// [where]: Uma cláusula WHERE para especificar quais registros serão removidos.
  /// [whereArgs]: Uma lista de argumentos para a cláusula WHERE.
  ///
  /// Retorna um [Future] que resolve para o número de registros afetados.
  Future<dynamic> delete(
    String table, {
    required String? where,
    List<dynamic>? whereArgs,
  });

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
  Future<List<Map<String, dynamic>>> query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
  });
}
