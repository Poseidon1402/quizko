import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/authentication_repository.dart';
import '../models/user_model.dart';
import '../source/authentication_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationSource source;
  final FlutterSecureStorage secureStorage;

  AuthenticationRepositoryImpl({
    required this.source,
    required this.secureStorage,
  });

  @override
  Future<Either<Failure, UserEntity>> subscribeUser({required UserModel newUser}) async {
    try {
      final data = await source.subscribeUser(newUser);
      secureStorage.write(key: 'token', value: data.token);

      return Right(data);
    } on BadRequestException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on InternetConnectionException {
      return const Left(NotConnectedFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
