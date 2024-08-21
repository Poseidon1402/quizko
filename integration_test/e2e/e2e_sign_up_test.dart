import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quizko/core/utils/services/injections.dart' as di;
import 'package:quizko/main.dart';

import '../robots/robots.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late SplashRobot splashRobot;
  late SignInRobot signInRobot;
  late SignUpRobot signUpRobot;

  setUpAll(() async {
    di.setup();
  });

  tearDownAll(() {
    di.sl.reset(dispose: true);
  });

  testWidgets('Subscription flow', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    splashRobot = SplashRobot(tester: tester);

    splashRobot.verify();
    await splashRobot.enterIpAddress('192.168.1.102:5556');
    await tester.pumpAndSettle(const Duration(seconds: 3));

    signInRobot = SignInRobot(tester: tester);
    signInRobot.verify();

    signUpRobot = SignUpRobot(tester: tester);

    await signUpRobot.redirectToSignUp();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    signUpRobot.verify();

    // Failure flow
    await signUpRobot.enterRegistrationNumber();
    await signUpRobot.enterFullName(Faker().person.name());
    await signUpRobot.enterEmail('rjls.tiavina@gmail.com');
    await signUpRobot.enterPassword('123456789');
    await signUpRobot.pickGender();
    await signUpRobot.enterPhoneNumber('0321100057');
    await signUpRobot.pickClass();
    await signUpRobot.tapSubscribeButton();
    signUpRobot.verifySnackBarError();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Success flow
    String fakeEmail = Faker().internet.email();
    await signUpRobot.enterEmail(fakeEmail);
    await signUpRobot.tapSubscribeButton();
    await tester.pumpAndSettle(const Duration(seconds: 3));
    signUpRobot.verifySuccessDialog();
    await signUpRobot.tapOnConfirmButton();
    await tester.pumpAndSettle(const Duration(milliseconds: 300));
    signUpRobot.verifyIfUserIsOnTheHomePage();
  });
}