import 'package:kma/config/app_config.dart';
import 'package:kma/models/schedule_kma.dart';
import 'package:kma/services/api/api.dart';

class ScheduleRepository {
  final API _api;

  ScheduleRepository({API api}) : _api = api ?? API();

  init<ScheduleRepository>() async {
    await getSchedule();
    return this;
  }

  Future<ScheduleKma> getSchedule({Map<String, dynamic> parameter}) async {
    try {
      final _response = await _api.get(SCHEDULE_ENDPOINT, parameter: parameter);
      print("TAG_TEST SUCCESS " + ScheduleKma.fromJson(_response).studentId + " " + parameter.toString());
      return ScheduleKma.fromJson(_response);
    } on Exception catch (e) {
      print("TAG_TEST ERROR " + e.toString());
      return Future.error(e.toString());
    }
  }
}
