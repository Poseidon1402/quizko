import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repository/authentication_repository.dart';

abstract class UpdatePassword {
  Future<Either<Failure, String>> call({
    required String currentPassword,
    required String password,
  });
}

class UpdatePasswordImpl implements UpdatePassword {
  final AuthenticationRepository repository;

  UpdatePasswordImpl({required this.repository});

  @override
  Future<Either<Failure, String>> call({
    required String currentPassword,
    required String password,
  }) {
    return repository.updatePassword(
      currentPassword: currentPassword,
      password: password,
    );
  }
}
