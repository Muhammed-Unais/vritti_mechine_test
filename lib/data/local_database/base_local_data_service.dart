import 'package:vritti_mechine_test/features/home/model/employee.dart';

abstract interface class BaseLocalDataService {
  Future<int> creatEmployee(Employee employee);
  Future<List<Map<String, dynamic>>> getEmployees();
  Future<List<Map<String, dynamic>>> getEmployee(int id);
  Future<int> updateEmployee(Employee employee);
  Future<void> deleteEmployee(int id);
}
