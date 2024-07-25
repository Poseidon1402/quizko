// Mocks generated by Mockito 5.4.4 from annotations
// in quizko/test/unit/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i7;
import 'dart:typed_data' as _i9;

import 'package:dartz/dartz.dart' as _i5;
import 'package:flutter/foundation.dart' as _i10;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i8;
import 'package:quizko/core/error/failures.dart' as _i13;
import 'package:quizko/features/auth/data/models/user_model.dart' as _i4;
import 'package:quizko/features/auth/data/source/authentication_source.dart'
    as _i11;
import 'package:quizko/features/auth/domain/entity/user_entity.dart' as _i14;
import 'package:quizko/features/auth/domain/usecases/logout.dart' as _i17;
import 'package:quizko/features/auth/domain/usecases/sign_in.dart' as _i15;
import 'package:quizko/features/auth/domain/usecases/subscribe_user.dart'
    as _i12;
import 'package:quizko/features/auth/domain/usecases/verify_token.dart' as _i16;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponse_0 extends _i1.SmartFake implements _i2.Response {
  _FakeResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_1 extends _i1.SmartFake
    implements _i2.StreamedResponse {
  _FakeStreamedResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIOSOptions_2 extends _i1.SmartFake implements _i3.IOSOptions {
  _FakeIOSOptions_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAndroidOptions_3 extends _i1.SmartFake
    implements _i3.AndroidOptions {
  _FakeAndroidOptions_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLinuxOptions_4 extends _i1.SmartFake implements _i3.LinuxOptions {
  _FakeLinuxOptions_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWindowsOptions_5 extends _i1.SmartFake
    implements _i3.WindowsOptions {
  _FakeWindowsOptions_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWebOptions_6 extends _i1.SmartFake implements _i3.WebOptions {
  _FakeWebOptions_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMacOsOptions_7 extends _i1.SmartFake implements _i3.MacOsOptions {
  _FakeMacOsOptions_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserModel_8 extends _i1.SmartFake implements _i4.UserModel {
  _FakeUserModel_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_9<L, R> extends _i1.SmartFake implements _i5.Either<L, R> {
  _FakeEither_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i2.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i2.Response>);

  @override
  _i6.Future<_i2.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i2.Response>);

  @override
  _i6.Future<_i2.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i7.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i2.Response>);

  @override
  _i6.Future<_i2.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i7.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i2.Response>);

  @override
  _i6.Future<_i2.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i7.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i2.Response>);

  @override
  _i6.Future<_i2.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i7.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i2.Response>);

  @override
  _i6.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<String>.value(_i8.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<String>);

  @override
  _i6.Future<_i9.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i9.Uint8List>.value(_i9.Uint8List(0)),
      ) as _i6.Future<_i9.Uint8List>);

  @override
  _i6.Future<_i2.StreamedResponse> send(_i2.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i6.Future<_i2.StreamedResponse>.value(_FakeStreamedResponse_1(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i6.Future<_i2.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [FlutterSecureStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockFlutterSecureStorage extends _i1.Mock
    implements _i3.FlutterSecureStorage {
  MockFlutterSecureStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.IOSOptions get iOptions => (super.noSuchMethod(
        Invocation.getter(#iOptions),
        returnValue: _FakeIOSOptions_2(
          this,
          Invocation.getter(#iOptions),
        ),
      ) as _i3.IOSOptions);

  @override
  _i3.AndroidOptions get aOptions => (super.noSuchMethod(
        Invocation.getter(#aOptions),
        returnValue: _FakeAndroidOptions_3(
          this,
          Invocation.getter(#aOptions),
        ),
      ) as _i3.AndroidOptions);

  @override
  _i3.LinuxOptions get lOptions => (super.noSuchMethod(
        Invocation.getter(#lOptions),
        returnValue: _FakeLinuxOptions_4(
          this,
          Invocation.getter(#lOptions),
        ),
      ) as _i3.LinuxOptions);

  @override
  _i3.WindowsOptions get wOptions => (super.noSuchMethod(
        Invocation.getter(#wOptions),
        returnValue: _FakeWindowsOptions_5(
          this,
          Invocation.getter(#wOptions),
        ),
      ) as _i3.WindowsOptions);

  @override
  _i3.WebOptions get webOptions => (super.noSuchMethod(
        Invocation.getter(#webOptions),
        returnValue: _FakeWebOptions_6(
          this,
          Invocation.getter(#webOptions),
        ),
      ) as _i3.WebOptions);

  @override
  _i3.MacOsOptions get mOptions => (super.noSuchMethod(
        Invocation.getter(#mOptions),
        returnValue: _FakeMacOsOptions_7(
          this,
          Invocation.getter(#mOptions),
        ),
      ) as _i3.MacOsOptions);

  @override
  void registerListener({
    required String? key,
    required _i10.ValueChanged<String?>? listener,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerListener,
          [],
          {
            #key: key,
            #listener: listener,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void unregisterListener({
    required String? key,
    required _i10.ValueChanged<String?>? listener,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #unregisterListener,
          [],
          {
            #key: key,
            #listener: listener,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void unregisterAllListenersForKey({required String? key}) =>
      super.noSuchMethod(
        Invocation.method(
          #unregisterAllListenersForKey,
          [],
          {#key: key},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void unregisterAllListeners() => super.noSuchMethod(
        Invocation.method(
          #unregisterAllListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<void> write({
    required String? key,
    required String? value,
    _i3.IOSOptions? iOptions,
    _i3.AndroidOptions? aOptions,
    _i3.LinuxOptions? lOptions,
    _i3.WebOptions? webOptions,
    _i3.MacOsOptions? mOptions,
    _i3.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #write,
          [],
          {
            #key: key,
            #value: value,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<String?> read({
    required String? key,
    _i3.IOSOptions? iOptions,
    _i3.AndroidOptions? aOptions,
    _i3.LinuxOptions? lOptions,
    _i3.WebOptions? webOptions,
    _i3.MacOsOptions? mOptions,
    _i3.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [],
          {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i6.Future<String?>.value(),
      ) as _i6.Future<String?>);

  @override
  _i6.Future<bool> containsKey({
    required String? key,
    _i3.IOSOptions? iOptions,
    _i3.AndroidOptions? aOptions,
    _i3.LinuxOptions? lOptions,
    _i3.WebOptions? webOptions,
    _i3.MacOsOptions? mOptions,
    _i3.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [],
          {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<void> delete({
    required String? key,
    _i3.IOSOptions? iOptions,
    _i3.AndroidOptions? aOptions,
    _i3.LinuxOptions? lOptions,
    _i3.WebOptions? webOptions,
    _i3.MacOsOptions? mOptions,
    _i3.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [],
          {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<Map<String, String>> readAll({
    _i3.IOSOptions? iOptions,
    _i3.AndroidOptions? aOptions,
    _i3.LinuxOptions? lOptions,
    _i3.WebOptions? webOptions,
    _i3.MacOsOptions? mOptions,
    _i3.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readAll,
          [],
          {
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i6.Future<Map<String, String>>.value(<String, String>{}),
      ) as _i6.Future<Map<String, String>>);

  @override
  _i6.Future<void> deleteAll({
    _i3.IOSOptions? iOptions,
    _i3.AndroidOptions? aOptions,
    _i3.LinuxOptions? lOptions,
    _i3.WebOptions? webOptions,
    _i3.MacOsOptions? mOptions,
    _i3.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [],
          {
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<bool?> isCupertinoProtectedDataAvailable() => (super.noSuchMethod(
        Invocation.method(
          #isCupertinoProtectedDataAvailable,
          [],
        ),
        returnValue: _i6.Future<bool?>.value(),
      ) as _i6.Future<bool?>);
}

/// A class which mocks [AuthenticationSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationSource extends _i1.Mock
    implements _i11.AuthenticationSource {
  MockAuthenticationSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.UserModel> subscribeUser(_i4.UserModel? newUser) =>
      (super.noSuchMethod(
        Invocation.method(
          #subscribeUser,
          [newUser],
        ),
        returnValue: _i6.Future<_i4.UserModel>.value(_FakeUserModel_8(
          this,
          Invocation.method(
            #subscribeUser,
            [newUser],
          ),
        )),
      ) as _i6.Future<_i4.UserModel>);

  @override
  _i6.Future<_i4.UserModel> authenticate(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #authenticate,
          [
            email,
            password,
          ],
        ),
        returnValue: _i6.Future<_i4.UserModel>.value(_FakeUserModel_8(
          this,
          Invocation.method(
            #authenticate,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i6.Future<_i4.UserModel>);

  @override
  _i6.Future<String> forgotPassword(String? email) => (super.noSuchMethod(
        Invocation.method(
          #forgotPassword,
          [email],
        ),
        returnValue: _i6.Future<String>.value(_i8.dummyValue<String>(
          this,
          Invocation.method(
            #forgotPassword,
            [email],
          ),
        )),
      ) as _i6.Future<String>);

  @override
  _i6.Future<String> verifyResetCode(
    String? email,
    String? token,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyResetCode,
          [
            email,
            token,
          ],
        ),
        returnValue: _i6.Future<String>.value(_i8.dummyValue<String>(
          this,
          Invocation.method(
            #verifyResetCode,
            [
              email,
              token,
            ],
          ),
        )),
      ) as _i6.Future<String>);

  @override
  _i6.Future<String> resetPassword(
    String? email,
    String? token,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #resetPassword,
          [
            email,
            token,
            password,
          ],
        ),
        returnValue: _i6.Future<String>.value(_i8.dummyValue<String>(
          this,
          Invocation.method(
            #resetPassword,
            [
              email,
              token,
              password,
            ],
          ),
        )),
      ) as _i6.Future<String>);

  @override
  _i6.Future<String> updatePassword({
    required String? currentPassword,
    required String? password,
    required String? passwordConfirmation,
    required String? token,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updatePassword,
          [],
          {
            #currentPassword: currentPassword,
            #password: password,
            #passwordConfirmation: passwordConfirmation,
            #token: token,
          },
        ),
        returnValue: _i6.Future<String>.value(_i8.dummyValue<String>(
          this,
          Invocation.method(
            #updatePassword,
            [],
            {
              #currentPassword: currentPassword,
              #password: password,
              #passwordConfirmation: passwordConfirmation,
              #token: token,
            },
          ),
        )),
      ) as _i6.Future<String>);

  @override
  _i6.Future<String> verifyToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #verifyToken,
          [token],
        ),
        returnValue: _i6.Future<String>.value(_i8.dummyValue<String>(
          this,
          Invocation.method(
            #verifyToken,
            [token],
          ),
        )),
      ) as _i6.Future<String>);

  @override
  _i6.Future<_i4.UserModel> getCurrentUser(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentUser,
          [token],
        ),
        returnValue: _i6.Future<_i4.UserModel>.value(_FakeUserModel_8(
          this,
          Invocation.method(
            #getCurrentUser,
            [token],
          ),
        )),
      ) as _i6.Future<_i4.UserModel>);

  @override
  _i6.Future<_i4.UserModel> updateUser({
    required _i4.UserModel? user,
    required String? token,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUser,
          [],
          {
            #user: user,
            #token: token,
          },
        ),
        returnValue: _i6.Future<_i4.UserModel>.value(_FakeUserModel_8(
          this,
          Invocation.method(
            #updateUser,
            [],
            {
              #user: user,
              #token: token,
            },
          ),
        )),
      ) as _i6.Future<_i4.UserModel>);

  @override
  _i6.Future<bool> logout(String? token) => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [token],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}

/// A class which mocks [SubscribeUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockSubscribeUser extends _i1.Mock implements _i12.SubscribeUser {
  MockSubscribeUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i5.Either<_i13.Failure, _i14.UserEntity>> call(
          {required _i4.UserModel? newUser}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#newUser: newUser},
        ),
        returnValue:
            _i6.Future<_i5.Either<_i13.Failure, _i14.UserEntity>>.value(
                _FakeEither_9<_i13.Failure, _i14.UserEntity>(
          this,
          Invocation.method(
            #call,
            [],
            {#newUser: newUser},
          ),
        )),
      ) as _i6.Future<_i5.Either<_i13.Failure, _i14.UserEntity>>);
}

/// A class which mocks [SignIn].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignIn extends _i1.Mock implements _i15.SignIn {
  MockSignIn() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i5.Either<_i13.Failure, _i14.UserEntity>> call(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [
            email,
            password,
          ],
        ),
        returnValue:
            _i6.Future<_i5.Either<_i13.Failure, _i14.UserEntity>>.value(
                _FakeEither_9<_i13.Failure, _i14.UserEntity>(
          this,
          Invocation.method(
            #call,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i6.Future<_i5.Either<_i13.Failure, _i14.UserEntity>>);
}

/// A class which mocks [VerifyToken].
///
/// See the documentation for Mockito's code generation for more information.
class MockVerifyToken extends _i1.Mock implements _i16.VerifyToken {
  MockVerifyToken() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i5.Either<_i13.Failure, _i14.UserEntity>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i6.Future<_i5.Either<_i13.Failure, _i14.UserEntity>>.value(
                _FakeEither_9<_i13.Failure, _i14.UserEntity>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i6.Future<_i5.Either<_i13.Failure, _i14.UserEntity>>);
}

/// A class which mocks [Logout].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogout extends _i1.Mock implements _i17.Logout {
  MockLogout() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i5.Either<_i13.Failure, bool>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i6.Future<_i5.Either<_i13.Failure, bool>>.value(
            _FakeEither_9<_i13.Failure, bool>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i6.Future<_i5.Either<_i13.Failure, bool>>);
}
