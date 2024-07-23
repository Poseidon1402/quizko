import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:quizko/features/auth/data/source/authentication_source.dart';

@GenerateMocks([
  // Services
  http.Client,
  FlutterSecureStorage,
  // Sources
  AuthenticationSource,
])
void main() {}
