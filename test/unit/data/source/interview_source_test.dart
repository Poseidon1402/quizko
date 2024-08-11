import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:quizko/core/config/api_config.dart';
import 'package:quizko/core/error/exceptions.dart';
import 'package:quizko/core/utils/services/date_converter_service.dart';
import 'package:quizko/features/home/data/models/answer_model.dart';
import 'package:quizko/features/home/data/models/interview_model.dart';
import 'package:quizko/features/home/data/models/question_model.dart';
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
            'helpers/dummy_data/responses/dummy_interviews_list_response.json',
          ),
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

  group('Fetch related questions', () {
    const questions = [
      QuestionModel(
        id: 1,
        label: 'Choose one fact about Android',
        point: 1,
        answers: [
          AnswerModel(id: 1, label: "Android is a web navigator"),
          AnswerModel(id: 2, label: "Android is an app web"),
          AnswerModel(id: 3, label: "Android is a web server"),
          AnswerModel(id: 4, label: "Android is an operating system"),
        ],
        type: "qcm",
      ),
    ];

    test('Should return a valid question list on success', () async {
      when(mockClient.get(
        Uri.http(ApiConfig.baseUrl, '/api/questions/1'),
        headers: anyNamed('headers'),
      )).thenAnswer(
        (_) async => http.Response(
          readJson(
            'helpers/dummy_data/responses/dummy_questions_list_response.json',
          ),
          200,
        ),
      );

      final result = await interviewSource.fetchRelatedQuestions(
        token: 'token',
        subjectId: 1,
      );

      expect(result, equals(questions));
    });

    test('Should throw a server exception on error', () async {
      when(mockClient.get(
        Uri.http(ApiConfig.baseUrl, '/api/questions/1'),
        headers: anyNamed('headers'),
      )).thenAnswer(
        (_) async => http.Response(
          '{}',
          400,
        ),
      );

      expect(
        () async => await interviewSource.fetchRelatedQuestions(
          token: 'token',
          subjectId: 1,
        ),
        throwsA(isA<ServerException>()),
      );
    });
  });

  group('Submit quiz', () {
    test('Should return a valid mark', () async {
      when(mockClient.post(
        Uri.http(ApiConfig.baseUrl, '/api/answer'),
        body: json.encode({
          'candidate_id': 1,
          'interview_id': 1,
          'candidate_answers': [
            {'candidate_answer': 1}
          ],
        }),
        headers: anyNamed('headers'),
      )).thenAnswer(
        (_) async => http.Response(jsonEncode({'total_points': 5}), 200),
      );

      final result = await interviewSource.submitQuiz(
        token: 'token',
        interviewId: 1,
        candidateId: 1,
        answers: [
          {'candidate_answer': 1}
        ],
      );

      expect(result, equals(5));
    });
  });

  group('Verifying if the quiz is already completed by the user', () {
    test('Should return a valid boolean', () async {
      when(mockClient.get(
        Uri.http(
          ApiConfig.baseUrl,
          '/api/is-student-passed/1/1',
        ),
        headers: anyNamed('headers'),
      )).thenAnswer(
        (_) async => http.Response(jsonEncode({'exists': false}), 200),
      );

      final result = await interviewSource.isAlreadyCompleted(
        token: 'token',
        interviewId: 1,
        candidateId: 1,
      );

      expect(result, equals(false));
    });
  });
}
