import 'package:get/get.dart';
import 'package:kma/controller/initial_controller.dart';
import 'package:kma/repository/schedule_repository.dart';
import 'package:kma/services/api/api.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(API(), permanent: true);
    Get.put(
      ScheduleRepository(
        api: Get.find<API>(),
      ),
    );
    Get.put(
      InitialController(
        scheduleRepository: Get.find<ScheduleRepository>(),
      ),
    );
  }
}
