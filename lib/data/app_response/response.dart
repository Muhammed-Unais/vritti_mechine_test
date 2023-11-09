import 'package:vritti_mechine_test/data/app_response/status.dart';

class AppResponse<T> {
  Status? status;
  T? data;
  String? message;

  AppResponse(this.data, this.message, this.status);

  AppResponse.error(this.message) : status = Status.error;

  AppResponse.completed(this.data) : status = Status.completed;

  AppResponse.loading() : status = Status.loading;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data: $data";
  }

}