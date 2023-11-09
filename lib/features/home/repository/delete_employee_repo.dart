import 'package:vritti_mechine_test/data/local_database/base_local_data_service.dart';

class DeleteEmployeeRepository {
  final BaseLocalDataService baseLocalDataService;

  DeleteEmployeeRepository(this.baseLocalDataService);

  Future<void> deleteEmployee(int id) async {
    try {
      await baseLocalDataService.deleteEmployee(id);
    } catch (e) {
      rethrow;
    }
  }
}