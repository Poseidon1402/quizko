import 'package:equatable/equatable.dart';

import 'subject_entity.dart';

class InterviewEntity extends Equatable {
  final int id;
  final String name;
  final Duration duration;
  final SubjectEntity subject;

  const InterviewEntity({
    required this.id,
    required this.name,
    required this.duration,
    required this.subject,
  });

  InterviewEntity copyWith({
    int? id,
    String? name,
    Duration? duration,
    SubjectEntity? subject,
  }) {
    return InterviewEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      duration: duration ?? this.duration,
      subject: subject ?? this.subject,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        duration,
        subject,
      ];
}
