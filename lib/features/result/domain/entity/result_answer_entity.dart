import 'package:equatable/equatable.dart';

class ResultAnswerEntity extends Equatable {
  final String label;
  final bool isCorrect;
  final bool isCandidateAnswer;

  const ResultAnswerEntity({
    required this.label,
    required this.isCorrect,
    required this.isCandidateAnswer,
  });

  @override
  List<Object?> get props => [label, isCorrect, isCandidateAnswer];
}