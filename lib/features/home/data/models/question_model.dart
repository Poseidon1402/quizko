import '../../domain/entity/question_entity.dart';
import 'answer_model.dart';

class QuestionModel extends QuestionEntity {
  const QuestionModel({
    required super.id,
    required super.label,
    required super.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json['id'],
        label: json['question'],
        answers: (json['answers'] as List<dynamic>)
            .map((answer) => AnswerModel.fromJson(answer))
            .toList(),
      );
}
