import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:quizko/features/account/data/source/class_source.dart';
import 'package:quizko/features/auth/data/source/authentication_source.dart';
import 'package:quizko/features/auth/domain/usecases/logout.dart';
import 'package:quizko/features/auth/domain/usecases/sign_in.dart';
import 'package:quizko/features/auth/domain/usecases/subscribe_user.dart';
import 'package:quizko/features/auth/domain/usecases/verify_token.dart';
import 'package:quizko/features/home/data/source/interview_source.dart';
import 'package:quizko/features/home/domain/usecases/fetch_interviews.dart';
import 'package:quizko/features/result/data/source/result_source.dart';
import 'package:quizko/features/result/domain/usecases/fetch_corrections.dart';

@GenerateMocks([
  // Services
  http.Client,
  FlutterSecureStorage,
  // Sources
  AuthenticationSource,
  InterviewSource,
  ResultSource,
  ClassSource,
  // Use cases
  SubscribeUser,
  SignIn,
  VerifyToken,
  Logout,
  FetchInterviews,
  FetchCorrections,
])
void main() {}
