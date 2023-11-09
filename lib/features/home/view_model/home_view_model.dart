import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:vritti_mechine_test/data/app_response/response.dart';
import 'package:vritti_mechine_test/data/network/network_api_sevice.dart';
import 'package:vritti_mechine_test/features/home/model/students_model.dart';
import 'package:vritti_mechine_test/features/home/repository/getall_students_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _getStudentRepo = GetAllStudentsRepository(NetWorkApiService());

  ApiResponse<StudentsModel> getAllStudentsApi = ApiResponse.loading();

  void setGetAllStudents(ApiResponse<StudentsModel> apiResponse) {
    getAllStudentsApi = apiResponse;
    notifyListeners();
  }

  Future<void> getAllStudents() async {
    setGetAllStudents(ApiResponse.loading());
    _getStudentRepo.getAllStudents().then((value) {
      setGetAllStudents(ApiResponse.completed(value));

      log("success");
      log(value.students[0].toString());
    }).onError((error, stackTrace) {
      setGetAllStudents(ApiResponse.error(error.toString()));

      log(error.toString());
    });
  }
}
