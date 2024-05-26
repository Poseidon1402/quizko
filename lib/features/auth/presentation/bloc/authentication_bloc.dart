import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import '../../../../core/utils/enum/error_type.dart';
import '../../data/models/user_model.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/subscribe_user.dart';

part 'authentication_state.dart';
part 'authentication_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SubscribeUser subscribeUser;
  final SignIn signIn;

  AuthenticationBloc({
    required this.subscribeUser,
    required this.signIn,
  }) : super(InitialState()) {
    on<SubscribeUserEvent>(_handleSubscriptionEvent);
    on<SignInEvent>(_handleSignInEvent);
  }

  void _handleSubscriptionEvent(
      SubscribeUserEvent event, Emitter<AuthenticationState> emit) async {
    emit(LoadingState());
    final result = await subscribeUser(newUser: event.newUser);

    result.fold(
      (failure) => emit(
        UnauthenticatedState(
          message: failure.message,
          type: failure.type,
        ),
      ),
      (user) => emit(AuthenticatedState(currentUser: user)),
    );
  }

  void _handleSignInEvent(
      SignInEvent event, Emitter<AuthenticationState> emit) async {
    emit(LoadingState());
    final result = await signIn(event.email, event.password);

    result.fold(
      (failure) => emit(
        UnauthenticatedState(
          message: failure.message,
          type: failure.type,
        ),
      ),
      (user) => emit(AuthenticatedState(currentUser: user)),
    );
  }
}
