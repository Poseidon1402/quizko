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
    on<QuizEventPreviousQuestion>(_handlePreviousQuestionEvent);
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

  void _handlePreviousQuestionEvent(
      QuizEventPreviousQuestion event, Emitter<QuizState> emit) {
    final currentState = state as QuizStateLoaded;

    if(currentState.currentQuestionIndex > 0) {
      emit(
        QuizStateLoaded(
          currentQuestionIndex: currentState.currentQuestionIndex - 1,
        ),
      );
    }
  }

  void _handleFinishEvent(
      QuizEventFinished event, Emitter<QuizState> emit) async {
    final currentIndex = (state as QuizStateLoaded).currentQuestionIndex;
    emit(QuizStateLoading());

    List<Map<String, int>> data = [];
    for(var item in event.answers.values) {
      data.add(item);
    }

    final result = await fetchMark(
      answers: data,
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
