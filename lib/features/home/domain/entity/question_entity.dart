import 'package:equatable/equatable.dart';

import 'answer_entity.dart';

class QuestionEntity extends Equatable {
  final int id;
  final String label;
  final List<AnswerEntity> answers;

  const QuestionEntity({
    required this.id,
    required this.label,
    required this.answers,
  });

  @override
  List<Object?> get props => [id, label, answers];
}