import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../../features/auth/data/repository/authentication_repository_impl.dart';
import '../../../features/auth/data/source/authentication_source.dart';
import '../../../features/auth/domain/repository/authentication_repository.dart';
import '../../../features/auth/domain/usecases/sign_in.dart';
import '../../../features/auth/domain/usecases/subscribe_user.dart';
import '../../../features/auth/presentation/bloc/authentication_bloc.dart';
import '../../../features/home/data/repository/interview_repository_impl.dart';
import '../../../features/home/data/source/interview_source.dart';
import '../../../features/home/domain/repository/interview_repository.dart';
import '../../../features/home/domain/usecases/fetch_interviews.dart';
import '../../../features/home/domain/usecases/fetch_marks.dart';
import '../../../features/home/presentation/bloc/interview_bloc.dart';
import '../../../features/quiz/presentation/bloc/quiz_bloc.dart';

final sl = GetIt.instance;

void setup() {
  // Bloc
  sl.registerFactory(
    () => AuthenticationBloc(
      subscribeUser: sl(),
      signIn: sl(),
    ),
  );
  sl.registerFactory(
    () => InterviewBloc(fetchInterviews: sl()),
  );
  sl.registerFactory(
    () => QuizBloc(fetchMark: sl()),
  );

  // Use cases
  sl.registerLazySingleton<SubscribeUser>(
    () => SubscribeUserImpl(repository: sl()),
  );
  sl.registerLazySingleton<SignIn>(
    () => SignInImpl(repository: sl()),
  );
  sl.registerLazySingleton<FetchInterviews>(
    () => FetchInterviewsImpl(repository: sl()),
  );
  sl.registerLazySingleton<FetchMarks>(
    () => FetchMarksImpl(repository: sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      source: sl(),
      secureStorage: sl(),
    ),
  );
  sl.registerLazySingleton<InterviewRepository>(
    () => InterviewRepositoryImpl(source: sl(), secureStorage: sl()),
  );

  // Data Sources
  sl.registerLazySingleton<AuthenticationSource>(
    () => AuthenticationSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<InterviewSource>(
    () => InterviewSourceImpl(client: sl()),
  );

  // Other Services
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    ),
  );
}
