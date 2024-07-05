import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repository/authentication_repository.dart';

abstract class ResetPassword {
  Future<Either<Failure, String>> call(String email, String token, String password);
}

class ResetPasswordImpl implements ResetPassword {
  final AuthenticationRepository repository;

  ResetPasswordImpl({required this.repository});

  @override
  Future<Either<Failure, String>> call(String email, String token, String password) {
    return repository.resetPassword(email, token, password);
  }
}