import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  DioClient._();
  static late Dio? dio;

  static final Dio instance = getDio();
  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
      dio!.options.connectTimeout = const Duration(seconds: 30);
      dio!.options.receiveTimeout = const Duration(seconds: 30);
      dio!.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer 29184053a6041722076105d03b52dbef',
      };
    }
    return dio!;
  }
}
