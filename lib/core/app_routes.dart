import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/account/presentation/screens/account_screen.dart';
import '../features/account/presentation/screens/update_password_screen.dart';
import '../features/auth/presentation/screens/create_new_password_screen.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/sign_in_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/main/presentation/screens/main_screen.dart';
import '../features/quiz/presentation/screens/mark_screen.dart';
import '../features/quiz/presentation/screens/quiz_screen.dart';
import '../features/result/presentation/screens/result_screen.dart';
import '../features/settings/presentation/screens/setting_screen.dart';
import 'utils/constants/routes.dart';

abstract class AppRoutes {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final configuration = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.login,
    routes: [
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
          child: const QuizScreen(),
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
          child: const MarkScreen(),
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
        path: Routes.createNewPassword,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          key: state.pageKey,
          child: const CreateNewPasswordScreen(),
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
