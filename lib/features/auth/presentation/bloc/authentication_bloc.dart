import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import '../../../../core/utils/enum/error_type.dart';
import '../../data/models/user_model.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/usecases/subscribe_user.dart';

part 'authentication_state.dart';
part 'authentication_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SubscribeUser subscribeUser;

  AuthenticationBloc({required this.subscribeUser}) : super(InitialState()) {
    on<SubscribeUserEvent>(_handleSubscriptionEvent);
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
}
