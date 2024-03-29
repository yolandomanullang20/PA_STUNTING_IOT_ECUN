import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'stunting100.db');
    print(path);
    return await openDatabase(path,
        version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future<void> _onCreate(Database db, int version) async {
    print("DB CREATED ... ");
    await db.execute('''
      CREATE TABLE mothers (
        id INTEGER PRIMARY KEY,
        namaIbu TEXT
      )
      ''');
    await db.execute('''
      CREATE TABLE children (
        id INTEGER PRIMARY KEY,
        motherId INTEGER,
        name TEXT,
        age INTEGER,
        jenisKelamin TEXT,
        FOREIGN KEY (motherId) REFERENCES mothers(id) ON DELETE CASCADE
      )
      ''');
    await db.execute('''
      CREATE TABLE tb_umur (
        id INTEGER PRIMARY KEY,
        idAnak INTEGER,
        zIndeks REAL,
        ambangAtas REAL,
        ambangBawah REAL,
        status TEXT,
        createdDate DATE,
        FOREIGN KEY (idAnak) REFERENCES children(id) ON DELETE CASCADE
      )
      ''');
    await db.execute('''
      CREATE TABLE bb_umur (
        id INTEGER PRIMARY KEY,
        idAnak INTEGER,
        zIndeks REAL,
        ambangAtas REAL,
        ambangBawah REAL,
        status TEXT,
        createdDate DATE,
        FOREIGN KEY (idAnak) REFERENCES children(id) ON DELETE CASCADE
      )
      ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
      ALTER TABLE mothers ADD COLUMN namaIbu TEXT
    ''');
    }
  }
}
