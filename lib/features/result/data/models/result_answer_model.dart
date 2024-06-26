import '../../domain/entity/result_answer_entity.dart';

class ResultAnswerModel extends ResultAnswerEntity {
  const ResultAnswerModel({
    required super.label,
    super.isCorrect = false,
    super.isCandidateAnswer = true,
  });

  factory ResultAnswerModel.fromJson(Map<String, dynamic> json) => ResultAnswerModel(
    label: json['answer'],
    isCorrect: json['is_correct'] == 1,
    isCandidateAnswer: json['is_candidate_answer'],
  );
}