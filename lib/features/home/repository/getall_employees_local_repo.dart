import 'package:vritti_mechine_test/data/local_database/base_local_data_service.dart';

class GetAllEmployeesLocalRepo {
  final BaseLocalDataService dataService;

  GetAllEmployeesLocalRepo(this.dataService);

  Future<List<Map<String, dynamic>>> getAllEmployeesLocalRepo() async {
    try {
      final response = await dataService.getEmployees();

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
