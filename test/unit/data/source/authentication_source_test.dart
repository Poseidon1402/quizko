import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:quizko/core/config/api_config.dart';
import 'package:quizko/core/error/exceptions.dart';
import 'package:quizko/features/account/data/models/class_model.dart';
import 'package:quizko/features/auth/data/models/user_model.dart';
import 'package:quizko/features/auth/data/source/authentication_source.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockClient mockHttpClient;
  late AuthenticationSource authenticationSource;

  setUp(() {
    mockHttpClient = MockClient();
    authenticationSource = AuthenticationSourceImpl(httpClient: mockHttpClient);
  });

  const userModel = UserModel(
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

  group('Authenticate User', () {
    Map<String, String> signInBody = {
      'email': 'student1@gmail.com',
      'password': 'password',
    };

    test('Should return a valid user model', () async {
      when(
        mockHttpClient.post(
          Uri.https(ApiConfig.baseUrl, '/api/auth/login'),
          body: signInBody,
        ),
      ).thenAnswer(
        (_) async => http.Response(
          readJson('helpers/dummy_data/responses/dummy_sign_in_response.json'),
          200,
        ),
      );

      final result = await authenticationSource.authenticate(
        'student1@gmail.com',
        'password',
      );

      expect(result, equals(userModel));
    });

    test('Should throw an unauthorized exception', () async {
      when(
        mockHttpClient.post(
          Uri.https(ApiConfig.baseUrl, '/api/auth/login'),
          body: signInBody,
        ),
      ).thenAnswer(
        (_) async => http.Response(
          "{'message': 'Unauthenticated'}",
          401,
        ),
      );

      expect(
        () async => await authenticationSource.authenticate(
          'student1@gmail.com',
          'password',
        ),
        throwsA(
          isA<UnauthorizedException>(),
        ),
      );
    });

    test('Should throw a not found exception', () async {
      when(
        mockHttpClient.post(
          Uri.https(ApiConfig.baseUrl, '/api/auth/login'),
          body: signInBody,
        ),
      ).thenAnswer(
        (_) async => http.Response(
          "{'message': 'Aucun compte associé à cette adresse e-mail/numéro matricule.'}",
          404,
        ),
      );

      expect(
        () async => await authenticationSource.authenticate(
          'student1@gmail.com',
          'password',
        ),
        throwsA(
          isA<NotFoundException>(),
        ),
      );
    });
  });

  /*group('Subscribe user', () {
    const newUserModel = UserModel(
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

    test('Should return a valid user model', () async {
      when(
        mockHttpClient.post(
          Uri.http(ApiConfig.baseUrl, '/api/subscribe'),
          body: newUserModel.subscriptionJson(),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      ).thenAnswer(
        (_) async => http.Response(
          readJson('helpers/dummy_data/responses/dummy_sign_in_response.json'),
          200,
        ),
      );

      final result = await authenticationSource.subscribeUser(newUserModel);

      expect(result, equals(userModel));
    });

    test('Should throw a bad request exception', () async {
      when(
        mockHttpClient.post(
          Uri.http(ApiConfig.baseUrl, '/api/subscribe'),
          body: newUserModel.subscriptionJson(),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      ).thenAnswer(
        (_) async => http.Response(
          '{"message": "Duplicated registration number"}',
          400,
        ),
      );

      expect(
        () async => authenticationSource.subscribeUser(newUserModel),
        throwsA(
          isA<BadRequestException>(),
        ),
      );
    });
  });

  group('Getting current user', () {
    test('Should return a valid user model', () async {
      when(
        mockHttpClient.get(
          Uri.http(ApiConfig.baseUrl, '/api/user'),
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer token',
          },
        ),
      ).thenAnswer(
        (_) async => http.Response(
          readJson(
            'helpers/dummy_data/responses/dummy_current_user_response.json',
          ),
          200,
        ),
      );

      final result = await authenticationSource.getCurrentUser('token');

      expect(result, equals(userModel));
    });
  });

  group('Update current user', () {
    test('Should return a valid user model', () async {
      when(
        mockHttpClient.put(
          Uri.http(ApiConfig.baseUrl, '/api/profile'),
          body: userModel.updateJson(),
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer token',
          },
        ),
      ).thenAnswer(
        (_) async => http.Response(
          readJson(
            'helpers/dummy_data/responses/dummy_update_user_response.json',
          ),
          200,
        ),
      );

      final result = await authenticationSource.updateUser(user: userModel, token: 'token');

      expect(result, equals(userModel));
    });
  });*/
}
