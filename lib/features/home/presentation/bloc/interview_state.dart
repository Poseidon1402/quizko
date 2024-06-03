part of 'interview_bloc.dart';

abstract class InterviewState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends InterviewState {}

class LoadingState extends InterviewState {}

class InterviewsLoaded extends InterviewState {
  final List<InterviewEntity> interviews;

  InterviewsLoaded({required this.interviews});

  @override
  List<Object?> get props => [interviews];
}

class ErrorState extends InterviewState {
  final Failure error;

  ErrorState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}