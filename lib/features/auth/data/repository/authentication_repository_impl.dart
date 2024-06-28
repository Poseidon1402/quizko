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
    } on UnauthorizedException {
      return const Left(ServerFailure(message: 'Email or password invalid'));
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
    } on UnauthorizedException {
      return const Left(ServerFailure(message: 'Email or password invalid'));
    } on InternetConnectionException {
      return const Left(NotConnectedFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
