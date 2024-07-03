import 'package:equatable/equatable.dart';

import 'answer_entity.dart';

class QuestionEntity extends Equatable {
  final int id;
  final String label;
  final String type;
  final int point;
  final List<AnswerEntity> answers;

  const QuestionEntity({
    required this.id,
    required this.label,
    required this.point,
    required this.answers,
    required this.type,
  });

  @override
  List<Object?> get props => [id, label, point, answers, type,];
}