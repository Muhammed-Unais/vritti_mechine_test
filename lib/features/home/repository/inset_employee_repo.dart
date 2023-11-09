import 'package:vritti_mechine_test/data/local_database/base_local_data_service.dart';
import 'package:vritti_mechine_test/features/home/model/employee.dart';

class InserEmployeeRepo {
  final BaseLocalDataService dataService;

  InserEmployeeRepo(this.dataService);

  Future<int> insertEmployee(Employee employee) async {
    try {
      final id = await dataService.creatEmployee(employee);

      return id;
    } catch (e) {
      rethrow;
    }
  }
}
