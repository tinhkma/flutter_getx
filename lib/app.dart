import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:kma/route/app_pages.dart';
import 'package:kma/shared/log/logger_utils.dart';

import 'binding/initial_bindings.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.full,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      enableLog: true,
      logWriterCallback: Logger.write,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: InitialBindings(),
    );
  }
}
