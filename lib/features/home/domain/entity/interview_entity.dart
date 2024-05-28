import 'package:equatable/equatable.dart';

import 'subject_entity.dart';

class InterviewEntity extends Equatable {
  final int id;
  final String name;
  final Duration duration;
  final bool isCompleted;
  final SubjectEntity subject;

  const InterviewEntity({
    required this.id,
    required this.name,
    required this.duration,
    required this.isCompleted,
    required this.subject,
  });

  InterviewEntity copyWith({
    int? id,
    String? name,
    Duration? duration,
    bool? isCompleted,
    SubjectEntity? subject,
  }) {
    return InterviewEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
      duration: duration ?? this.duration,
      subject: subject ?? this.subject,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        duration,
        isCompleted,
        subject,
      ];
}
