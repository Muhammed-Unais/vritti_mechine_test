import 'package:flutter/material.dart';
import 'package:vritti_mechine_test/common/utils/utils.dart';
import 'package:vritti_mechine_test/data/app_response/response.dart';
import 'package:vritti_mechine_test/data/local_database/local_data_service.dart';
import 'package:vritti_mechine_test/data/network/network_api_sevice.dart';
import 'package:vritti_mechine_test/features/home/model/employee.dart';
import 'package:vritti_mechine_test/features/home/repository/delete_employee_repo.dart';
import 'package:vritti_mechine_test/features/home/repository/getall_employees_local_repo.dart';
import 'package:vritti_mechine_test/features/home/repository/getall_employees_network_api_repo.dart';
import 'package:vritti_mechine_test/features/home/repository/inset_employee_repo.dart';
import 'package:vritti_mechine_test/features/home/repository/update_employee_repo.dart';

class HomeViewModel with ChangeNotifier {
  final _getEmployeeNetworkApiRepo =
      GetAllEmployeesApiRepository(NetWorkApiService());

  final _insertEmployeeRepo = InserEmployeeRepo(LocalDataService());

  final _getEmployeeLocalRepo = GetAllEmployeesLocalRepo(LocalDataService());

  final _deleteEmployeeLocalRepo = DeleteEmployeeRepository(LocalDataService());

  final _upDateEmployeeLocalRepo = UpdateEmployeeRepository(LocalDataService());

  AppResponse<List<Employee>> getAllEmployeesResponse = AppResponse.loading();

  TextEditingController firstnameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TabController? tabController;

  TickerProvider? tickerProvider;

  int count = 0;

  bool isUpdate = false;

  Future<void> initilize({TickerProvider? vysnc}) async {
    tickerProvider ??= vysnc;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await refresh();
      int length = count;
      vysnc ??= tickerProvider;
      tabController = TabController(length: length, vsync: vysnc!);
    });
  }

  void setIsUpdate(bool isEdit, [Employee? employee]) {
    isUpdate = isEdit;
    if (isEdit) {
      firstnameController.text = employee?.first_name ?? "";
      lastNameController.text = employee?.last_name ?? "";
      emailController.text = employee?.email ?? "";
    } else {
      firstnameController.clear();
      lastNameController.clear();
      emailController.clear();
    }

    notifyListeners();
  }

  void setAllEmployees(AppResponse<List<Employee>> appResponse) {
    getAllEmployeesResponse = appResponse;
    notifyListeners();
  }

  Future<void> getAllEmployees() async {
    await _getEmployeeNetworkApiRepo.getAllEmployees().then((value) async{
      for (var employee in value.employees) {
        await addEmployee(employee);
      }
      await refresh();
    }).onError((error, stackTrace) {
       
    });
  }

  Future addEmployee(Employee employee) async {
    _insertEmployeeRepo
        .insertEmployee(employee)
        .then((value) {})
        .onError((error, stackTrace) {});
  }

  Future<void> refresh() async {
    setAllEmployees(AppResponse.loading());
    await _getEmployeeLocalRepo.getAllEmployeesLocalRepo().then((value) async {
      if (value.isEmpty) {
        getAllEmployees();
      } else {
        final employees = value.map((e) => Employee.fromJson(e)).toList();

        count = employees.length;

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

  Future<void> delete(int id, BuildContext context) async {
    _deleteEmployeeLocalRepo.deleteEmployee(id).then((value) async {
      Navigator.pop(context);
      await initilize();
    }).onError((error, stackTrace) {});
  }

  Future<void> update(
      {required String firstName,
      required String lastName,
      required String email,
      required Employee employee,
      required BuildContext contex}) async {
    final newEmployee = employee.copyWith(
        first_name: firstName, last_name: lastName, email: email);
    _upDateEmployeeLocalRepo.updateEmployee(newEmployee).then((value) {
      Utils.showCustomSnackBar(contex, "Successfully updated");
      refresh();
      setIsUpdate(false);
    }).onError((error, stackTrace) {});
  }
}
