import 'package:flutter_test/flutter_test.dart';
import 'package:quizko/features/result/data/models/result_answer_model.dart';
import 'package:quizko/features/result/domain/entity/result_answer_entity.dart';

void main() {
  const resultAnswerModel = ResultAnswerModel(
    label: 'Answer 1',
    isCorrect: true,
    isCandidateAnswer: true,
  );

  test(
    'Should be a subtype of result answer entity',
    () => expect(resultAnswerModel, isA<ResultAnswerEntity>()),
  );

  test('Should return a valid result answer model', () {
    Map<String, dynamic> json = {
      'answer': "Answer 1",
      'is_correct': 1,
      'is_candidate_answer': true,
    };

    final result = ResultAnswerModel.fromJson(json);

    expect(result, equals(resultAnswerModel));
  });
}
