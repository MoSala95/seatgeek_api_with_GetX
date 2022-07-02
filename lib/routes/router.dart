import 'package:get/get.dart';
import 'package:live_events_app/modules/event_details/event_details_screen.dart';
import 'package:live_events_app/modules/main_events/main_events_screen.dart';
import 'package:live_events_app/routes/bindings.dart';
import 'package:live_events_app/routes/route_constants.dart';

class AppRouter {
  static final routes = [
  GetPage(
  name: RoutesConstants.mainEventsScreen,
  page: () => const MainEventsScreen(),
  binding: MainEventsBinding(),
  transition: Transition.fade,
  ),

];
}