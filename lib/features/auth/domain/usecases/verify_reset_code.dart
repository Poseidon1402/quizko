import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repository/authentication_repository.dart';

abstract class VerifyResetCode {
  Future<Either<Failure, String>> call(String email, String token);
}

class VerifyResetCodeImpl implements VerifyResetCode {
  final AuthenticationRepository repository;

  VerifyResetCodeImpl({required this.repository});

  @override
  Future<Either<Failure, String>> call(String email, String token) {
    return repository.verifyResetCode(email, token);
  }
}