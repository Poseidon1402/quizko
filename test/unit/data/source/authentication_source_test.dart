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

  group('Authenticate User', () {
    Map<String, String> signInBody = {
      'email': 'johndoe@example.com',
      'password': 'password',
    };

    test('Should return a valid user model', () async {
      const userModel = UserModel(
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

      when(
        mockHttpClient.post(
          Uri.http(ApiConfig.baseUrl, '/api/login'),
          body: signInBody,
        ),
      ).thenAnswer(
        (_) async => http.Response(
          readJson('helpers/dummy_data/dummy_sign_in_response.json'),
          200,
        ),
      );

      final result = await authenticationSource.authenticate(
        'johndoe@example.com',
        'password',
      );

      expect(result, equals(userModel));
    });

    test('Should throw an unauthorized exception', () async {
      when(
        when(
          mockHttpClient.post(
            Uri.http(ApiConfig.baseUrl, '/api/login'),
            body: signInBody,
          ),
        ).thenAnswer(
          (_) async => http.Response(
            "{'message': 'Unauthenticated'}",
            401,
          ),
        ),
      );

      expect(
        () async => await authenticationSource.authenticate(
            'johndoe@example.com', 'password'),
        throwsA(
          isA<UnauthorizedException>(),
        ),
      );
    });
  });
}
