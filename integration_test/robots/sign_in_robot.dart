import 'package:flutter_test/flutter_test.dart';
import 'package:quizko/core/utils/constants/widget_keys.dart';

class SignInRobot {
  final WidgetTester tester;

  SignInRobot({required this.tester});
  
  void verify() {
    final loginScreen = find.byKey(WidgetKeys.signInScreenKey);
    expect(loginScreen, findsOneWidget);
  }
  
  Future<void> enterEmail(String email) async {
    final emailField = find.byKey(WidgetKeys.signInEmailKey);
    expect(emailField, findsOneWidget);
    await tester.enterText(emailField, email);
    await tester.pump();
  }
  
  Future<void> enterPassword(String password) async {
    final passwordField = find.byKey(WidgetKeys.signInPasswordKey);
    expect(passwordField, findsOneWidget);
    await tester.enterText(passwordField, password);
    await tester.pump();
  }
  
  Future<void> tapSignInButton() async {
    final signInButton = find.byKey(WidgetKeys.signInButtonKey);
    expect(signInButton, findsOneWidget);
    await tester.tap(signInButton);
    await tester.pumpAndSettle();
  }

  void verifyError() {
    final errorSnackBar = find.byKey(WidgetKeys.signInErrorSnackBar);
    expect(errorSnackBar, findsOneWidget);
  }

  void verifySuccess() {
    final homeScreen = find.byKey(WidgetKeys.homeScreenKey);
    expect(homeScreen, findsOneWidget);
  }
}