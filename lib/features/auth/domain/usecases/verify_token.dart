import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repository/authentication_repository.dart';

abstract class VerifyToken {
  Future<Either<Failure, String>> call();
}

class VerifyTokenImpl implements VerifyToken {
  final AuthenticationRepository repository;

  VerifyTokenImpl({required this.repository});

  @override
  Future<Either<Failure, String>> call() {
    return repository.verifyToken();
  }
}