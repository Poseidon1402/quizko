import 'package:equatable/equatable.dart';

import '../../../result/domain/entity/result_question_entity.dart';
import 'subject_entity.dart';

class InterviewEntity extends Equatable {
  final int id;
  final String name;
  final Duration duration;
  final bool isCompleted;
  final SubjectEntity subject;
  final List<ResultQuestionEntity> corrections;

  const InterviewEntity({
    required this.id,
    required this.name,
    required this.duration,
    required this.isCompleted,
    required this.subject,
    this.corrections = const [],
  });

  InterviewEntity copyWith({
    int? id,
    String? name,
    Duration? duration,
    bool? isCompleted,
    SubjectEntity? subject,
    List<ResultQuestionEntity>? corrections,
  }) {
    return InterviewEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
      duration: duration ?? this.duration,
      subject: subject ?? this.subject,
      corrections: corrections ?? this.corrections,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        duration,
        isCompleted,
        subject,
        corrections,
      ];
}
