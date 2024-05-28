part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuizStateLoading extends QuizState {}

class QuizStateLoaded extends QuizState {
  final int currentQuestionIndex;

  QuizStateLoaded({
    required this.currentQuestionIndex,
  });

  QuizStateLoaded copyWith({
    int? currentQuestionIndex,
    List<Map<String, int>>? userAnswers,
  }) {
    return QuizStateLoaded(
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
    );
  }

  @override
  List<Object?> get props => [currentQuestionIndex];
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
