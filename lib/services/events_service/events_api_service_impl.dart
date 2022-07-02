import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:live_events_app/globals/api_constants.dart';
import 'package:live_events_app/models/api_request_failure.dart';
import 'package:live_events_app/models/events_response_model.dart';
 import 'package:dio/dio.dart' as dio ;
import 'package:live_events_app/services/app_services/network_service/abstract_network_service.dart';

import 'abstract_events_api_service.dart';

class EventsApiServiceImpl extends GetxService implements AbstractEventsApiService {

  final networkService = Get.find<AbstractNetworkService>();

  @override
  Future<Either<ApiRequestFailure, EventsResponse>> getEventsPerPage({required int page}) async{
    try {
      final queryParams = {
        "client_id":ApiConstants.clientId,
         "page": "$page",
       };

      dio.Response? response = await networkService.get(
          ApiConstants.baseUrl,
          query: queryParams);
      if (response != null && response.statusCode == 200) {
        // status code for Network
        print(" getEventsPerPage response ${response.data}");
        EventsResponse eventsResponse =
        EventsResponse.fromJson(response.data);
        return right(eventsResponse);
      } else {
        return left(ApiRequestFailure(failureMsg: "networkError"));
      }
    } catch (e) {
      print(e.toString());
      return left(ApiRequestFailure(
          failureMsg: networkService.parseExceptionAndHandle(e)));
    }
  }

  @override
  Future<Either<ApiRequestFailure, EventsResponse>> getSearchedEvents({required int page, required String query}) async{
    try {
      final queryParams = {
        "client_id":ApiConstants.clientId,
        "page": "$page",
        "q":query
      };

      dio.Response? response = await networkService.get(
          ApiConstants.baseUrl,
          query: queryParams);
      if (response != null && response.statusCode == 200) {
        // status code for Network
        print("search getEventsPerPage response ${response.data}");
        EventsResponse eventsResponse =
        EventsResponse.fromJson(response.data);
        return right(eventsResponse);
      } else {
        return left(ApiRequestFailure(failureMsg: "networkError"));
      }
    } catch (e) {
      print(e.toString());
      return left(ApiRequestFailure(
          failureMsg: networkService.parseExceptionAndHandle(e)));
    }
  }

}