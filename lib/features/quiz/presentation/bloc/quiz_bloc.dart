import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../home/domain/usecases/fetch_marks.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final FetchMarks fetchMark;

  QuizBloc({required this.fetchMark})
      : super(
          QuizStateLoaded(
            currentQuestionIndex: 0,
            userAnswers: const [],
          ),
        ) {
    on<QuizEventNextQuestion>(_handleNextQuestionEvent);
    on<QuizEventAnswered>(_handleAnswerEvent);
    on<QuizEventFinished>(_handleFinishEvent);
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

  void _handleAnswerEvent(QuizEventAnswered event, Emitter<QuizState> emit) {
    final currentState = state as QuizStateLoaded;
    final userAnswers = currentState.userAnswers;
    emit(
      QuizStateLoaded(
        currentQuestionIndex: currentState.currentQuestionIndex,
        userAnswers: [
          ...userAnswers,
          {
            'question_id': currentState.currentQuestionIndex,
            'answer_id': event.answerId
          }
        ],
      ),
    );
  }

  void _handleFinishEvent(
      QuizEventFinished event, Emitter<QuizState> emit) async {
    emit(QuizStateLoading());
    final result = await fetchMark(
      answers: event.answers,
      candidateId: event.candidateId,
      interviewId: event.interviewId,
    );

    result.fold(
      (failure) => emit(QuizStateError(failure: failure)),
      (mark) => emit(QuizStateFinished(mark: mark)),
    );
  }
}
