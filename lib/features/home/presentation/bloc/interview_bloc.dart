import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entity/interview_entity.dart';
import '../../domain/usecases/fetch_interviews.dart';

part 'interview_event.dart';
part 'interview_state.dart';

class InterviewBloc extends Bloc<InterviewEvent, InterviewState> {
  final FetchInterviews fetchInterviews;

  InterviewBloc({required this.fetchInterviews}) : super(InitialState()) {
    on<FetchInterviewsEvent>(_handleFetchInterviewsEvent);
  }

  void _handleFetchInterviewsEvent(
      FetchInterviewsEvent event, Emitter<InterviewState> emit) async {
    emit(LoadingState());
    final result = await fetchInterviews();
    result.fold(
      (failure) => emit(ErrorState(error: failure)),
      (interviews) => emit(InterviewsLoaded(interviews: interviews)),
    );
  }
}
