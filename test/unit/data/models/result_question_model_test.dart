import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:quizko/features/result/data/models/result_answer_model.dart';
import 'package:quizko/features/result/data/models/result_question_model.dart';
import 'package:quizko/features/result/domain/entity/result_question_entity.dart';

import '../../helpers/json_reader.dart';

void main() {
  const resultQuestionModel = ResultQuestionModel(
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
  );

  test(
    'Should be a subtype of result question entity',
    () => expect(resultQuestionModel, isA<ResultQuestionEntity>()),
  );

  test('Should return a valid result question model', () {
    Map<String, dynamic> json = jsonDecode(
      readJson('helpers/dummy_data/dummy_result_question.json'),
    );

    final result = ResultQuestionModel.fromJson(json);

    expect(result, equals(resultQuestionModel));
  });
}
