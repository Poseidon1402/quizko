import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quizko/core/error/failures.dart';
import 'package:quizko/features/account/domain/entity/class_entity.dart';
import 'package:quizko/features/auth/domain/entity/user_entity.dart';
import 'package:quizko/features/auth/presentation/bloc/authentication_bloc.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockSignIn mockSignIn;
  late MockSubscribeUser mockSubscribeUser;
  late MockLogout mockLogout;
  late MockVerifyToken mockVerifyToken;
  late AuthenticationBloc authenticationBloc;

  setUp(() {
    mockSignIn = MockSignIn();
    mockSubscribeUser = MockSubscribeUser();
    mockVerifyToken = MockVerifyToken();
    mockLogout = MockLogout();
    authenticationBloc = AuthenticationBloc(
      subscribeUser: mockSubscribeUser,
      signIn: mockSignIn,
      verifyToken: mockVerifyToken,
      logout: mockLogout,
    );
  });

  const user = UserEntity(
    candidateId: 5,
    registrationNumber: "1111",
    fullName: "John Doe",
    email: "johndoe2@example.com",
    gender: "masculine",
    phone: "0320011122",
    classEntity: ClassEntity(
      id: 1,
      name: 'M1 GB',
    ),
  );

  group('Authenticate user', () {
    test('Initial value should be InitialState', () {
      expect(authenticationBloc.state, InitialState());
    });

    blocTest(
      'Should emit [LoadingState, AuthenticatedState] when the user is authenticated successfully',
      build: () {
        when(mockSignIn.call('johndoe@example.com', 'password'))
            .thenAnswer((_) async => const Right(user));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(
        SignInEvent(
          email: 'johndoe@example.com',
          password: 'password',
        ),
      ),
      expect: () => [
        LoadingState(),
        AuthenticatedState(currentUser: user),
      ],
    );

    blocTest(
      'Should emit [LoadingState, AuthenticatedState] when the user is authenticated successfully',
      build: () {
        when(mockSignIn.call('johndoe@example.com', 'password'))
            .thenAnswer((_) async => const Left(ServerFailure()));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(
        SignInEvent(
          email: 'johndoe@example.com',
          password: 'password',
        ),
      ),
      expect: () => [
        LoadingState(),
        UnauthenticatedState(message: const ServerFailure().message),
      ],
    );
  });
}
