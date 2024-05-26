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

  @override
  List<Object?> get props => [
        id,
        name,
        duration,
        subject,
      ];
}
