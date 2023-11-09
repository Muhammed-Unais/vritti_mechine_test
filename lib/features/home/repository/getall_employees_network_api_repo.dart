import 'dart:developer';
import 'package:vritti_mechine_test/common/res/app_url.dart';
import 'package:vritti_mechine_test/data/network/base_network_api_service.dart';
import 'package:vritti_mechine_test/features/home/model/employees_model.dart';

class GetAllEmployeesApiRepository {
  final BaseNetworkApiService apiService;

  GetAllEmployeesApiRepository(this.apiService);

  Future<EmployeesModel> getAllEmployees() async {
    try {
      final response = await apiService.getApiResponse(AppUrl.getAllEmployees);
      
      final employeesModel = EmployeesModel.fromMap(response);
      return employeesModel;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
