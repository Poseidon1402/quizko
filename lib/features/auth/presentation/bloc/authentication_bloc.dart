import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import '../../../../core/utils/enum/error_type.dart';
import '../../data/models/user_model.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/usecases/logout.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/subscribe_user.dart';
import '../../domain/usecases/verify_token.dart';

part 'authentication_state.dart';
part 'authentication_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SubscribeUser subscribeUser;
  final SignIn signIn;
  final VerifyToken verifyToken;
  final Logout logout;

  AuthenticationBloc({
    required this.subscribeUser,
    required this.signIn,
    required this.verifyToken,
    required this.logout,
  }) : super(InitialState()) {
    on<SubscribeUserEvent>(_handleSubscriptionEvent);
    on<SignInEvent>(_handleSignInEvent);
    on<VerifyTokenEvent>(_handleVerifyTokenEvent);
    on<LogoutEvent>(_handleLogoutEvent);
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

  void _handleVerifyTokenEvent(
      VerifyTokenEvent event, Emitter<AuthenticationState> emit) async {
    emit(LoadingState());
    final result = await verifyToken();

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

  void _handleLogoutEvent(
      LogoutEvent event, Emitter<AuthenticationState> emit) async {
    final result = await logout();

    result.fold((failure) => null, (success) => emit(InitialState()));
  }
}
