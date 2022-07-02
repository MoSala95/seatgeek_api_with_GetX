import 'dart:io';

import 'package:get/get.dart' as _get;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:dio/dio.dart';
import 'package:live_events_app/models/api_request_failure.dart';

import 'abstract_network_service.dart';


class NetworkService extends GetxService implements AbstractNetworkService {
  late Dio _dio;


  @override
  // ignore: must_call_super
  void onInit() {
    _dio = Dio(BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
      sendTimeout: 10000,
    ));
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, requestInterceptor) async {
          Map<String, dynamic> option = new Map<String, dynamic>();
          // if (settingsService.accessToken != null)
          //   option['accessToken'] = settingsService.accessToken;
          options.queryParameters.addAll(option);
          return requestInterceptor.next(options);
        },
        onError: (DioError ex, errorInterceptor) {
          print(ex.toString());
          return errorInterceptor.next(ex);
        },

      ),
    );
  }

  @override
  Future<Response?> get(url,
      {headers, query, withCache = false, forceRefresh = false}) async {
    var options = Options();

    if (headers != null) options.headers = headers;
    return await _dio.get(url, queryParameters: query, options: options);
  }


  @override
  Future<Response?> post(url, {body, headers, query}) async {
    return await _dio.post(url,
        data: body,
        queryParameters: query,
        options: Options(headers: headers));
  }


  @override
  String? parseExceptionAndHandle(error) {
    return handleExceptionType(error).failureMsg!;
  }

  @override
  ApiRequestFailure handleExceptionType(error) {
    String? _message;
    int ?_statusCode;
    ApiRequestFailure? _apiRequestFailure;

    if (error is Exception) {
      try {
        if (error is DioError) {
          _statusCode = error.response!.statusCode == null
              ? null
              : error.response!.statusCode;


          switch (error.type) {
            case DioErrorType.cancel:
              break;
            case DioErrorType.connectTimeout:
            //networkExceptions = NetworkExceptions.requestTimeout();
              _message = "somethingWentWrong";
              break;
            case DioErrorType.other:
              _message = "somethingWentWrong";
              break;
            case DioErrorType.receiveTimeout:
              _message = "somethingWentWrong";
              break;
            case DioErrorType.response:
              if (error.response != null && error.response!.data != null) {
                _message = error.response?.data.toString();
              }
              break;

            case DioErrorType.sendTimeout:
              _message = "InternetSlow";
              break;
          }
        } else if (error is SocketException) {
          _message = "networkError";
        } else {
          _message = "somethingWentWrong";
        }
      } on FormatException catch (e) {
        _message = "somethingWentWrong";
      } catch (_) {
        _message = "somethingWentWrong";
      }
    } else {
      _message = "somethingWentWrong";
    }
    return _apiRequestFailure ??
        ApiRequestFailure(status: _statusCode, failureMsg: _message);
  }

}
