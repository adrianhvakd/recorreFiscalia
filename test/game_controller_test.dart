import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:recorre_tu_fiscalia/data/offices.dart';
import 'package:recorre_tu_fiscalia/game/game_controller.dart';

class FixedRandom implements Random {
  FixedRandom(this.value);
  final int value;
  @override
  int nextInt(int max) => value % max;
  @override
  bool nextBool() => true;
  @override
  double nextDouble() => 0;
}

GameController controller({int die = 1}) => GameController(
  random: FixedRandom(die - 1),
  rollDuration: Duration.zero,
  stepDuration: Duration.zero,
);

Future<void> play(GameController game, {bool correct = true}) async {
  await game.roll();
  game.showQuestion();
  game.answer(
    correct
        ? game.activeQuestion!.correctIndex
        : (game.activeQuestion!.correctIndex + 1) % 3,
  );
  await game.continueTurn(animate: false);
}

void main() {
  test('preserves all 27 original names and descriptions', () {
    final original =
        jsonDecode(
              File('test/fixtures/original_offices.json').readAsStringSync(),
            )
            as List;
    expect(offices.length, 27);
    expect(
      offices.map((office) => office.id),
      List.generate(27, (index) => index + 1),
    );
    for (var index = 0; index < original.length; index++) {
      final office = offices[index];
      final source = original[index] as Map<String, dynamic>;
      expect(office.name, source['name']);
      expect(office.description, source['description']);
      expect(office.questions.length, 5);
      for (final question in office.questions) {
        expect(question.question, isNotEmpty);
        expect(question.options.length, 3);
        expect(question.correctIndex, inInclusiveRange(0, 2));
      }
      expect(office.floor, inInclusiveRange(1, 5));
    }
  });

  test('all 135 questions and answer keys match the supplied bank', () {
    final source = File(
      'BANCO DE 135 PREGUNTAS.md',
    ).readAsStringSync().replaceAll(r'\.', '.');
    final matches = RegExp(
      r'\*\*Pregunta \d+\.\*\* (.*?)\n\n'
      r'A\) (.*?)\s*\nB\) (.*?)\s*\nC\) (.*?)\s*\n\n'
      r'✅ \*\*Correcta: ([ABC])\*\*',
    ).allMatches(source).toList();
    final questions = offices.expand((office) => office.questions).toList();
    expect(matches.length, 135);
    expect(questions.length, matches.length);
    for (var i = 0; i < matches.length; i++) {
      final match = matches[i];
      expect(questions[i].question, match[1]);
      expect(questions[i].options, [
        'A) ${match[2]}',
        'B) ${match[3]}',
        'C) ${match[4]}',
      ]);
      expect(questions[i].correctIndex, 'ABC'.indexOf(match[5]!));
    }
  });

  test(
    'each of the five questions can be selected and stays fixed for a turn',
    () async {
      for (var index = 0; index < 5; index++) {
        final game = controller(die: index + 1);
        addTearDown(game.dispose);
        expect(game.activeQuestion, isNull);
        await game.roll();
        final question = game.targetOffice.questions[index];
        expect(game.activeQuestion, same(question));
        game.showQuestion();
        game.showQuestion();
        await game.roll(); // A repeated roll cannot change an active question.
        expect(game.activeQuestion, same(question));
        game.answer(question.correctIndex);
        expect(game.answeredCorrectly, true);
        expect(game.activeQuestion, same(question));
        await game.continueTurn(animate: false);
        game.reset();
        expect(game.activeQuestion, isNull);
      }
    },
  );

  test(
    'revisiting an office draws again from its own five questions',
    () async {
      final game = GameController(
        random: Random(42),
        rollDuration: Duration.zero,
        stepDuration: Duration.zero,
      );
      addTearDown(game.dispose);
      final seen = <int>{};
      for (var turn = 0; turn < 100; turn++) {
        game.position = 25; // Every roll reaches the auditorium.
        await game.roll();
        final question = game.activeQuestion!;
        seen.add(offices.last.questions.indexOf(question));
        game.showQuestion();
        game.answer((question.correctIndex + 1) % 3);
        expect(game.answeredCorrectly, false);
        expect(game.activeQuestion, same(question));
        await game.continueTurn(animate: false);
      }
      expect(seen, {0, 1, 2, 3, 4});
    },
  );

  test(
    'does not advance before answering; a correct answer advances the sum',
    () async {
      final game = controller(die: 3);
      addTearDown(game.dispose);
      await game.roll();
      expect(game.position, 1);
      expect(game.destination, 7);
      expect(game.phase, TurnPhase.learning);
      game.answer(0); // Cannot skip reading to answer.
      expect(game.phase, TurnPhase.learning);
      game.showQuestion();
      game.answer(game.activeQuestion!.correctIndex);
      expect(game.position, 1);
      expect(game.movement, 6);
      await game.continueTurn(animate: false);
      expect(game.position, 7);
      expect(game.correctAnswers, 1);
      expect(game.phase, TurnPhase.ready);
    },
  );

  test(
    'wrong answer retreats two from current position, never below start',
    () async {
      final game = controller();
      addTearDown(game.dispose);
      await play(game, correct: false);
      expect(game.position, 1);
      await play(game);
      expect(game.position, 3);
      await play(game, correct: false);
      expect(game.position, 1);
      expect(game.correctAnswers, 1);
      expect(game.turns, 3);
    },
  );

  test(
    'rapid rolls and repeated answers cannot resolve multiple turns',
    () async {
      final game = controller();
      addTearDown(game.dispose);
      final first = game.roll();
      await game.roll();
      await first;
      expect(game.turns, 1);
      game.showQuestion();
      game.answer(-1);
      expect(game.phase, TurnPhase.question);
      game.answer(game.activeQuestion!.correctIndex);
      game.answer((game.activeQuestion!.correctIndex + 1) % 3);
      expect(game.answeredCorrectly, true);
      expect(game.correctAnswers, 1);
      await Future.wait([game.continueTurn(), game.continueTurn()]);
      expect(game.position, 3);
    },
  );

  test(
    'overshooting requires a correct final answer; failure cannot win',
    () async {
      final game = controller(die: 6);
      addTearDown(game.dispose);
      await play(game);
      await play(game);
      expect(game.position, 25);
      await game.roll();
      expect(game.destination, 27);
      game.showQuestion();
      game.answer((game.activeQuestion!.correctIndex + 1) % 3);
      await game.continueTurn(animate: false);
      expect(game.position, 23);
      expect(game.phase, TurnPhase.ready);
      await play(game);
      expect(game.position, 27);
      expect(game.phase, TurnPhase.finished);
      final turns = game.turns;
      await game.roll();
      expect(game.turns, turns);
    },
  );

  test('reset cancels pending dice and movement work', () async {
    final game = controller();
    addTearDown(game.dispose);
    final rolling = game.roll();
    game.reset();
    await rolling;
    expect(game.phase, TurnPhase.ready);
    expect(game.turns, 0);
    await game.roll();
    game.showQuestion();
    game.answer(game.activeQuestion!.correctIndex);
    final moving = game.continueTurn();
    game.reset();
    await moving;
    expect(game.position, 1);
    expect(game.learnedOffices, isEmpty);
    expect(game.correctAnswers, 0);
  });

  test('dispose cancels pending asynchronous notifications', () async {
    final game = controller();
    final rolling = game.roll();
    game.dispose();
    await rolling;
  });

  test('many independent sessions stay bounded and reset completely', () async {
    final game = GameController(
      random: Random(83),
      rollDuration: Duration.zero,
      stepDuration: Duration.zero,
    );
    addTearDown(game.dispose);
    for (var session = 0; session < 30; session++) {
      for (
        var turn = 0;
        turn < 200 && game.phase != TurnPhase.finished;
        turn++
      ) {
        await play(game, correct: turn % 3 != 0);
        expect(game.position, inInclusiveRange(1, 27));
        expect(game.die1, inInclusiveRange(1, 6));
        expect(game.die2, inInclusiveRange(1, 6));
      }
      expect(game.phase, TurnPhase.finished);
      game.reset();
      expect(game.position, 1);
      expect(game.turns, 0);
      expect(game.learnedOffices, isEmpty);
    }
  });
}
