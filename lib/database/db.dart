import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  DB._();
  static final DB instance = DB._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    return await _initDatabase();
  }

 

  _initDatabase() async {
    return  await openDatabase(join(await getDatabasesPath(), "store.db"), version: 1, onCreate: _onCreate);
  }

  _onCreate(db, version) async {
    await db.execute(_addresses);
  }
   

  String get _addresses => '''
  CREATE TABLE address (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idUser INTEGER,
    street TEXT,
    district TEXT,
    num TEXT,
    city TEXT,
    state TEXT,
    complement TEXT
  );
  ''';
}

