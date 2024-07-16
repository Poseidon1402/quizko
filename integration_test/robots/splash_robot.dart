import 'package:flutter_test/flutter_test.dart';
import 'package:quizko/core/utils/constants/widget_keys.dart';

class SplashRobot {
  final WidgetTester tester;
  
  SplashRobot({required this.tester});
  
  void verify() {
    final splashScreen = find.byKey(WidgetKeys.splashScreenKey);
    expect(splashScreen, findsOneWidget);
    final ipDialog = find.byKey(WidgetKeys.ipAddressDialogKey);
    expect(ipDialog, findsOneWidget);
  }

  Future<void> enterIpAddress(String ipAddress) async {
    final ipTextField = find.byKey(WidgetKeys.ipAddressDialogKey);
    await tester.enterText(ipTextField, ipAddress);
    final button = find.byKey(WidgetKeys.setIpKey);
    await tester.tap(button);
    await tester.pumpAndSettle();
  }
}