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
      ),
    );
  }

  void _handleAnswerEvent(QuizEventAnswered event, Emitter<QuizState> emit) {
    final currentState = state as QuizStateLoaded;

    emit(
      QuizStateLoaded(
        currentQuestionIndex: currentState.currentQuestionIndex,
      ),
    );
  }

  void _handleFinishEvent(
      QuizEventFinished event, Emitter<QuizState> emit) async {
    final currentIndex = (state as QuizStateLoaded).currentQuestionIndex;
    emit(QuizStateLoading());

    final result = await fetchMark(
      answers: event.answers,
      candidateId: event.candidateId,
      interviewId: event.interviewId,
    );

    result.fold(
      (failure) {
        emit(QuizStateError(failure: failure));
        emit(
          QuizStateLoaded(
            currentQuestionIndex: currentIndex,
          ),
        );
      },
      (mark) {
        emit(QuizStateFinished(mark: mark));
        emit(
          QuizStateLoaded(
            currentQuestionIndex: 0,
          ),
        );
      },
    );
  }
}
