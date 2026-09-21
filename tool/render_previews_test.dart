// Run explicitly; writes review images to the ignored build/previews directory.
// flutter test tool/render_previews_test.dart --dart-define=FLUTTER_SDK=/path/to/flutter
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recorre_tu_fiscalia/game/game_controller.dart';
import 'package:recorre_tu_fiscalia/screens/game_screen.dart';
import 'package:recorre_tu_fiscalia/screens/welcome_screen.dart';
import 'package:recorre_tu_fiscalia/theme/app_theme.dart';
import 'package:recorre_tu_fiscalia/widgets/kiosk_frame.dart';
import '../test/game_controller_test.dart' show controller, play;

void main() {
  testWidgets('render review previews', (tester) async {
    const sdk = String.fromEnvironment('FLUTTER_SDK');
    expect(
      sdk,
      isNotEmpty,
      reason: 'Pass --dart-define=FLUTTER_SDK=/path/to/flutter',
    );
    tester.view.physicalSize = const Size(900, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.runAsync(() async {
      final loader = FontLoader('Roboto');
      for (final name in ['Regular', 'Medium', 'Bold', 'Black']) {
        final bytes = await File(
          '$sdk/bin/cache/artifacts/material_fonts/Roboto-$name.ttf',
        ).readAsBytes();
        loader.addFont(Future.value(ByteData.sublistView(bytes)));
      }
      await loader.load();
      final icons = FontLoader('MaterialIcons');
      icons.addFont(
        Future.value(
          ByteData.sublistView(
            await File(
              '$sdk/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf',
            ).readAsBytes(),
          ),
        ),
      );
      await icons.load();
    });
    final boundaryKey = GlobalKey();
    Future<void> mount(Widget child) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: buildAppTheme(),
          home: Scaffold(
            body: RepaintBoundary(
              key: boundaryKey,
              child: KioskFrame(child: child),
            ),
          ),
        ),
      );
      await tester.runAsync(() async {
        for (final element in find.byType(Image).evaluate()) {
          await precacheImage((element.widget as Image).image, element);
        }
      });
      await tester.pumpAndSettle();
    }

    Future<void> save(String name) async {
      await tester.pumpAndSettle();
      await tester.runAsync(() async {
        for (final element in find.byType(Image).evaluate()) {
          await precacheImage((element.widget as Image).image, element);
        }
      });
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await tester.runAsync(() async {
        final boundary =
            boundaryKey.currentContext!.findRenderObject()!
                as RenderRepaintBoundary;
        final image = await boundary.toImage();
        final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
        final file = File('build/previews/$name.png');
        await file.parent.create(recursive: true);
        await file.writeAsBytes(bytes!.buffer.asUint8List());
        image.dispose();
      });
    }

    await mount(WelcomeScreen(onStart: () {}));
    await save('inicio');
    final game = controller(die: 3);
    addTearDown(game.dispose);
    await mount(GameScreen(controller: game, onHome: () {}));
    await save('tablero');
    await tester.runAsync(game.roll);
    await save('oficina');
    game.showQuestion();
    await save('pregunta');
    game.answer(game.targetOffice.correctIndex);
    await save('respuesta');
    await tester.runAsync(() async {
      await game.continueTurn(animate: false);
      while (game.phase != TurnPhase.finished) {
        await play(game);
      }
    });
    await save('final');
  });
}
