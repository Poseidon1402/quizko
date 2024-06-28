import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repository/authentication_repository.dart';

abstract class Logout {
  Future<Either<Failure, bool>> call();
}

class LogoutImpl implements Logout {
  final AuthenticationRepository repository;

  LogoutImpl({required this.repository});

  @override
  Future<Either<Failure, bool>> call() {
    return repository.logout();
  }
}