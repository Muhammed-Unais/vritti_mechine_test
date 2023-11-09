import 'dart:developer';
import 'package:vritti_mechine_test/common/res/app_url.dart';
import 'package:vritti_mechine_test/data/network/base_network_api_service.dart';
import 'package:vritti_mechine_test/features/home/model/students_model.dart';

class GetAllStudentsRepository {
  final BaseNetworkApiService apiService;

  GetAllStudentsRepository(this.apiService);

  Future<StudentsModel> getAllStudents() async {
    try {
      final response = await apiService.getApiResponse(AppUrl.getAllStudents);
      
      final studentsModel = StudentsModel.fromMap(response);
      return studentsModel;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
