import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recorre_tu_fiscalia/app.dart';
import 'package:recorre_tu_fiscalia/data/offices.dart';
import 'package:recorre_tu_fiscalia/game/game_controller.dart';
import 'package:recorre_tu_fiscalia/screens/game_screen.dart';
import 'package:recorre_tu_fiscalia/screens/welcome_screen.dart';
import 'package:recorre_tu_fiscalia/theme/app_theme.dart';
import 'package:recorre_tu_fiscalia/widgets/kiosk_frame.dart';
import 'package:recorre_tu_fiscalia/widgets/turn_panel.dart';
import 'game_controller_test.dart' show controller, play;

void viewport(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

Widget shell(Widget child) => MaterialApp(
  theme: buildAppTheme(),
  home: Scaffold(body: KioskFrame(child: child)),
);

void main() {
  testWidgets(
    'play, inspect without skipping, answer once, move and confirm exit',
    (tester) async {
      viewport(tester, const Size(900, 1600));
      final game = controller();
      addTearDown(game.dispose);
      var exited = false;
      await tester.pumpWidget(
        shell(GameScreen(controller: game, onHome: () => exited = true)),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const ValueKey('office-27')));
      await tester.pump();
      expect(find.text('EXPLORA · TU POSICIÓN NO CAMBIA'), findsOneWidget);
      expect(game.position, 1);
      expect(game.phase, TurnPhase.ready);
      await tester.tap(find.byKey(const ValueKey('close-preview')));
      await tester.pump();
      await tester.tap(find.byKey(const ValueKey('roll-dice')));
      await tester.pumpAndSettle();
      expect(game.position, 1);
      expect(find.text(offices[2].description), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('show-question')));
      await tester.pump();
      await tester.tap(find.byKey(const ValueKey('answer-0')));
      await tester.pump();
      expect(find.text('¡Respuesta correcta!'), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('continue-turn')));
      await tester.pumpAndSettle();
      expect(game.position, 3);
      await tester.tap(find.byKey(const ValueKey('exit-game')));
      await tester.pump();
      expect(exited, false);
      await tester.tap(find.byKey(const ValueKey('confirm-exit')));
      expect(exited, true);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('idle warning can be dismissed; abandoned sessions return home', (
    tester,
  ) async {
    viewport(tester, const Size(900, 1600));
    await tester.pumpWidget(const FiscaliaApp());
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('start-game')));
    await tester.pump();
    await tester.pump(const Duration(seconds: 150));
    expect(find.textContaining('Volveremos al inicio'), findsOneWidget);
    await tester.tap(find.text('Seguir'));
    await tester.pump();
    expect(find.textContaining('Volveremos al inicio'), findsNothing);
    await tester.pump(const Duration(seconds: 180));
    await tester.pump();
    expect(find.byKey(const ValueKey('start-game')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('start-game')));
    await tester.pump();
    expect(find.text('1 / 27'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
    expect(tester.takeException(), isNull);
  });

  for (final size in [
    const Size(540, 960),
    const Size(1080, 1920),
    const Size(2160, 3840),
    const Size(1280, 720),
  ]) {
    testWidgets('welcome, board and finish fit ${size.width}x${size.height}', (
      tester,
    ) async {
      viewport(tester, size);
      await tester.pumpWidget(shell(WelcomeScreen(onStart: () {})));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      final game = controller(die: 6);
      addTearDown(game.dispose);
      await tester.pumpWidget(
        shell(GameScreen(controller: game, onHome: () {})),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await tester.runAsync(() async {
        for (var i = 0; i < 3; i++) {
          await play(game);
        }
      });
      await tester.pumpAndSettle();
      expect(find.text('¡Felicidades!'), findsOneWidget);
      expect(find.byKey(const ValueKey('new-game')), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets(
    'all office text and question panels fit without layout exceptions',
    (tester) async {
      viewport(tester, const Size(900, 1600));
      final game = controller();
      addTearDown(game.dispose);
      for (final office in offices) {
        game.reset();
        game.position = office.id - 2;
        await tester.runAsync(game.roll);
        for (final phase in [
          TurnPhase.learning,
          TurnPhase.question,
          TurnPhase.feedback,
        ]) {
          game.phase = phase;
          game.answeredCorrectly = false;
          await tester.pumpWidget(
            shell(
              Center(
                child: SizedBox(
                  width: 844,
                  height: 590,
                  child: TurnPanel(game: game, onClosePreview: () {}),
                ),
              ),
            ),
          );
          await tester.pump();
          expect(tester.takeException(), isNull, reason: '${office.id} $phase');
        }
      }
    },
  );
}
