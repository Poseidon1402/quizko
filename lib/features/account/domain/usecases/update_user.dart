import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../auth/domain/entity/user_entity.dart';
import '../../../auth/domain/repository/authentication_repository.dart';

abstract class UpdateUser {
  Future<Either<Failure, UserEntity>> call({required UserModel user});
}

class UpdateUserImpl implements UpdateUser {
  final AuthenticationRepository repository;

  UpdateUserImpl({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call({required UserModel user}) {
    return repository.updateUser(user: user);
  }
}
