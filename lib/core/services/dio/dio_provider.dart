import 'package:bookia/core/services/dio/apis.dart';
import 'package:dio/dio.dart';

abstract class DioProvider {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(baseUrl: Apis.baseUrl));
  }
}
