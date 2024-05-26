import 'package:equatable/equatable.dart';

class InterviewEntity extends Equatable {
  final int id;
  final String name;
  final Duration duration;

  const InterviewEntity({
    required this.id,
    required this.name,
    required this.duration,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        duration,
      ];
}
