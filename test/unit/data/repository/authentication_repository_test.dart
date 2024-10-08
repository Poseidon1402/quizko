import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quizko/core/error/exceptions.dart';
import 'package:quizko/core/error/failures.dart';
import 'package:quizko/features/account/data/models/class_model.dart';
import 'package:quizko/features/auth/data/models/user_model.dart';
import 'package:quizko/features/auth/data/repository/authentication_repository_impl.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockAuthenticationSource mockAuthenticationSource;
  late MockFlutterSecureStorage mockFlutterSecureStorage;
  late AuthenticationRepositoryImpl authenticationRepositoryImpl;

  setUp(() {
    mockAuthenticationSource = MockAuthenticationSource();
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    authenticationRepositoryImpl = AuthenticationRepositoryImpl(
      source: mockAuthenticationSource,
      secureStorage: mockFlutterSecureStorage,
    );
  });

  const user = UserModel(
    candidateId: 5,
    registrationNumber: "1111",
    fullName: "John Doe",
    email: "johndoe@example.com",
    gender: "masculine",
    phone: "0320011122",
    classEntity: ClassModel(
      id: 1,
      name: 'M1 GB',
    ),
  );

  group('Sign in user with user and password', () {
    test(
        'Should return a valid user entity when a call to data source is sucessfull',
        () async {
      when(
        mockAuthenticationSource.authenticate(
          'johndoe@example.com',
          'password',
        ),
      ).thenAnswer((_) async => user);

      final result = await authenticationRepositoryImpl.authenticate(
        'johndoe@example.com',
        'password',
      );

      expect(result, equals(const Right(user)));
    });

    test('Should return a server failure with a custom message', () async {
      when(
        mockAuthenticationSource.authenticate(
          'johndoe@example.com',
          'password',
        ),
      ).thenThrow(UnauthorizedException());

      final result = await authenticationRepositoryImpl.authenticate(
        'johndoe@example.com',
        'password',
      );

      expect(
        result,
        equals(const Left(ServerFailure(message: 'Email or password invalid'))),
      );
    });
  });

  group('User subscribed successfully', () {
    const newUser = UserModel(
      candidateId: 5,
      registrationNumber: "1111",
      fullName: "John Doe",
      email: "johndoe@example.com",
      gender: "masculine",
      phone: "0320011122",
      password: 'password',
      classEntity: ClassModel(
        id: 1,
        name: 'M1 GB',
      ),
    );

    test(
        'Should return a valid user entity when a call to data source is sucessfull',
        () async {
      when(
        mockAuthenticationSource.subscribeUser(newUser),
      ).thenAnswer((_) async => user);

      final result =
          await authenticationRepositoryImpl.subscribeUser(newUser: newUser);

      expect(result, equals(const Right(user)));
    });

    test('Should return a server failure with a custom message', () async {
      when(
        mockAuthenticationSource.subscribeUser(newUser),
      ).thenThrow(const BadRequestException(message: 'Duplicated user'));

      final result =
          await authenticationRepositoryImpl.subscribeUser(newUser: newUser);

      expect(
        result,
        equals(const Left(ServerFailure(message: 'Duplicated user'))),
      );
    });
  });

  group('Verify token', () {
    test('Should return a valid user', () async {
      when(mockFlutterSecureStorage.read(key: 'token'))
          .thenAnswer((_) async => 'token');
      when(mockAuthenticationSource.verifyToken('token'))
          .thenAnswer((_) async => 'The token is valid');
      when(mockAuthenticationSource.getCurrentUser('token'))
          .thenAnswer((_) async => user);

      final result = await authenticationRepositoryImpl.verifyToken();

      expect(result, equals(const Right(user)));
    });

    test('Should return an access token missing failure', () async {
      when(mockFlutterSecureStorage.read(key: 'token'))
          .thenAnswer((_) async => null);

      final result = await authenticationRepositoryImpl.verifyToken();

      expect(result, equals(const Left(AccessTokenMissingFailure())));
    });

    test('Should return a server failure with custom message', () async {
      when(mockFlutterSecureStorage.read(key: 'token'))
          .thenAnswer((_) async => 'token');
      when(mockAuthenticationSource.verifyToken('token'))
          .thenThrow(UnauthorizedException());

      final result = await authenticationRepositoryImpl.verifyToken();

      expect(
          result, equals(const Left(ServerFailure(message: 'Token invalid'))));
    });
  });

  group('Update user', () {
    const updatedUser = UserModel(
      candidateId: 5,
      registrationNumber: "1111",
      fullName: "John Doe",
      email: "johndoe2@example.com",
      gender: "masculine",
      phone: "0320011122",
      password: 'password',
      classEntity: ClassModel(
        id: 1,
        name: 'M1 GB',
      ),
    );

    test('Should return a valid user', () async {
      when(mockFlutterSecureStorage.read(key: 'token'))
          .thenAnswer((_) async => 'token');
      when(mockAuthenticationSource.updateUser(
        user: updatedUser,
        token: 'token',
      )).thenAnswer((_) async => updatedUser);

      final result = await authenticationRepositoryImpl.updateUser(user: updatedUser);

      expect(result, equals(const Right(updatedUser)));
    });
  });
}
