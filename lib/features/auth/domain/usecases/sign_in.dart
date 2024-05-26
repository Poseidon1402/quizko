import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/user_entity.dart';
import '../repository/authentication_repository.dart';

abstract class SignIn {
  Future<Either<Failure, UserEntity>> call(String email, String password);
}

class SignInImpl implements SignIn {
  final AuthenticationRepository repository;

  SignInImpl({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(String email, String password) {
    return repository.authenticate(email, password);
  }
}