import 'package:get/get.dart';
import 'package:live_events_app/modules/main_events/main_events_controller.dart';
import 'package:live_events_app/services/app_services/network_service/abstract_network_service.dart';
import 'package:live_events_app/services/app_services/network_service/network_service.dart';
import 'package:live_events_app/services/events_service/abstract_events_api_service.dart';
import 'package:live_events_app/services/events_service/events_api_service_impl.dart';

class MainEventsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbstractNetworkService>(() => NetworkService());
    Get.lazyPut<AbstractEventsApiService>(() => EventsApiServiceImpl());
    Get.lazyPut(() => MainEventsController(),fenix: true);
    // Get.lazyPut(() => HomeController());
  }
}