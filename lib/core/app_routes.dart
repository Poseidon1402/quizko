import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/account/presentation/screens/account_screen.dart';
import '../features/account/presentation/screens/update_password_screen.dart';
import '../features/auth/presentation/screens/create_new_password_screen.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/forgot_password_verification_code_screen.dart';
import '../features/auth/presentation/screens/sign_in_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/home/domain/entity/interview_entity.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/home/presentation/screens/see_all_quiz.dart';
import '../features/main/presentation/screens/main_screen.dart';
import '../features/quiz/presentation/screens/mark_screen.dart';
import '../features/quiz/presentation/screens/quiz_screen.dart';
import '../features/result/presentation/screens/answer_screen.dart';
import '../features/result/presentation/screens/result_screen.dart';
import '../features/settings/presentation/screens/about_screen.dart';
import '../features/settings/presentation/screens/setting_screen.dart';
import 'utils/constants/routes.dart';

abstract class AppRoutes {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final configuration = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.entryPoint,
    routes: [
      GoRoute(
        path: Routes.entryPoint,
        builder: (context, state) => const SplashScreen(),
        /*redirect: (context, state) {
          final state = context.watch<AuthenticationBloc>().state;

          if (state is AuthenticatedState) {
            return Routes.home;
          } else if (state is UnauthenticatedState) {
            return Routes.login;
          }

          return null;
        },*/
      ),
      GoRoute(
        path: Routes.login,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          key: state.pageKey,
          child: const SignInScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.linear).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: Routes.subscribe,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          key: state.pageKey,
          child: const SignUpScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.linear).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.quiz,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          key: state.pageKey,
          child: QuizScreen(
            interview: state.extra as InterviewEntity,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.linear).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.mark,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          key: state.pageKey,
          child: MarkScreen(
            mark: state.extra as int,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.linear).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: Routes.forgotPassword,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          key: state.pageKey,
          child: const ForgotPasswordScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.linear).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.updatePassword,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          key: state.pageKey,
          child: const UpdatePasswordScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.linear).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.about,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          key: state.pageKey,
          child: const AboutScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.linear).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.seeAllQuiz,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          key: state.pageKey,
          child: const SeeAllQuiz(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.linear).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: Routes.forgotPasswordCode,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          key: state.pageKey,
          child: ForgotPasswordVerificationCodeScreen(
              email: state.queryParameters['email'] ?? ''),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.linear).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: Routes.createNewPassword,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          key: state.pageKey,
          child: CreateNewPasswordScreen(
            email: state.queryParameters['email'] ?? '',
            token: state.queryParameters['token'] ?? '',
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.linear).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.userAnswer,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          key: state.pageKey,
          child: AnswerScreen(
            interviewId: state.queryParameters['interview'] ?? '',
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.linear).animate(animation),
              child: child,
            );
          },
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.home,
                pageBuilder: (context, state) => CustomTransitionPage(
                  transitionDuration: const Duration(seconds: 1),
                  reverseTransitionDuration: const Duration(seconds: 1),
                  key: state.pageKey,
                  child: const HomeScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity:
                          CurveTween(curve: Curves.linear).animate(animation),
                      child: child,
                    );
                  },
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.result,
                pageBuilder: (context, state) => CustomTransitionPage(
                  transitionDuration: const Duration(seconds: 1),
                  reverseTransitionDuration: const Duration(seconds: 1),
                  key: state.pageKey,
                  child: const ResultScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity:
                          CurveTween(curve: Curves.linear).animate(animation),
                      child: child,
                    );
                  },
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.setting,
                pageBuilder: (context, state) => CustomTransitionPage(
                  transitionDuration: const Duration(seconds: 1),
                  reverseTransitionDuration: const Duration(seconds: 1),
                  key: state.pageKey,
                  child: const SettingScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity:
                          CurveTween(curve: Curves.linear).animate(animation),
                      child: child,
                    );
                  },
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.account,
                pageBuilder: (context, state) => CustomTransitionPage(
                  transitionDuration: const Duration(seconds: 1),
                  reverseTransitionDuration: const Duration(seconds: 1),
                  key: state.pageKey,
                  child: const AccountScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity:
                          CurveTween(curve: Curves.linear).animate(animation),
                      child: child,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
