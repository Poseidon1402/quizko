import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_theme.dart';
import 'core/app_routes.dart';
import 'core/utils/services/injections.dart';
import 'features/auth/presentation/bloc/authentication_bloc.dart';
import 'features/home/presentation/bloc/interview_bloc.dart';

void main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Future.delayed(const Duration(milliseconds: 300));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthenticationBloc>()),
        BlocProvider(create: (_) => sl<InterviewBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) => MaterialApp.router(
          title: 'Quiz\'ko',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          routerConfig: AppRoutes.configuration,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            // AppLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('fr'),
          ],
        ),
      ),
    );
  }
}