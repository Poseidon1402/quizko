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
    candidateId: '9ee237c7-1655-46dd-bcae-c055c366b32e',
    registrationNumber: "2244",
    lastName: 'Mirana',
    firstName: 'Seheno',
    email: "student1@gmail.com",
    gender: "MALE",
    phone: "+261340000000",
    token: 'token',
    classEntity: ClassModel(
      id: '5afab7e4-877d-426c-a506-07bf9bcdb8ad',
      group: '',
      level: 'L2',
      category: 'GB',
    ),
  );

  group('Sign in user with user and password', () {
    test(
        'Should return a valid user entity when a call to data source is sucessfull',
        () async {
      when(
        mockAuthenticationSource.authenticate(
          'student1@gmail.com',
          'password',
        ),
      ).thenAnswer((_) async => user);

      final result = await authenticationRepositoryImpl.authenticate(
        'student1@gmail.com',
        'password',
      );

      expect(result, equals(const Right(user)));
    });

    test('Should return a server failure with a custom message', () async {
      when(
        mockAuthenticationSource.authenticate(
          'student1@gmail.com',
          'password',
        ),
      ).thenThrow(UnauthorizedException());

      final result = await authenticationRepositoryImpl.authenticate(
        'student1@gmail.com',
        'password',
      );

      expect(
        result,
        equals(const Left(ServerFailure(message: 'Email or password invalid'))),
      );
    });

    test('Should return a not found failure with a custom message', () async {
      when(
        mockAuthenticationSource.authenticate(
          'student1@gmail.com',
          'password',
        ),
      ).thenThrow(NotFoundException());

      final result = await authenticationRepositoryImpl.authenticate(
        'student1@gmail.com',
        'password',
      );

      expect(
        result,
        equals(
          const Left(
            NotFoundFailure(message: 'User not found ! Check your credentials'),
          ),
        ),
      );
    });
  });

  group('User subscribed successfully', () {
    const newUser = UserModel(
      candidateId: '9ee237c7-1655-46dd-bcae-c055c366b32e',
      registrationNumber: "2244",
      lastName: 'Mirana',
      firstName: 'Seheno',
      email: "student1@gmail.com",
      gender: "MALE",
      phone: "+261340000000",
      classEntity: ClassModel(
        id: '5afab7e4-877d-426c-a506-07bf9bcdb8ad',
        group: '',
        level: 'L2',
        category: 'GB',
      ),
    );

    test(
        'Should return a valid user entity when a call to data source is sucessfull',
        () async {
      when(
        mockAuthenticationSource.subscribeUser(newUser),
      ).thenAnswer((_) async => user);

      final result = await authenticationRepositoryImpl.subscribeUser(
        newUser: newUser,
      );

      expect(result, equals(const Right(user)));
    });

    test('Should return a server failure with a custom message', () async {
      when(
        mockAuthenticationSource.subscribeUser(newUser),
      ).thenThrow(const BadRequestException(
          message: 'The email address already exists.'));

      final result =
          await authenticationRepositoryImpl.subscribeUser(newUser: newUser);

      expect(
        result,
        equals(const Left(
            ServerFailure(message: 'The email address already exists.'))),
      );
    });
  });

  group('Update user', () {
    const updatedUser = UserModel(
      candidateId: '9ee237c7-1655-46dd-bcae-c055c366b32e',
      registrationNumber: "2257",
      lastName: 'Mirana',
      firstName: 'Seheno',
      email: "student1@gmail.com",
      gender: "MALE",
      phone: "+261340000000",
      token: 'token',
      classEntity: ClassModel(
        id: '5afab7e4-877d-426c-a506-07bf9bcdb8ad',
        group: '',
        level: 'L2',
        category: 'GB',
      ),
    );

    test('Should return a valid user', () async {
      when(mockFlutterSecureStorage.read(key: 'token'))
          .thenAnswer((_) async => 'token');
      when(mockAuthenticationSource.updateUser(
        user: updatedUser,
        token: 'token',
      )).thenAnswer((_) async => updatedUser);

      final result =
          await authenticationRepositoryImpl.updateUser(user: updatedUser);

      expect(result, equals(const Right(updatedUser)));
    });

    test('Should return a server with a custom message', () async {
      when(mockFlutterSecureStorage.read(key: 'token'))
          .thenAnswer((_) async => 'token');
      when(mockAuthenticationSource.updateUser(
        user: updatedUser,
        token: 'token',
      )).thenThrow(const BadRequestException(
          message: 'This student ID already exists.'));

      final result =
          await authenticationRepositoryImpl.updateUser(user: updatedUser);

      expect(
        result,
        equals(
          const Left(ServerFailure(message: 'This student ID already exists.')),
        ),
      );
    });
  });

  group('Get current user', () {
    test('Should return a valid user entity', () async {
      when(mockAuthenticationSource.getCurrentUser('token'))
          .thenAnswer((_) async => user);
      when(mockFlutterSecureStorage.read(key: 'token'))
          .thenAnswer((_) async => 'token');

      final result = await authenticationRepositoryImpl.getCurrentUser();

      expect(result, equals(const Right(user)));
    });

    test('Should return an access token missing failure', () async {
      when(mockFlutterSecureStorage.read(key: 'token'))
          .thenAnswer((_) async => null);

      final result = await authenticationRepositoryImpl.getCurrentUser();

      expect(
        result,
        equals(const Left(AccessTokenMissingFailure())),
      );
    });
  });

  group('Update password', () {
    test('Should return a string value', () async {
      when(
        mockAuthenticationSource.updatePassword(
          currentPassword: '123456789',
          password: '1234567',
          token: 'token',
        ),
      ).thenAnswer((_) async => 'Updated successfully');
      when(
        mockFlutterSecureStorage.read(key: 'token'),
      ).thenAnswer((_) async => 'token');

      final result = await authenticationRepositoryImpl.updatePassword(
        currentPassword: '123456789',
        password: '1234567',
      );

      expect(
        result,
        equals(const Right('Updated successfully')),
      );
    });

    test('Should return an invalid password failure', () async {
      when(
        mockAuthenticationSource.updatePassword(
          currentPassword: '123456789',
          password: '1234567',
          token: 'token',
        ),
      ).thenThrow(InvalidDataException());
      when(
        mockFlutterSecureStorage.read(key: 'token'),
      ).thenAnswer((_) async => 'token');

      final result = await authenticationRepositoryImpl.updatePassword(
        currentPassword: '123456789',
        password: '1234567',
      );

      expect(
        result,
        equals(const Left(InvalidPasswordFailure())),
      );
    });
  });
}
