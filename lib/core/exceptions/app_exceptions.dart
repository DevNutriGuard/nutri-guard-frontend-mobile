class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => 'AppException: $message';
}

class NetworkException extends AppException {
  NetworkException([String message = "Network error occurred"])
      : super(message);
}

class ValidationException extends AppException {
  ValidationException([String message = "Validation error occurred"])
      : super(message);
}

class NotFoundException extends AppException {
  NotFoundException([String message = "Requested resource not found"])
      : super(message);
}
