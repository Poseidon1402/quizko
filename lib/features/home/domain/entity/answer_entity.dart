import 'package:equatable/equatable.dart';

class AnswerEntity extends Equatable {
  final int id;
  final String label;

  const AnswerEntity({
    required this.id,
    required this.label,
  });

  @override
  List<Object?> get props => [id, label];
}