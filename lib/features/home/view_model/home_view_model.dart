import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:vritti_mechine_test/data/app_response/response.dart';
import 'package:vritti_mechine_test/data/network/network_api_sevice.dart';
import 'package:vritti_mechine_test/features/home/model/employees_model.dart';
import 'package:vritti_mechine_test/features/home/repository/getall_employees_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _getEmployeeRepo = GetAllEmployeesRepository(NetWorkApiService());

  ApiResponse<EmployeesModel> getAllEmployeesApi = ApiResponse.loading();

  void setGetAllEmployees(ApiResponse<EmployeesModel> apiResponse) {
    getAllEmployeesApi = apiResponse;
    notifyListeners();
  }

  Future<void> getAllEmployees() async {
    setGetAllEmployees(ApiResponse.loading());
    _getEmployeeRepo.getAllEmployees().then((value) {
      setGetAllEmployees(ApiResponse.completed(value));

    }).onError((error, stackTrace) {
      setGetAllEmployees(ApiResponse.error(error.toString()));

      log(error.toString());
    });
  }

  
}
