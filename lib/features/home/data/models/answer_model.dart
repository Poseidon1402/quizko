import '../../domain/entity/answer_entity.dart';

class AnswerModel extends AnswerEntity {
  const AnswerModel({
    required super.id,
    required super.label,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) => AnswerModel(
        id: json['id'],
        label: json['answer'],
      );
}
