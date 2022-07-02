import 'package:get/get.dart';

class ApiRequestFailure {
  String? failureMsg;
  final int? status;

  ApiRequestFailure({this.failureMsg, this.status,});

  @override
  String toString() {
    return "message: $failureMsg - status: $status";
  }
}
