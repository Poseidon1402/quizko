import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../../features/account/data/repository/class_repository_impl.dart';
import '../../../features/account/data/source/class_source.dart';
import '../../../features/account/domain/repository/class_repository.dart';
import '../../../features/account/domain/usecases/fetch_classes.dart';
import '../../../features/account/domain/usecases/update_user.dart';
import '../../../features/account/presentation/bloc/class/class_bloc.dart';
import '../../../features/auth/data/repository/authentication_repository_impl.dart';
import '../../../features/auth/data/source/authentication_source.dart';
import '../../../features/auth/domain/repository/authentication_repository.dart';
import '../../../features/auth/domain/usecases/forgot_password.dart';
import '../../../features/auth/domain/usecases/logout.dart';
import '../../../features/auth/domain/usecases/reset_password.dart';
import '../../../features/auth/domain/usecases/sign_in.dart';
import '../../../features/auth/domain/usecases/subscribe_user.dart';
import '../../../features/auth/domain/usecases/update_password.dart';
import '../../../features/auth/domain/usecases/verify_reset_code.dart';
import '../../../features/auth/domain/usecases/verify_token.dart';
import '../../../features/auth/presentation/bloc/authentication_bloc.dart';
import '../../../features/home/data/repository/interview_repository_impl.dart';
import '../../../features/home/data/source/interview_source.dart';
import '../../../features/home/domain/repository/interview_repository.dart';
import '../../../features/home/domain/usecases/fetch_interviews.dart';
import '../../../features/home/domain/usecases/fetch_marks.dart';
import '../../../features/home/presentation/bloc/interview_bloc.dart';
import '../../../features/quiz/presentation/bloc/quiz_bloc.dart';
import '../../../features/result/data/source/result_source.dart';
import '../../../features/result/domain/usecases/fetch_corrections.dart';

final sl = GetIt.instance;

void setup() {
  // Bloc
  sl.registerFactory(
    () => AuthenticationBloc(
      subscribeUser: sl(),
      signIn: sl(),
      verifyToken: sl(),
      logout: sl(),
    ),
  );
  sl.registerFactory(
    () => InterviewBloc(
      fetchInterviews: sl(),
      fetchCorrections: sl(),
    ),
  );
  sl.registerFactory(
    () => QuizBloc(fetchMark: sl()),
  );
  sl.registerFactory(
    () => ClassBloc(fetchClasses: sl()),
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
  sl.registerLazySingleton<FetchCorrections>(
    () => FetchCorrectionsImpl(repository: sl()),
  );
  sl.registerLazySingleton<Logout>(
    () => LogoutImpl(repository: sl()),
  );
  sl.registerLazySingleton<ForgotPassword>(
    () => ForgotPasswordImpl(repository: sl()),
  );
  sl.registerLazySingleton<VerifyResetCode>(
    () => VerifyResetCodeImpl(repository: sl()),
  );
  sl.registerLazySingleton<ResetPassword>(
    () => ResetPasswordImpl(repository: sl()),
  );
  sl.registerLazySingleton<VerifyToken>(
    () => VerifyTokenImpl(repository: sl()),
  );
  sl.registerLazySingleton<UpdatePassword>(
    () => UpdatePasswordImpl(repository: sl()),
  );
  sl.registerLazySingleton<UpdateUser>(
    () => UpdateUserImpl(repository: sl()),
  );
  sl.registerLazySingleton<FetchClasses>(
    () => FetchClassesImpl(repository: sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      source: sl(),
      secureStorage: sl(),
    ),
  );
  sl.registerLazySingleton<InterviewRepository>(
    () => InterviewRepositoryImpl(
      interviewSource: sl(),
      resultSource: sl(),
      secureStorage: sl(),
    ),
  );
  sl.registerLazySingleton<ClassRepository>(
    () => ClassRepositoryImpl(source: sl()),
  );

  // Data Sources
  sl.registerLazySingleton<AuthenticationSource>(
    () => AuthenticationSourceImpl(httpClient: sl()),
  );
  sl.registerLazySingleton<InterviewSource>(
    () => InterviewSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<ResultSource>(
    () => ResultSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<ClassSource>(
    () => ClassSourceImpl(client: sl()),
  );

  // Other Services
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    ),
  );
}
