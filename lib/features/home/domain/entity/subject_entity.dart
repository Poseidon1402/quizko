import 'package:equatable/equatable.dart';

import 'question_entity.dart';

class SubjectEntity extends Equatable {
  final int id;
  final String name;
  final List<QuestionEntity> questions;

  const SubjectEntity({
    required this.id,
    required this.name,
    this.questions = const [],
  });

  SubjectEntity copyWith({
    int? id,
    String? name,
    List<QuestionEntity>? questions,
  }) {
    return SubjectEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      questions: questions ?? this.questions,
    );
  }

  @override
  List<Object?> get props => [id, name, questions];
}
