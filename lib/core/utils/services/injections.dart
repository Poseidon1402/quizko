import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../../features/auth/data/repository/authentication_repository_impl.dart';
import '../../../features/auth/data/source/authentication_source.dart';
import '../../../features/auth/domain/repository/authentication_repository.dart';
import '../../../features/auth/domain/usecases/sign_in.dart';
import '../../../features/auth/domain/usecases/subscribe_user.dart';
import '../../../features/auth/presentation/bloc/authentication_bloc.dart';

final sl = GetIt.instance;

void setup() {
  // Bloc
  sl.registerFactory(
    () => AuthenticationBloc(
      subscribeUser: sl(),
      signIn: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<SubscribeUser>(
    () => SubscribeUserImpl(repository: sl()),
  );
  sl.registerLazySingleton<SignIn>(
    () => SignInImpl(repository: sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      source: sl(),
      secureStorage: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<AuthenticationSource>(
    () => AuthenticationSourceImpl(client: sl()),
  );

  // Other Services
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    ),
  );
}
