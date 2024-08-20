import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quizko/core/utils/services/injections.dart' as di;
import 'package:quizko/main.dart';

import '../robots/sign_in_robot.dart';
import '../robots/splash_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late SplashRobot splashRobot;
  late SignInRobot signInRobot;

  setUpAll(() async {
    di.setup();
  });

  tearDownAll(() {
    di.sl.reset(dispose: true);
  });

  testWidgets('Authentication flow', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    splashRobot = SplashRobot(tester: tester);

    splashRobot.verify();
    await splashRobot.enterIpAddress('192.168.1.101:5556');
    await tester.pumpAndSettle(const Duration(seconds: 3));

    signInRobot = SignInRobot(tester: tester);

    // Unauthenticated flow
    signInRobot.verify();
    await signInRobot.enterEmail('rjls.tiavina@gmail.com');
    await signInRobot.enterPassword('1234567890');
    await signInRobot.tapSignInButton();
    signInRobot.verifyError();

    // Authenticated flow
    signInRobot.verify();
    await signInRobot.enterPassword('123456789');
    await signInRobot.tapSignInButton();
    await tester.pumpAndSettle(const Duration(seconds: 3));
    signInRobot.verifySuccess();

    await tester.pumpAndSettle();
  });
}