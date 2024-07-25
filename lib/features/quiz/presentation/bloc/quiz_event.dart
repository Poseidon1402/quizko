part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuizEventStarted extends QuizEvent {}

class QuizEventAnswered extends QuizEvent {
  final int answerId;

  QuizEventAnswered({
    required this.answerId,
  });

  @override
  List<Object?> get props => [answerId];
}

class QuizEventNextQuestion extends QuizEvent {}

class QuizEventPreviousQuestion extends QuizEvent {}

class QuizEventFinished extends QuizEvent {
  final int candidateId;
  final int interviewId;
  final Map<int, Map<String, int>> answers;

  QuizEventFinished({
    required this.answers,
    required this.interviewId,
    required this.candidateId,
  });

  @override
  List<Object?> get props => [answers, interviewId, candidateId];
}
