// database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:gerenciador_veiculos/modelos/veiculo.dart';
import 'package:gerenciador_veiculos/modelos/usuario.dart';
import 'package:gerenciador_veiculos/modelos/despesa.dart';
import 'package:gerenciador_veiculos/modelos/abastecimento.dart';

class DatabaseHelper {
  static final DatabaseHelper _instancia = DatabaseHelper._interno();
  factory DatabaseHelper() => _instancia;

  static Database? _bancoDados;

  DatabaseHelper._interno();

  Future<Database> get bancoDados async {
    if (_bancoDados != null) {
      return _bancoDados!;
    }
    _bancoDados = await _inicializarBancoDados();
    return _bancoDados!;
  }

  Future<Database> _inicializarBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final caminho = join(caminhoBancoDados, 'gerenciador_veiculos.db');

    return await openDatabase(
      caminho,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Criar sessão no banco
  Future<void> _onCreate(Database db, int version) async {
    // Criar tabela de Usuários
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
  }

  //* Funções para classe Usuario
  // Função para inserir um usuário (Create)
  Future<int> inserirUsuario(Usuario usuario) async {
    final db = await bancoDados;
    return await db.insert('usuarios', usuario.toMap());
  }

  // Função para obter todos os usuários (Read)
  Future<List<Usuario>> obterUsuario() async {
    final db = _bancoDados;
    final List<Map<String, dynamic>>? resultado = await db?.query('usuarios');

    if (resultado != null) {
      return List.generate(resultado.length, (i) {
        return Usuario.fromMap(resultado[i]);
      });
    }
    return [];
  }

  // Função para atualizar um usuário (Update)
  Future<int> atualizarUsuario(Usuario usuario) async {
    final db = _bancoDados;
    return await db?.update(
          'usuario',
          usuario.toMap(),
          where: 'id = ?',
          whereArgs: [usuario.id],
        ) ??
        0;
  }

  // Função para deletar um usuário (Delete)
  Future<int> deletarUsuario(int id) async {
    final db = _bancoDados;
    return await db?.delete(
          'usuario',
          where: 'id = ?',
          whereArgs: [id],
        ) ??
        0;
  }

  //* Funções para classe veículo

  // Função para inserir um veículo (Create)
  Future<int> inserirVeiculo(Veiculo veiculo) async {
    final db = await bancoDados;
    return await db.insert('veiculos', veiculo.toMap());
  }

  // Função para obter todos os veículos (Read)
  Future<List<Veiculo>> obterVeiculos() async {
    final db = _bancoDados;
    final List<Map<String, dynamic>>? resultado = await db?.query('veiculos');

    if (resultado != null) {
      return List.generate(resultado.length, (i) {
        return Veiculo.fromMap(resultado[i]);
      });
    }
    return [];
  }

  // Função para atualizar um veículo (Update)
  Future<int> atualizarVeiculo(Veiculo veiculo) async {
    final db = _bancoDados;
    return await db?.update(
          'veiculos',
          veiculo.toMap(),
          where: 'id = ?',
          whereArgs: [veiculo.id],
        ) ??
        0;
  }

  // Função para deletar um veículo (Delete)
  Future<int> deletarVeiculo(int id) async {
    final db = _bancoDados;
    return await db?.delete(
          'veiculos',
          where: 'id = ?',
          whereArgs: [id],
        ) ??
        0;
  }

  //* Funções para classe abastecimento

  // Função para inserir um abastecimento (Create)
  Future<int> inserirAbastecimento(Abastecimento abastecimento) async {
    final db = await bancoDados;
    return await db.insert('abastecimento', abastecimento.toMap());
  }

  // Função para obter todos os abastecimento (Read)
  Future<List<Abastecimento>> obterAbastecimento() async {
    final db = _bancoDados;
    final List<Map<String, dynamic>>? resultado = await db?.query('abastecimento');

    if (resultado != null) {
      return List.generate(resultado.length, (i) {
        return Abastecimento.fromMap(resultado[i]);
      });
    }
    return [];
  }

  // Função para atualizar um abastecimento (Update)
  Future<int> atualizarAbastecimento(Abastecimento abastecimento) async {
    final db = _bancoDados;
    return await db?.update(
          'abastecimento',
          abastecimento.toMap(),
          where: 'id = ?',
          whereArgs: [abastecimento.id],
        ) ??
        0;
  }

  // Função para deletar um abastecimento (Delete)
  Future<int> deletarAbastecimento(int id) async {
    final db = _bancoDados;
    return await db?.delete(
          'abastecimento',
          where: 'id = ?',
          whereArgs: [id],
        ) ??
        0;
  }

  //*Funções para classe despesa

  // Função para inserir um despesa (Create)
  Future<int> inserirDespesa(Despesa despesa) async {
    final db = await bancoDados;
    return await db.insert('despesa', despesa.toMap());
  }

  // Função para obter todos os despesa (Read)
  Future<List<Despesa>> obterDespesa() async {
    final db = _bancoDados;
    final List<Map<String, dynamic>>? resultado = await db?.query('despesa');

    if (resultado != null) {
      return List.generate(resultado.length, (i) {
        return Despesa.fromMap(resultado[i]);
      });
    }
    return [];
  }

  // Função para atualizar um despesa (Update)
  Future<int> atualizarDespesa(Despesa despesa) async {
    final db = _bancoDados;
    return await db?.update(
          'despesa',
          despesa.toMap(),
          where: 'id = ?',
          whereArgs: [despesa.id],
        ) ??
        0;
  }

  // Função para deletar um despesa (Delete)
  Future<int> deletarDespesa(int id) async {
    final db = _bancoDados;
    return await db?.delete(
          'despesa',
          where: 'id = ?',
          whereArgs: [id],
        ) ??
        0;
  }
}
