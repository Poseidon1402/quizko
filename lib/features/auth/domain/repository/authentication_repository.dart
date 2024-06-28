import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/user_model.dart';
import '../entity/user_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserEntity>> subscribeUser({required UserModel newUser});
  Future<Either<Failure, UserEntity>> authenticate(String email, String password);
  Future<Either<Failure, String>> forgotPassword(String email);
  Future<Either<Failure, String>> verifyResetCode(String email, String token);
  Future<Either<Failure, String>> resetPassword(String email, String token, String password);
  Future<Either<Failure, bool>> logout();
}