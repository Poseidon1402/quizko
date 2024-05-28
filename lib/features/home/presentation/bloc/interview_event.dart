part of 'interview_bloc.dart';

abstract class InterviewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchInterviewsEvent extends InterviewEvent {
  final int candidateId;

  FetchInterviewsEvent({required this.candidateId});

  @override
  List<Object?> get props => [candidateId];
}