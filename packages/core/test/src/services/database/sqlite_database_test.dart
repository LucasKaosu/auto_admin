import 'package:core/core.dart';
import 'package:core/src/services/database/sqlite_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSQLiteDatabase extends Mock implements SQLiteDatabase {}

void main() {
  late IDatabase db;
  late MockSQLiteDatabase mockDb;

  setUp(() {
    mockDb = MockSQLiteDatabase();
    db = mockDb;
  });

  test('connect', () async {
    when(() => mockDb.connect()).thenAnswer((_) async => null);
    await db.connect();
    verify(() => mockDb.connect()).called(1);
  });

  test('disconnect', () async {
    when(() => mockDb.disconnect()).thenAnswer((_) async => null);
    await db.disconnect();
    verify(() => mockDb.disconnect()).called(1);
  });

  test('insert', () async {
    when(() => mockDb.insert(any(), any())).thenAnswer((_) async => 1);
    var id = await db.insert('usuarios', {
      'nome': 'New User',
      'email': 'new@example.com',
      'user': 'newuser',
      'senha': 'newpassword',
    });
    expect(id, 1);
    verify(() => mockDb.insert(any(), any())).called(1);
  });

  test('update', () async {
    when(() => mockDb.update(any(), any(),
        where: any(named: 'where'),
        whereArgs: any(named: 'whereArgs'))).thenAnswer((_) async => 1);
    var count = await db.update(
      'usuarios',
      {'nome': 'Updated User'},
      where: 'user = ?',
      whereArgs: ['testuser'],
    );
    expect(count, 1);
    verify(() => mockDb.update(any(), any(),
        where: any(named: 'where'),
        whereArgs: any(named: 'whereArgs'))).called(1);
  });

  test('delete', () async {
    when(() => mockDb.delete(any(),
        where: any(named: 'where'),
        whereArgs: any(named: 'whereArgs'))).thenAnswer((_) async => 1);
    var count = await db.delete(
      'usuarios',
      where: 'user = ?',
      whereArgs: ['testuser'],
    );
    expect(count, 1);
    verify(() => mockDb.delete(any(),
        where: any(named: 'where'),
        whereArgs: any(named: 'whereArgs'))).called(1);
  });

  test('query', () async {
    when(() =>
        mockDb.query(any(),
            distinct: any(named: 'distinct'),
            columns: any(named: 'columns'),
            where: any(named: 'where'),
            whereArgs: any(named: 'whereArgs'),
            groupBy: any(named: 'groupBy'),
            having: any(named: 'having'),
            orderBy: any(named: 'orderBy'))).thenAnswer((_) async => [
          {
            'nome': 'Test User',
            'email': 'test@example.com',
            'user': 'testuser',
            'senha': 'password123'
          }
        ]);
    var results = await db.query('usuarios');
    expect(results, isNotEmpty);
    expect(results.first['nome'], 'Test User');
    verify(() => mockDb.query(any(),
        distinct: any(named: 'distinct'),
        columns: any(named: 'columns'),
        where: any(named: 'where'),
        whereArgs: any(named: 'whereArgs'),
        groupBy: any(named: 'groupBy'),
        having: any(named: 'having'),
        orderBy: any(named: 'orderBy'))).called(1);
  });
}
