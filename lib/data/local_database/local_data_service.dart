import 'package:vritti_mechine_test/data/local_database/base_local_data_service.dart';
import 'package:vritti_mechine_test/data/local_database/db_helper.dart';
import 'package:vritti_mechine_test/features/home/model/employee.dart';
import 'package:sqflite/sqflite.dart' as sql;

class LocalDataService implements BaseLocalDataService {
  @override
  Future<int> creatEmployee(Employee employee) async {
    final db = await DbHelper.db();

    try {
      final id = await db.insert(
        "employees",
        employee.toJson(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
      return id;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getEmployees() async {
    try {
      final db = await DbHelper.db();
      return db.query("employees", orderBy: "id");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getEmployee(int id) async {
    try {
      final db = await DbHelper.db();
      return db.query("employees", where: "id = ?", whereArgs: [id], limit: 1);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> updateEmployee(Employee employee) async {
    try {
      final db = await DbHelper.db();

      final results = await db.update("employees", employee.toJson(),
          where: "id = ?", whereArgs: [employee.id]);
      return results;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteEmployee(int id) async {
    final db = await DbHelper.db();

    try {
      db.delete("employees", where: "id = ?", whereArgs: [id]);
    } catch (e) {
      rethrow;
    }
  }
}
