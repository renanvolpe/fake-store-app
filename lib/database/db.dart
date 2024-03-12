import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  DB._();
  static final DB instance = DB._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), "store.db"), version: 1, onCreate: _onCreate);
  }

  _onCreate(db, version) async {
    //update to store values
    await db.execute(_addresses);
    // await db.execute(_carteira);
  }

  String get _addresses => '''
  CREATE TABLE address (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    street TEXT,
    district TEXT,
    num TEXT,
    city TEXT,
    state TEXT,
    complement TEXT
  );
  ''';

  String get _orders => '''
  //TODO  make orders here
  ''';

  String get _carteira => '''
  CREATE TABLE conta (
    sigla TEXT PRIMARY KEY,
    moeda TEXT,
    quantidade TEXT,
  );
  ''';

  String get _historico => '''
  CREATE TABLE conta (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    data_operacao INT
    tipo_operacao TEXT,
    moeda TEXT,
    sigla TEXT,
    valor REAL,
    quantidade TEXT
  );
  ''';
}

//KART
