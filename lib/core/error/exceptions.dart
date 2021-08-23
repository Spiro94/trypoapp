class BaseException implements Exception {
  final String message;

  BaseException(this.message);
}

class ServerException extends BaseException {
  ServerException(String message) : super(message);
}

class GenericException extends BaseException {
  GenericException(String message) : super(message);
}
