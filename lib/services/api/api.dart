import 'package:dio/dio.dart';
import 'package:kma/config/app_config.dart';

class API {
  Dio _dio;

  API() {
    _dio = new Dio(
      BaseOptions(
        baseUrl: BASE_URL,
      ),
    );
  }

  Future get(String path, {Map<String, dynamic> parameter}) async {
    try {
      final response = await _dio.get(path, queryParameters: parameter ?? {});

      return response.data;
    } on DioError {
      rethrow;
    }
  }
}
