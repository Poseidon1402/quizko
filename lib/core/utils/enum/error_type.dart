enum ErrorType { serverError, notConnectedError, expiredToken, tokenMissing, missingFileError }

extension ErrorTypeExtension on ErrorType {
  String get label {
    switch (this) {
      case ErrorType.serverError:
        return 'server_error';
      case ErrorType.expiredToken:
        return 'expired_token';
      default:
        return 'not_connected';
    }
  }
}
