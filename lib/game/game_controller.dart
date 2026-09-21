import 'dart:math';
import 'package:flutter/foundation.dart';
import '../data/offices.dart';
import '../models/office.dart';

enum TurnPhase {
  ready,
  rolling,
  learning,
  question,
  feedback,
  moving,
  finished,
}

/// A turn is resolved exactly once. Reset/dispose invalidate pending animation.
class GameController extends ChangeNotifier {
  GameController({
    Random? random,
    this.rollDuration = const Duration(milliseconds: 650),
    this.stepDuration = const Duration(milliseconds: 160),
  }) : _random = random ?? Random();

  static const penalty = 2;
  final Random _random;
  final Duration rollDuration;
  final Duration stepDuration;
  int _generation = 0;
  bool _disposed = false;
  int position = 1;
  int die1 = 1;
  int die2 = 1;
  int turns = 0;
  int correctAnswers = 0;
  int? selectedAnswer;
  int destination = 1;
  int _resolvedPosition = 1;
  bool? answeredCorrectly;
  TurnPhase phase = TurnPhase.ready;
  final Set<int> learnedOffices = {};

  int get total => die1 + die2;
  Office get currentOffice => offices[position - 1];
  Office get targetOffice => offices[destination - 1];
  int get movement => _resolvedPosition - position;
  bool get canRoll => phase == TurnPhase.ready;
  bool _active(int generation) => !_disposed && generation == _generation;

  Future<void> roll() async {
    if (!canRoll || _disposed) return;
    final generation = _generation;
    phase = TurnPhase.rolling;
    selectedAnswer = null;
    answeredCorrectly = null;
    die1 = _random.nextInt(6) + 1;
    die2 = _random.nextInt(6) + 1;
    destination = min(offices.length, position + total);
    turns++;
    notifyListeners();
    await Future<void>.delayed(rollDuration);
    if (!_active(generation)) return;
    phase = TurnPhase.learning;
    learnedOffices.add(destination);
    notifyListeners();
  }

  void showQuestion() {
    if (_disposed || phase != TurnPhase.learning) return;
    phase = TurnPhase.question;
    notifyListeners();
  }

  void answer(int index) {
    if (_disposed ||
        phase != TurnPhase.question ||
        index < 0 ||
        index >= targetOffice.options.length) {
      return;
    }
    selectedAnswer = index;
    answeredCorrectly = index == targetOffice.correctIndex;
    if (answeredCorrectly!) correctAnswers++;
    _resolvedPosition = answeredCorrectly!
        ? destination
        : max(1, position - penalty);
    phase = TurnPhase.feedback;
    notifyListeners();
  }

  Future<void> continueTurn({bool animate = true}) async {
    if (_disposed || phase != TurnPhase.feedback) return;
    final generation = _generation;
    phase = TurnPhase.moving;
    notifyListeners();
    while (position != _resolvedPosition) {
      if (animate) await Future<void>.delayed(stepDuration);
      if (!_active(generation)) return;
      position += _resolvedPosition > position ? 1 : -1;
      notifyListeners();
    }
    if (!_active(generation)) return;
    phase = position == offices.length ? TurnPhase.finished : TurnPhase.ready;
    notifyListeners();
  }

  void reset() {
    if (_disposed) return;
    _generation++;
    position = destination = _resolvedPosition = 1;
    die1 = die2 = 1;
    turns = correctAnswers = 0;
    selectedAnswer = null;
    answeredCorrectly = null;
    learnedOffices.clear();
    phase = TurnPhase.ready;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    _generation++;
    super.dispose();
  }
}
