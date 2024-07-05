import '../../domain/entity/result_question_entity.dart';
import 'result_answer_model.dart';

class ResultQuestionModel extends ResultQuestionEntity {
  const ResultQuestionModel({
    required super.label,
    required super.answers,
  });

  factory ResultQuestionModel.fromJson(Map<String, dynamic> json) => ResultQuestionModel(
    label: json['question'],
    answers: (json['answers'] as List<dynamic>)
        .map((answer) => ResultAnswerModel.fromJson(answer))
        .toList(),
  );
}