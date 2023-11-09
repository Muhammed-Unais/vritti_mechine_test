import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:vritti_mechine_test/data/app_response/response.dart';
import 'package:vritti_mechine_test/data/local_database/local_data_service.dart';
import 'package:vritti_mechine_test/data/network/network_api_sevice.dart';
import 'package:vritti_mechine_test/features/home/model/employee.dart';
import 'package:vritti_mechine_test/features/home/repository/getall_employees_local_repo.dart';
import 'package:vritti_mechine_test/features/home/repository/getall_employees_network_api_repo.dart';
import 'package:vritti_mechine_test/features/home/repository/inset_employee_repo.dart';

class HomeViewModel with ChangeNotifier {
  final _getEmployeeNetworkApiRepo =
      GetAllEmployeesApiRepository(NetWorkApiService());

  final _insertEmployeeRepo = InserEmployeeRepo(LocalDataService());

  final _getEmployeeLocalRepo = GetAllEmployeesLocalRepo(LocalDataService());

  AppResponse<List<Employee>> getAllEmployeesResponse = AppResponse.loading();

  void setAllEmployees(AppResponse<List<Employee>> appResponse) {
    getAllEmployeesResponse = appResponse;
    notifyListeners();
  }

  Future<void> getAllEmployees() async {
    await _getEmployeeNetworkApiRepo.getAllEmployees().then((value) {
      for (var employee in value.employees) {
        addEmployee(employee);
      }
      refresh();
    }).onError((error, stackTrace) {
      log(error.toString());
    });
  }

  Future addEmployee(Employee employee) async {
    _insertEmployeeRepo.insertEmployee(employee).then((value) {
      log(value.toString());
    }).onError((error, stackTrace) {
      log(error.toString());
    });
  }

  void refresh() async {
    setAllEmployees(AppResponse.loading());
    await _getEmployeeLocalRepo.getAllEmployeesLocalRepo().then((value) {
      if (value.isEmpty) {
        getAllEmployees();
      } else {
        final employees = value.map((e) => Employee.fromJson(e)).toList();

        setAllEmployees(AppResponse.completed(employees));
      }
    }).onError((error, stackTrace) {
      setAllEmployees(
        AppResponse.error(
          error.toString(),
        ),
      );
    });
  }
}
