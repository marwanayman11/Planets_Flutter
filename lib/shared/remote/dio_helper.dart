import 'package:dio/dio.dart';
import 'package:planets/shared/remote/endpoints.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {'X-RapidAPI-Key': apiKey, 'X-RapidAPI-Host': apiHost}));
  }

  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query}) async {
    return await dio.get(url, queryParameters: query);
  }
}
