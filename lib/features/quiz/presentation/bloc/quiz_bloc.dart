import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc()
      : super(
          QuizStateLoaded(
            currentQuestionIndex: 0,
            userAnswers: const [],
          ),
        ) {
    on<QuizEventNextQuestion>(_handleNextQuestionEvent);
  }

  void _handleNextQuestionEvent(
      QuizEventNextQuestion event, Emitter<QuizState> emit) {
    final currentState = state as QuizStateLoaded;
    emit(
      QuizStateLoaded(
        currentQuestionIndex: currentState.currentQuestionIndex + 1,
        userAnswers: currentState.userAnswers,
      ),
    );
  }
}
