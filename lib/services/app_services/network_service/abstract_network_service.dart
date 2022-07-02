import 'package:dio/dio.dart';
import 'package:live_events_app/models/api_request_failure.dart';


abstract class AbstractNetworkService {

  String? parseExceptionAndHandle(error);
  ApiRequestFailure handleExceptionType(error);
  Future<Response?> post(url, {body, headers, query});
   Future<Response?> get(url,
      {headers, query});
}
