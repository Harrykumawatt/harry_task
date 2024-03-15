import 'package:harrytask/withdatabase/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Notes.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE Crud(id INTEGER PRIMARY KEY, name TEXT NOT NULL, email TEXT NOT NULL, age TEXT NOT NULL);"),
        version: _version);
  }

  static Future<int> addData(Crud crud) async {
    final db = await _getDB();
    return await db.insert("Crud", crud.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateData(Crud crud) async {
    final db = await _getDB();
    return await db.update("Crud", crud.toJson(),
        where: 'id = ?',
        whereArgs: [crud.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteData(Crud crud) async {
    final db = await _getDB();
    return await db.delete(
      "Crud",
      where: 'id = ?',
      whereArgs: [crud.id],
    );
  }

  static Future<List<Crud>?> getAllData() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Crud");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Crud.fromJson(maps[index]));
  }
}
