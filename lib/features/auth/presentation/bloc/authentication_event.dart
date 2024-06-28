part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubscribeUserEvent extends AuthenticationEvent {
  final UserModel newUser;

  SubscribeUserEvent({required this.newUser});

  @override
  List<Object?> get props => [newUser];
}

class SignInEvent extends AuthenticationEvent {
  final String email;
  final String password;

  SignInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class LogoutEvent extends AuthenticationEvent {}
