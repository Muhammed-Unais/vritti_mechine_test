import 'package:sqflite/sqflite.dart' as sql;

class DbHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute(
      "CREATE TABLE employees("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "email STRING,"
      "first_name STRING,"
      "last_name STRING,"
      "avatar STRING)",
    );
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      "vritti",
      version: 1,
      onCreate: (db, version) async {
        await createTable(db);
      },
    );
  }
}
