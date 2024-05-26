import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final int id;
  final String label;

  const QuestionEntity({
    required this.id,
    required this.label,
  });

  @override
  List<Object?> get props => [id, label];
}