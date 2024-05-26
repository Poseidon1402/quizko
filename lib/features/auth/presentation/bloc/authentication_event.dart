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