import 'package:flutter/foundation.dart';

abstract class WidgetKeys {
  // Splash screen
  static const Key splashScreenKey = Key('splashScreenKey');
  static const Key ipAddressDialogKey = Key('ipAddressDialogKey');
  static const Key ipAddressKey = Key('ipAddressKey');
  static const Key setIpKey = Key('setIpKey');

  // Sign In
  static const Key signInScreenKey = Key('signInScreen');
  static const Key signInEmailKey = Key('signInEmail');
  static const Key signInPasswordKey = Key('signInPassword');
  static const Key signInButtonKey = Key('signInButton');
  static const Key signInErrorSnackBar = Key('signInErrorSnackBar');

  // Sign Up
  static const Key signUpScreenKey = Key('signUpScreen');
  static const Key signUpRegistrationNumberKey = Key('signUpRegistrationNumber');
  static const Key signUpFullNameKey = Key('signUpFullName');
  static const Key signUpEmailKey = Key('signUpEmail');
  static const Key signUpPasswordKey = Key('signUpPassword');
  static const Key signUpGenderKey = Key('signUpGender');
  static const Key signUpPhoneKey = Key('SignUpPhoneNumber');
  static const Key signUpClassKey = Key('signUpClassKey');
  static const Key signUpClassDialogKey = Key('signUpClassDialog');
  static const Key signUpSnackBarErrorKey = Key('signUpSnackBarError');
  static const Key signUpButtonKey = Key('signUpButton');
  static const Key signUpSuccessDialogKey = Key('signUpSuccessDialog');
  static const Key confirmKey = Key('confirmKey');

  // Main
  static const Key homeScreenKey = Key('homeScreen');

}