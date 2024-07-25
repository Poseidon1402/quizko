import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:quizko/features/auth/data/source/authentication_source.dart';
import 'package:quizko/features/auth/domain/usecases/logout.dart';
import 'package:quizko/features/auth/domain/usecases/sign_in.dart';
import 'package:quizko/features/auth/domain/usecases/subscribe_user.dart';
import 'package:quizko/features/auth/domain/usecases/verify_token.dart';

@GenerateMocks([
  // Services
  http.Client,
  FlutterSecureStorage,
  // Sources
  AuthenticationSource,
  // Use cases
  SubscribeUser,
  SignIn,
  VerifyToken,
  Logout,
])
void main() {}
