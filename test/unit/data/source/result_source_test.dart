import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quizko/core/config/api_config.dart';
import 'package:quizko/core/error/exceptions.dart';
import 'package:quizko/features/result/data/models/result_answer_model.dart';
import 'package:quizko/features/result/data/models/result_question_model.dart';
import 'package:quizko/features/result/data/source/result_source.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockClient mockClient;
  late ResultSourceImpl resultSourceImpl;

  setUp(() {
    mockClient = MockClient();
    resultSourceImpl = ResultSourceImpl(client: mockClient);
  });

  group('Fetch corrections', () {
    const corrections = [
      ResultQuestionModel(
        label: 'Question 1',
        answers: [
          ResultAnswerModel(
            label: 'Answer 1',
            isCorrect: false,
            isCandidateAnswer: false,
          ),
          ResultAnswerModel(
            label: 'Answer 2',
            isCorrect: true,
            isCandidateAnswer: true,
          ),
          ResultAnswerModel(
            label: 'Answer 3',
            isCorrect: false,
            isCandidateAnswer: false,
          ),
          ResultAnswerModel(
            label: 'Answer 4',
            isCorrect: false,
            isCandidateAnswer: false,
          ),
        ],
      )
    ];

    test('Should return a valid list of result question model', () async {
      when(
        mockClient.get(
          Uri.http(
            ApiConfig.baseUrl,
            'api/student-answers/1/1',
          ),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          readJson(
            'helpers/dummy_data/responses/dummy_result_questions_list.json',
          ),
          200,
        ),
      );

      final result = await resultSourceImpl.fetchCorrections(
        candidateId: 1,
        interviewId: 1,
        token: 'token',
      );

      expect(result, equals(corrections));
    });

    test('Should throw a server exception', () async {
      when(
        mockClient.get(
          Uri.http(
            ApiConfig.baseUrl,
            'api/student-answers/1/1',
          ),
          headers: anyNamed('headers'),
        ),
      ).thenThrow(const SocketException(''));

      expect(
        () async => await resultSourceImpl.fetchCorrections(
          candidateId: 1,
          interviewId: 1,
          token: 'token',
        ),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
