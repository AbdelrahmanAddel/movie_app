import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exceptions.dart';

class HandleError {
  static AppException handleDioException(DioException dio) {
    switch (dio.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return ServerException(
          message: 'Connection timeout',
          technicalMessage: 'Connection timeout ${dio.type}',
          statusCode: dio.response?.statusCode,
        );
      case DioExceptionType.badCertificate:
        return ServerException(
          message: 'Bad certificate',
          technicalMessage: 'Bad certificate ${dio.type}',
          statusCode: dio.response?.statusCode,
        );
      case DioExceptionType.badResponse:
        return handleBadResponse(dio);
      case DioExceptionType.cancel:
        return ServerException(
          message: 'Request cancelled',
          technicalMessage: 'Request cancelled ${dio.type}',
          statusCode: dio.response?.statusCode,
        );
      case DioExceptionType.unknown:
        return UnknownException(
          message: 'Unknown error',
          technicalMessage: 'Unknown error ${dio.type}',
          statusCode: dio.response?.statusCode,
        );
    }
  }

  static AppException handleBadResponse(DioException dio) {
    final errorMessage = dio.response?.data['message'];
    switch (dio.response?.statusCode) {
      case 400:
        return ServerException(
          message: errorMessage,
          technicalMessage: 'Bad request ${dio.type}',
          statusCode: dio.response?.statusCode,
        );
      case 401:
        return ServerException(
          message: errorMessage,
          technicalMessage: 'Unauthorized ${dio.type}',
          statusCode: dio.response?.statusCode,
        );
      case 403:
        return ServerException(
          message: errorMessage,
          technicalMessage: 'Forbidden ${dio.type}',
          statusCode: dio.response?.statusCode,
        );
      case 404:
        return ServerException(
          message: errorMessage,
          technicalMessage: 'Not found ${dio.type}',
          statusCode: dio.response?.statusCode,
        );
      case 500:
        return ServerException(
          message: errorMessage,
          technicalMessage: 'Internal server error ${dio.type}',
          statusCode: dio.response?.statusCode,
        );
      case 502:
        return ServerException(
          message: errorMessage,
          technicalMessage: 'Bad gateway ${dio.type}',
          statusCode: dio.response?.statusCode,
        );
      case 503:
        return ServerException(
          message: errorMessage,
          technicalMessage: 'Service unavailable ${dio.type}',
          statusCode: dio.response?.statusCode,
        );
      case 504:
        return ServerException(
          message: errorMessage,
          technicalMessage: 'Gateway timeout ${dio.type}',
          statusCode: dio.response?.statusCode,
        );
      default:
        return UnknownException(
          message: errorMessage,
          technicalMessage: 'Something went wrong ${dio.type}',
          statusCode: dio.response?.statusCode,
        );
    }
  }
}
