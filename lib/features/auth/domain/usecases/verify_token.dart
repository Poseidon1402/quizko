import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/user_entity.dart';
import '../repository/authentication_repository.dart';

abstract class VerifyToken {
  Future<Either<Failure, UserEntity>> call();
}

class VerifyTokenImpl implements VerifyToken {
  final AuthenticationRepository repository;

  VerifyTokenImpl({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call() {
    return repository.getCurrentUser();
  }
}