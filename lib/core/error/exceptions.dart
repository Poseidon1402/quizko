class ServerException implements Exception {}

class BadRequestException<T> implements Exception {
  final T message;

  const BadRequestException({required this.message});
}

class ConflictException implements Exception {}

class InternetConnectionException implements Exception {}

class UnauthorizedException implements Exception {}

class InvalidDataException implements Exception {}