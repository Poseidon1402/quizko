import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quizko/core/config/api_config.dart';
import 'package:quizko/core/error/exceptions.dart';
import 'package:quizko/features/account/data/models/class_model.dart';
import 'package:quizko/features/account/data/source/class_source.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockClient mockClient;
  late ClassSourceImpl classSourceImpl;

  setUp(() {
    mockClient = MockClient();
    classSourceImpl = ClassSourceImpl(client: mockClient);
  });

  group('Fetch classes', () {
    const classes = [
      ClassModel(
        id: 'bf94a726-5934-4339-9efe-f41f0ebb1da8',
        group: 'G1',
        level: 'L1',
        category: 'GB',
      ),
      ClassModel(
        id: '2bcc9fb4-b1b0-4cef-b872-2d92cfdfb0f7',
        group: 'G2',
        level: 'L1',
        category: 'GB',
      ),
    ];

    test('Should return a list of class model', () async {
      when(mockClient.get(
        Uri.http(ApiConfig.baseUrl, '/api/levels'),
      )).thenAnswer(
        (_) async => http.Response(
          readJson(
            'helpers/dummy_data/responses/dummy_classes_list_response.json',
          ),
          200,
        ),
      );

      final result = await classSourceImpl.fetchAll();

      expect(result, equals(classes));
    });

    test('Should throw a server exception', () async {
      when(mockClient.get(
        Uri.http(ApiConfig.baseUrl, '/api/levels'),
      )).thenAnswer(
        (_) async => http.Response(
          '{}',
          400,
        ),
      );

      expect(
        () async => await classSourceImpl.fetchAll(),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
