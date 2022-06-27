import 'dart:developer';
import 'package:path/path.dart';
import 'package:sokrio/main.dart';
import 'package:sokrio/model/model.dart';
import 'package:sqflite/sqflite.dart';

class CacheDatabase {
  static final CacheDatabase instance = CacheDatabase._init();
  static Database? _database;

  CacheDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('sokrio.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const doubleType = 'DOUBLE NOT NULL';

    try {
      await db.execute('''
    CREATE TABLE $onlineLocationsTable (
      ${CacheLocationsFields.id} $idType,
      ${CacheLocationsFields.latitude} $doubleType,
      ${CacheLocationsFields.longitude} $doubleType,
      ${CacheLocationsFields.altitude} $doubleType,
      ${CacheLocationsFields.timestamp} $textType
    )
    ''');
      await db.execute('''
    CREATE TABLE $offlineLocationsTable (
      ${CacheLocationsFields.id} $idType,
      ${CacheLocationsFields.latitude} $doubleType,
      ${CacheLocationsFields.longitude} $doubleType,
      ${CacheLocationsFields.altitude} $doubleType,
      ${CacheLocationsFields.timestamp} $textType
    )
    ''');
    } catch (_) {
      log('creating table failed: $_');
    }
  }

  Future addLocation({
    required CacheLocation cacheLocation,
    required String tableName,
  }) async {
    final db = await instance.database;
    final dataSet = await db.query(tableName,
        columns: CacheLocationsFields.cacheLocationsFieldsValues,
        where: 'id = ?',
        whereArgs: [cacheLocation.id ?? 0]);
    if (dataSet.isEmpty) {
      final feedback = await db.insert(tableName, cacheLocation.toJson());
      dPrint('[CacheDatabase] [$tableName]: added ${cacheLocation.timestamp}: $feedback');
    }
  }

  Future<List<CacheLocation>> getAllLocation({
    required String tableName,
  }) async {
    final db = await instance.database;
    final List<CacheLocation> cacheLocations = [];

    final dataSet = await db.query(
      tableName,
      columns: CacheLocationsFields.cacheLocationsFieldsValues,
    );
    if (dataSet.isNotEmpty) {
      for (var data in dataSet) {
        cacheLocations.add(CacheLocation.fromJson(data));
      }
    }
    return Future.value(cacheLocations);
  }

  Future deleteAllLocation({required String tableName}) async {
    final db = await instance.database;
    final feedback = await db.delete(tableName);
    dPrint('[CacheDatabase] [$tableName] all deleted: $feedback');
  }

  Future deleteLocation({
    required CacheLocation cacheLocation,
    required String tableName,
  }) async {
    final db = await instance.database;
    final feedback = await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [cacheLocation.id ?? 0],
    );
    dPrint('[CacheDatabase] [$tableName]: deleted ${cacheLocation.id}: $feedback');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
