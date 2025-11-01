class AppException implements Exception {
  String message;
  String technicalMessage;
  int? statusCode;
  AppException({
    required this.message,
    required this.technicalMessage,
    this.statusCode,
  });
  @override
  String toString() {
    return 'AppException(message: $message, technicalMessage: $technicalMessage, statusCode: $statusCode)';
  }
}

class ServerException extends AppException {
  ServerException({
    required super.message,
    required super.technicalMessage,
    super.statusCode,
  });
}

class CacheException extends AppException {
  CacheException({
    required super.message,
    required super.technicalMessage,
    super.statusCode,
  });
}

class NetworkException extends AppException {
  NetworkException({
    required super.message,
    required super.technicalMessage,
    super.statusCode,
  });
}

class UnknownException extends AppException {
  UnknownException({
    required super.message,
    required super.technicalMessage,
    super.statusCode,
  });
}
