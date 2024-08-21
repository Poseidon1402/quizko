import 'package:flutter_test/flutter_test.dart';
import 'package:quizko/core/utils/constants/widget_keys.dart';

import '../mixins/mixins.dart';

class SignUpRobot with HomeMixin {
  final WidgetTester tester;

  SignUpRobot({required this.tester});

  Future<void> redirectToSignUp() async {
    await tester.tapOnText(find.textRange.ofSubstring('Sign up'));
  }

  void verify() {
    final signUpScreen = find.byKey(WidgetKeys.signUpScreenKey);
    expect(signUpScreen, findsOneWidget);
  }

  Future<void> enterRegistrationNumber() async {
    final registrationNumberField =
        find.byKey(WidgetKeys.signUpRegistrationNumberKey);
    expect(registrationNumberField, findsOneWidget);
    await tester.enterText(registrationNumberField, '1235');
    await tester.pump(const Duration(seconds: 1));
  }

  Future<void> enterFullName(String name) async {
    final fullNameField = find.byKey(WidgetKeys.signUpFullNameKey);
    expect(fullNameField, findsOneWidget);
    await tester.enterText(fullNameField, name);
    await tester.pump(const Duration(seconds: 1));
  }

  Future<void> enterEmail(String email) async {
    final emailField = find.byKey(WidgetKeys.signUpEmailKey);
    expect(emailField, findsOneWidget);
    await tester.enterText(emailField, email);
    await tester.pump(const Duration(seconds: 1));
  }

  Future<void> enterPassword(String password) async {
    final passwordField = find.byKey(WidgetKeys.signUpPasswordKey);
    expect(passwordField, findsOneWidget);
    await tester.enterText(passwordField, password);
    await tester.pump(const Duration(seconds: 1));
  }

  Future<void> pickGender() async {
    final genderField = find.byKey(WidgetKeys.signUpGenderKey);
    expect(genderField, findsOneWidget);
    await tester.tap(genderField);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.text('Male').first);
    await tester.pump(const Duration(seconds: 1));
  }

  Future<void> enterPhoneNumber(String phone) async {
    final phoneField = find.byKey(WidgetKeys.signUpPhoneKey);
    expect(phoneField, findsOneWidget);
    await tester.enterText(phoneField, phone);
    await tester.pump(const Duration(seconds: 1));
  }

  Future<void> pickClass() async {
    final classField = find.byKey(WidgetKeys.signUpClassKey);
    expect(classField, findsOneWidget);
    await tester.tap(classField);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final classDialog = find.byKey(WidgetKeys.signUpClassDialogKey);
    expect(classDialog, findsOneWidget);
    await tester.pump(const Duration(milliseconds: 300));

    final classItem = find.text('M1 GB');
    expect(classItem, findsOneWidget);
    await tester.tap(classItem);
    await tester.pump(const Duration(milliseconds: 300));
  }

  Future<void> tapSubscribeButton() async {
    final subscribeButton = find.byKey(WidgetKeys.signUpButtonKey);
    expect(subscribeButton, findsOneWidget);
    await tester.tap(subscribeButton);
    await tester.pump(const Duration(seconds: 1));
  }

  void verifySnackBarError() {
    final snackBarError = find.byKey(WidgetKeys.signUpSnackBarErrorKey);
    expect(snackBarError, findsOneWidget);
  }

  void verifySuccessDialog() {
    final dialog = find.byKey(WidgetKeys.signUpSuccessDialogKey);
    expect(dialog, findsOneWidget);
  }

  Future<void> tapOnConfirmButton() async {
    final button = find.byKey(WidgetKeys.confirmKey);
    await tester.tap(button);
    await tester.pumpAndSettle(const Duration(milliseconds: 300));
  }
}
