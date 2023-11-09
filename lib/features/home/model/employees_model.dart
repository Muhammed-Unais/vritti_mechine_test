import 'package:vritti_mechine_test/features/home/model/employee.dart';

class EmployeesModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Employee> employees;

  EmployeesModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    required this.employees,
  });

  factory EmployeesModel.fromMap(Map<String, dynamic> json) => EmployeesModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        employees: json["data"] == null
            ? []
            : List<Employee>.from(
                json["data"]!.map(
                  (x) => Employee.fromJson(x),
                ),
              ),
      );
}
