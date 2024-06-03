part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuizStateLoading extends QuizState {}

class QuizStateLoaded extends QuizState {
  final int currentQuestionIndex;
  final List<Map<String, int>> userAnswers;

  QuizStateLoaded({
    required this.currentQuestionIndex,
    this.userAnswers = const [],
  });

  QuizStateLoaded copyWith({
    int? currentQuestionIndex,
    List<Map<String, int>>? userAnswers,
  }) {
    return QuizStateLoaded(
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      userAnswers: userAnswers ?? this.userAnswers,
    );
  }

  @override
  List<Object?> get props => [currentQuestionIndex, userAnswers];
}

class QuizStateError extends QuizState {
  final Failure failure;

  QuizStateError({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class QuizStateFinished extends QuizState {
  final int mark;

  QuizStateFinished({required this.mark});

  @override
  List<Object?> get props => [mark];
}
