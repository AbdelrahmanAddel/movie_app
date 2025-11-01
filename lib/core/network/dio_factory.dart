import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  DioClient._();
  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      addDioHeaders();
      addInterceptors();

      return dio!;
    }
    return dio!;
  }

  static void addDioHeaders() {
    Duration duration = const Duration(seconds: 30);

    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': '29184053a6041722076105d03b52dbef',
    };
    dio?.options.connectTimeout = duration;
    dio?.options.receiveTimeout = duration;
  }

  static void addInterceptors() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  }
}
