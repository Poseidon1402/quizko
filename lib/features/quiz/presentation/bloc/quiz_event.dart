part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuizEventStarted extends QuizEvent {}

class QuizEventAnswered extends QuizEvent {
  final int questionIndex;
  final int answerIndex;

  QuizEventAnswered({
    required this.questionIndex,
    required this.answerIndex,
  });

  @override
  List<Object?> get props => [questionIndex, answerIndex];
}

class QuizEventNextQuestion extends QuizEvent {}

class QuizEventFinished extends QuizEvent {}