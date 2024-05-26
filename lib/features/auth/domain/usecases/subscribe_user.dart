import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/user_model.dart';
import '../entity/user_entity.dart';
import '../repository/authentication_repository.dart';

abstract class SubscribeUser {
  Future<Either<Failure, UserEntity>> call({required UserModel newUser});
}

class SubscribeUserImpl implements SubscribeUser {
  final AuthenticationRepository repository;

  SubscribeUserImpl({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call({required UserModel newUser}) {
    return repository.subscribeUser(newUser: newUser);
  }
}