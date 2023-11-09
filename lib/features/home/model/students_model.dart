import 'package:vritti_mechine_test/features/home/model/student.dart';

class StudentsModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Student> students;

  StudentsModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    required this.students,
  });

  factory StudentsModel.fromMap(Map<String, dynamic> json) => StudentsModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        students: json["data"] == null
            ? []
            : List<Student>.from(
                json["data"]!.map(
                  (x) => Student.fromJson(x),
                ),
              ),
      );
}
