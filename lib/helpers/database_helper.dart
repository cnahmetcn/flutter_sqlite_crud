import 'package:crud/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String dbName = "contactDB.db";
  final String tableContact = "contactTable";
  final String columnId = "id";
  final String columnName = "name";
  final String columnPhone = "phone";
  final String columnAddress = "address";
  final String columnDescription = "description";
  final String columnEmail = "email";

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, newVersion) async {
    await db.execute("create table $tableContact ("
        "$columnId integer primary key autoincrement, "
        "$columnName text,"
        "$columnPhone text,"
        "$columnAddress text,"
        "$columnEmail text,"
        "$columnDescription text"
        ")");
  }

  Future<int> create(Contact contact) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableContact, contact.toJSon());
    return result;
  }

  Future<List> finfAll() async {
    var dbClient = await db;
    var result = await dbClient.query(tableContact, columns: [
      columnAddress,
      columnDescription,
      columnEmail,
      columnId,
      columnName,
      columnPhone
    ]);
    return result.toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableContact, where: '$columnId = ?', whereArgs: [id]);
  }

    Future<int> update(Contact contact) async {
    var dbClient = await db;
    var result = await dbClient.update(tableContact, contact.toJSon(), where: "$columnId=?",whereArgs: [contact.id]);
    return result;
  }
}
