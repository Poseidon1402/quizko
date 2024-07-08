part of 'class_bloc.dart';

abstract class ClassState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends ClassState {}

class LoadingClassState extends ClassState {}

class LoadedClassState extends ClassState {
  final List<ClassEntity> classes;

  LoadedClassState({required this.classes});

  @override
  List<Object?> get props => [classes];
}

class ErrorClassState extends ClassState {
  final Failure error;

  ErrorClassState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}