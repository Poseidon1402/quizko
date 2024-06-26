import 'package:equatable/equatable.dart';

import 'result_answer_entity.dart';

class ResultQuestionEntity extends Equatable {
  final String label;
  final List<ResultAnswerEntity> answers;

  const ResultQuestionEntity({
    required this.label,
    this.answers = const [],
  });

  @override
  List<Object?> get props => [label, answers];
}