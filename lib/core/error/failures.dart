import 'package:equatable/equatable.dart';

import '../utils/enum/error_type.dart';

abstract class Failure extends Equatable {
  final String message;
  final ErrorType type;

  const Failure({required this.message, required this.type,});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({super.message = 'An error occured', super.type = ErrorType.serverError});
}

class NotConnectedFailure extends Failure {
  const NotConnectedFailure({super.message = 'Please, check your network', super.type = ErrorType.notConnectedError});
}

class MissingFileFailure extends Failure {
  const MissingFileFailure({super.message = 'File is missing', super.type = ErrorType.missingFileError});
}

class AccessTokenMissingFailure extends Failure {
  const AccessTokenMissingFailure({super.message = 'Token is missing', super.type = ErrorType.tokenMissing});
}

class TokenExpiredFailure extends Failure {
  const TokenExpiredFailure({super.message = 'Expired token', super.type = ErrorType.expiredToken});
}

class InvalidPasswordFailure extends Failure {
  const InvalidPasswordFailure({super.message = 'Password invalid', super.type = ErrorType.serverError});
}