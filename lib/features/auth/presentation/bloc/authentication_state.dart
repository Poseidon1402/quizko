part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends AuthenticationState {}

class LoadingState extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {
  final UserEntity currentUser;

  AuthenticatedState({required this.currentUser});

  @override
  List<Object?> get props => [currentUser];
}

class UnauthenticatedState extends AuthenticationState {
  final String message;
  final ErrorType type;

  UnauthenticatedState({
    this.message = '',
    this.type = ErrorType.serverError,
  });

  @override
  List<Object?> get props => [message, type];
}