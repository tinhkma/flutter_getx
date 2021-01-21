import 'package:get/get.dart';
import 'package:kma/binding/initial_bindings.dart';
import 'package:kma/pages/views/calendar_view.dart';
import 'package:kma/pages/views/schedule_view.dart';
import 'package:kma/route/app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SCHEDULE;

  static final routes = [
    GetPage(
      transition:
          GetPlatform.isIOS ? Transition.cupertino : Transition.leftToRight,
      name: Routes.SCHEDULE,
      page: () => CalendarView(),
      binding: InitialBindings(),
    ),
  ];
}
