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

  @override
  Future<Either<Failure, UserEntity>> authenticate(String email, String password) async {
    try {
      final data = await source.authenticate(email, password);
      secureStorage.write(key: 'token', value: data.token);

      return Right(data);
    } on UnauthorizedException {
      return const Left(ServerFailure(message: 'Email or password invalid'));
    } on InternetConnectionException {
      return const Left(NotConnectedFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    try {
      final message = await source.forgotPassword(email);
      return Right(message);
    } on InternetConnectionException {
      return const Left(NotConnectedFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> verifyResetCode(String email, String token) async {
    try {
      final message = await source.verifyResetCode(email, token);
      return Right(message);
    } on InternetConnectionException {
      return const Left(NotConnectedFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword(String email, String token, String password) async {
    try {
      final message = await source.resetPassword(email, token, password);
      return Right(message);
    } on InternetConnectionException {
      return const Left(NotConnectedFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> verifyToken() async {
    try {
      final token = await secureStorage.read(key: 'token');

      if(token != null) {
        await source.verifyToken(token);
        final user = await source.getCurrentUser(token);

        return Right(user);
      } else {
        return const Left(AccessTokenMissingFailure());
      }
    } on UnauthorizedException {
      return const Left(ServerFailure(message: 'Token invalid'));
    } on InternetConnectionException {
      return const Left(NotConnectedFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await source.logout(await secureStorage.read(key: 'token') as String);
      secureStorage.delete(key: 'token');

      return const Right(true);
    } on InternetConnectionException {
      return const Left(NotConnectedFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
