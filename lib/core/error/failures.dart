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
  const ServerFailure({super.message = 'Une erreur est survenue', super.type = ErrorType.serverError});
}

class NotConnectedFailure extends Failure {
  const NotConnectedFailure({super.message = 'Vous n\'êtes pas connecté à internet', super.type = ErrorType.notConnectedError});
}

class MissingFileFailure extends Failure {
  const MissingFileFailure({super.message = 'Fichier manquant', super.type = ErrorType.missingFileError});
}

class AccessTokenMissingFailure extends Failure {
  const AccessTokenMissingFailure({super.message = 'Token absent', super.type = ErrorType.tokenMissing});
}

class TokenExpiredFailure extends Failure {
  const TokenExpiredFailure({super.message = 'Token expiré', super.type = ErrorType.expiredToken});
}