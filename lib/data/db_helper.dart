import 'package:da_assist/model/item_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static String tableName = 'item_table';
  static String querySql =
      'CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, name TEXT, amount INTEGER, value REAL)';
  static String dbName = 'assist_db.db';

  Future<Database> _getDatabase() async {
    final path = join(await getDatabasesPath(), dbName);
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(querySql);
      },
      version: 1,
    );
  }

  Future insert(ItemModel itemModel) async {
    Database db;
    db = await _getDatabase();
    db.insert(
      tableName,
      itemModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future delete(ItemModel itemModel) async {
    Database db;
    db = await _getDatabase();
    db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [itemModel.id],
    );
  }

  Future update(ItemModel itemModel) async {
    Database db;
    db = await _getDatabase();
    db.update(
      tableName,
      itemModel.toMap(),
      where: 'id = ?',
      whereArgs: [itemModel.id],
    );
  }

  Future<ItemModel> readById(int id) async {
    Database db;
    db = await _getDatabase();
    final data = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return ItemModel.fromMap(data[0]);
  }

  Future<List<ItemModel>> readAll() async {
    Database db;
    db = await _getDatabase();
    final data = await db.query(tableName);
    return List.generate(
      data.length,
      (index) => ItemModel.fromMap(
        data[index],
      ),
    );
  }
}
