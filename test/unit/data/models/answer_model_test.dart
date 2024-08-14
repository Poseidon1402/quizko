import 'package:flutter_test/flutter_test.dart';
import 'package:quizko/features/home/data/models/answer_model.dart';
import 'package:quizko/features/home/domain/entity/answer_entity.dart';

void main() {
  const answerModel = AnswerModel(id: 1, label: 'Answer 1');

  test('Should be a subclass of answer entity', () {
    expect(answerModel, isA<AnswerEntity>());
  });

  test('Should return a valid answer model', () {
    Map<String, dynamic> json = {'id': 1, 'answer': 'Answer 1'};

    final result = AnswerModel.fromJson(json);

    expect(result, answerModel);
  });
}