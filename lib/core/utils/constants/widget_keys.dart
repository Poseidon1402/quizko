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
}