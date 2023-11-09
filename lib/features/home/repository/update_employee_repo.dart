import 'package:vritti_mechine_test/data/local_database/base_local_data_service.dart';
import 'package:vritti_mechine_test/features/home/model/employee.dart';

class UpdateEmployeeRepository {
  final BaseLocalDataService baseLocalDataService;

  UpdateEmployeeRepository(this.baseLocalDataService);

  Future<int> updateEmployee(Employee employeee) async {
    try {
      return await baseLocalDataService.updateEmployee(employeee);
    } catch (e) {
      rethrow;
    }
  }
}
