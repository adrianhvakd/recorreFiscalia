import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recorre_tu_fiscalia/screens/welcome_screen.dart';
import 'package:recorre_tu_fiscalia/screens/game_screen.dart';
import 'package:recorre_tu_fiscalia/theme/app_theme.dart';
import 'package:recorre_tu_fiscalia/widgets/kiosk_frame.dart';

void main() {
  for (final size in [
    const Size(390, 844),
    const Size(412, 915),
    const Size(360, 800),
    const Size(2160, 3840),
  ]) {
    testWidgets('fills portrait viewport $size without bands or overflow', (
      tester,
    ) async {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      for (final screen in [
        WelcomeScreen(onStart: () {}),
        GameScreen(onHome: () {}),
      ]) {
        final surface = GlobalKey();
        await tester.pumpWidget(
          MaterialApp(
            theme: buildAppTheme(),
            home: Scaffold(
              body: KioskFrame(
                child: SizedBox(key: surface, child: screen),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        final bounds = tester.getRect(find.byKey(surface));
        expect(bounds.left, closeTo(0, .01));
        expect(bounds.top, closeTo(0, .01));
        expect(bounds.width, closeTo(size.width, .01));
        expect(bounds.height, closeTo(size.height, .01));
        final scroll = tester.state<ScrollableState>(
          find.byType(Scrollable).first,
        );
        expect(scroll.position.maxScrollExtent, closeTo(0, .01));
        expect(tester.takeException(), isNull);
      }
    });
  }

  testWidgets(
    'short displays can scroll to the start button without cropping',
    (tester) async {
      tester.view.physicalSize = const Size(800, 1000);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      var started = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: buildAppTheme(),
          home: Scaffold(
            body: KioskFrame(
              child: WelcomeScreen(onStart: () => started = true),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byKey(const ValueKey('start-game')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const ValueKey('start-game')));
      expect(started, true);
      expect(tester.takeException(), isNull);
    },
  );
}
