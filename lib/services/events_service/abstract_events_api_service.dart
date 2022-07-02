import 'package:dartz/dartz.dart';
import 'package:live_events_app/models/api_request_failure.dart';
import 'package:live_events_app/models/events_response_model.dart';

abstract class AbstractEventsApiService{

  Future<Either<ApiRequestFailure, EventsResponse>> getEventsPerPage({
    required int page,
  });
  Future<Either<ApiRequestFailure, EventsResponse>> getSearchedEvents({
    required int page,
    required String query,
  });
}