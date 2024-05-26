import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/user_model.dart';
import '../entity/user_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserEntity>> subscribeUser({required UserModel newUser});
}