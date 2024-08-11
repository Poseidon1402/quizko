import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:quizko/core/config/api_config.dart';
import 'package:quizko/core/error/exceptions.dart';
import 'package:quizko/core/utils/services/date_converter_service.dart';
import 'package:quizko/features/home/data/models/interview_model.dart';
import 'package:quizko/features/home/data/models/subject_model.dart';
import 'package:quizko/features/home/data/source/interview_source.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockClient mockClient;
  late InterviewSourceImpl interviewSource;

  setUp(() {
    mockClient = MockClient();
    interviewSource = InterviewSourceImpl(client: mockClient);
  });

  group('Fetch interviews', () {
    final interviews = [
      InterviewModel(
        id: 1,
        name: 'Test Android 1',
        duration: DateConverterService.convertToDuration("00:30:00"),
        subject: const SubjectModel(
          id: 1,
          name: 'QCM Android 1',
        ),
      ),
    ];

    test('Should a valid list of interviews model', () async {
      when(mockClient.get(
        Uri.http(ApiConfig.baseUrl, '/api/tests/1'),
        headers: anyNamed('headers'),
      )).thenAnswer(
        (_) async => http.Response(
          readJson(
              'helpers/dummy_data/responses/dummy_interviews_list_response.json'),
          200,
        ),
      );

      final result = await interviewSource.fetchInterviews('token', 1);

      expect(result, interviews);
    });

    test('Should throw a server exception while the status code is not success',
        () async {
      when(mockClient.get(
        Uri.http(ApiConfig.baseUrl, '/api/tests/1'),
        headers: anyNamed('headers'),
      )).thenAnswer(
        (_) async => http.Response(
          "{'message': 'error'}",
          400,
        ),
      );

      expect(
        () async => await interviewSource.fetchInterviews('token', 1),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
