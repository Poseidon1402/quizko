import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repository/authentication_repository.dart';

abstract class ForgotPassword {
  Future<Either<Failure, String>> call(String email);
}

class ForgotPasswordImpl implements ForgotPassword {
  final AuthenticationRepository repository;

  ForgotPasswordImpl({required this.repository});

  @override
  Future<Either<Failure, String>> call(String email) {
    return repository.forgotPassword(email);
  }
}