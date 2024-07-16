part of 'interview_bloc.dart';

abstract class InterviewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchInterviewsEvent extends InterviewEvent {
  final int candidateId;
  final int classId;

  FetchInterviewsEvent({required this.candidateId, required this.classId});

  @override
  List<Object?> get props => [candidateId, classId];
}

class InterviewCompletedEvent extends InterviewEvent {
  final int id;

  InterviewCompletedEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class FetchInterviewCorrectionEvent extends InterviewEvent {
  final int candidateId;
  final int interviewId;

  FetchInterviewCorrectionEvent({
    required this.candidateId,
    required this.interviewId,
  });

  @override
  List<Object?> get props => [candidateId, interviewId];
}
