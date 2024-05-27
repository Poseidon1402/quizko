part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuizStateLoaded extends QuizState {
  final int currentQuestionIndex;
  final List<int> userAnswers;

  QuizStateLoaded({
    required this.currentQuestionIndex,
    this.userAnswers = const [],
  });

  @override
  List<Object?> get props => [currentQuestionIndex, userAnswers];
}
