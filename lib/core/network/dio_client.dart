import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }
}
