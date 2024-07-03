class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}

class BadRequestException extends NetworkException {
  BadRequestException(super.message);
}

class UnauthorizedException extends NetworkException {
  UnauthorizedException(super.message);
}

class ForbiddenException extends NetworkException {
  ForbiddenException(super.message);
}

class NotFoundException extends NetworkException {
  NotFoundException(super.message);
}

class ServerException extends NetworkException {
  ServerException(super.message);
}

class TimeoutException extends NetworkException {
  TimeoutException(super.message);
}

class NoInternetException extends NetworkException {
  NoInternetException(super.message);
}

class UnexpectedException extends NetworkException {
  UnexpectedException(super.message);
}

class ApiErrorException extends NetworkException {
  ApiErrorException(super.message);
}
