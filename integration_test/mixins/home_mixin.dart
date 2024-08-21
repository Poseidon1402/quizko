import 'package:flutter_test/flutter_test.dart';
import 'package:quizko/core/utils/constants/widget_keys.dart';

mixin HomeMixin {
  void verifyIfUserIsOnTheHomePage() {
    final homeScreen = find.byKey(WidgetKeys.homeScreenKey);
    expect(homeScreen, findsOneWidget);
  }
}