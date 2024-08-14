import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:quizko/features/home/data/models/answer_model.dart';
import 'package:quizko/features/home/data/models/question_model.dart';
import 'package:quizko/features/home/domain/entity/question_entity.dart';

import '../../helpers/json_reader.dart';

void main() {
  const questionModel = QuestionModel(
    id: 1,
    label: 'What is the main language used by Android OS ?',
    point: 1,
    answers: [
      AnswerModel(id: 1, label: 'JAVA'),
      AnswerModel(id: 2, label: 'C++'),
      AnswerModel(id: 3, label: 'Python'),
      AnswerModel(id: 4, label: 'Dart'),
    ],
    type: 'qcm',
  );
  
  test('Should be a subclass of question entity', () {
    expect(questionModel, isA<QuestionEntity>());
  });
  
  test('Should return a valid question model', () {
    final json = jsonDecode(readJson('helpers/dummy_data/dummy_question.json'));
    
    final result = QuestionModel.fromJson(json);
    
    expect(result, equals(questionModel));
  });
}
