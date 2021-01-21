import 'package:get/get.dart';
import 'package:kma/enum/enums.dart';
import 'package:kma/models/schedule_kma.dart';
import 'package:kma/repository/schedule_repository.dart';

class InitialController extends GetxController {
  InitialController({
    this.scheduleRepository,
  });

  Rx<String> errorMessage = Rx<String>('');
  static InitialController to = Get.find();

  final ScheduleRepository scheduleRepository;

  final statusGetSchedule = Status.loading.obs;

  final schedule = Rx<ScheduleKma>();

  @override
  void onInit() async => setUp();

  setUp() async {
    await scheduleRepository.getSchedule(parameter: {
      "username": "AT140147",
      "password": "xuantinhb3",
      "passwordhash": "md5"
    }).then(
      (value) {
        schedule(value);
        statusGetSchedule(Status.success);
      },
      onError: (error) {
        print(
          error.toString(),
        );
        statusGetSchedule(Status.error);
        Get.snackbar(
          "Error get Schedule!",
          error.toString(),
          duration: Duration(seconds: 5),
        );
      },
    );
  }
}
