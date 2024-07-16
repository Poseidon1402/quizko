import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quizko/main.dart';

import '../robots/sign_in_robot.dart';
import '../robots/splash_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late SplashRobot splashRobot;
  late SignInRobot signInRobot;

  group('E2E authentication', () {
    testWidgets('Unauthenticated Flow', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      splashRobot = SplashRobot(tester: tester);

      splashRobot.verify();
      await splashRobot.enterIpAddress('10.0.2.2:5556');

      signInRobot = SignInRobot(tester: tester);

      signInRobot.verify();
      await signInRobot.enterEmail('rjls.tiavina@gmail.com');
      await signInRobot.enterPassword('123456789');

    });
  });
}