import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quizko/core/error/failures.dart';
import 'package:quizko/features/account/data/models/class_model.dart';
import 'package:quizko/features/account/domain/entity/class_entity.dart';
import 'package:quizko/features/auth/data/models/user_model.dart';
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

  const serverFailure = ServerFailure();

  test('Initial value should be InitialState', () {
    expect(authenticationBloc.state, InitialState());
  });

  group('Authenticate user', () {
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
      'Should emit [LoadingState, UnauthenticatedState] when the user is authenticated successfully',
      build: () {
        when(mockSignIn.call('johndoe@example.com', 'password'))
            .thenAnswer((_) async => const Left(serverFailure));
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
        UnauthenticatedState(
          message: serverFailure.message,
          type: serverFailure.type,
        ),
      ],
    );
  });

  group('Subscribe user', () {
    const newUser = UserModel(
      candidateId: 5,
      registrationNumber: "1111",
      fullName: "John Doe",
      email: "johndoe2@example.com",
      gender: "masculine",
      phone: "0320011122",
      classEntity: ClassModel(
        id: 1,
        name: 'M1 GB',
      ),
    );

    blocTest(
      'Should emit [LoadingState, AuthenticatedState] when the user is subscribed successfully',
      build: () {
        when(mockSubscribeUser.call(newUser: newUser))
            .thenAnswer((_) async => const Right(newUser));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(SubscribeUserEvent(newUser: newUser)),
      expect: () => [LoadingState(), AuthenticatedState(currentUser: newUser)],
    );

    blocTest(
      'Should emit [LoadingState, UnauthenticatedState] when the user is subscribed successfully',
      build: () {
        when(mockSubscribeUser.call(newUser: newUser))
            .thenAnswer((_) async => const Left(serverFailure));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(SubscribeUserEvent(newUser: newUser)),
      expect: () => [
        LoadingState(),
        UnauthenticatedState(
          message: serverFailure.message,
          type: serverFailure.type,
        )
      ],
    );
  });

  group('Verify token', () {
    blocTest(
      'Should emit [LoadingState, AuthenticatedState] when the token is valid',
      build: () {
        when(mockVerifyToken.call()).thenAnswer((_) async => const Right(user));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(VerifyTokenEvent()),
      expect: () => [
        LoadingState(),
        AuthenticatedState(currentUser: user),
      ],
    );

    blocTest(
      'Should emit [LoadingState, UnauthenticatedState] when the token is invalid',
      build: () {
        when(mockVerifyToken.call())
            .thenAnswer((_) async => const Left(serverFailure));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(VerifyTokenEvent()),
      expect: () => [
        LoadingState(),
        UnauthenticatedState(
          message: serverFailure.message,
          type: serverFailure.type,
        ),
      ],
    );
  });

  group('Update user', () {
    const updatedUser = UserModel(
      candidateId: 5,
      registrationNumber: "1111",
      fullName: "John Doe",
      email: "johndoe3@example.com",
      gender: "masculine",
      phone: "0320011122",
      classEntity: ClassModel(
        id: 1,
        name: 'M1 GB',
      ),
    );

    blocTest(
      'Should emit [LoadingState, AuthenticatedState] when the user is updated successfully',
      build: () {
        when(mockVerifyToken.call())
            .thenAnswer((_) async => const Right(updatedUser));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(VerifyTokenEvent()),
      expect: () => [
        LoadingState(),
        AuthenticatedState(currentUser: updatedUser),
      ],
    );

    blocTest(
      'Should emit [LoadingState, UnauthenticatedState] when the user is updated successfully',
      build: () {
        when(mockVerifyToken.call())
            .thenAnswer((_) async => const Left(serverFailure));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(VerifyTokenEvent()),
      expect: () => [
        LoadingState(),
        UnauthenticatedState(
          message: serverFailure.message,
          type: serverFailure.type,
        ),
      ],
    );
  });
}
