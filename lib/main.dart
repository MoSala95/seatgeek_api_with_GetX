import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_events_app/modules/main_events/main_events_screen.dart';
import 'package:live_events_app/routes/route_constants.dart';
import 'package:live_events_app/routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

      ),
      getPages: AppRouter.routes,
      initialRoute: RoutesConstants.mainEventsScreen,

    );
  }
}
