import 'package:flutter/material.dart';
import '../game/game_controller.dart';
import '../models/office.dart';
import '../theme/app_theme.dart';
import 'dice.dart';

class TurnPanel extends StatelessWidget {
  const TurnPanel({
    super.key,
    required this.game,
    this.preview,
    required this.onClosePreview,
  });
  final GameController game;
  final Office? preview;
  final VoidCallback onClosePreview;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(26),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(26),
      border: Border.all(color: AppColors.line),
    ),
    child: preview != null
        ? _preview()
        : switch (game.phase) {
            TurnPhase.ready ||
            TurnPhase.rolling ||
            TurnPhase.moving => _ready(context),
            TurnPhase.learning => _learning(),
            TurnPhase.question => _question(),
            TurnPhase.feedback => _feedback(context),
            TurnPhase.finished => const SizedBox.shrink(),
          },
  );

  Widget _ready(BuildContext context) {
    final busy = !game.canRoll;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _eyebrow(busy ? 'TURNO ${game.turns}' : 'TU SIGUIENTE RETO'),
        const SizedBox(height: 12),
        Text(
          switch (game.phase) {
            TurnPhase.rolling => 'Los dados deciden el destino…',
            TurnPhase.moving =>
              game.answeredCorrectly!
                  ? '¡Vamos a la siguiente oficina!'
                  : 'Retrocedemos para volver a intentar',
            _ => 'Lanza los dados y descubre una oficina',
          },
          style: const TextStyle(
            fontSize: 32,
            height: 1.15,
            fontWeight: FontWeight.w800,
            color: AppColors.ink,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Image.asset(
                'assets/personaje_fiscalia.png',
                width: 170,
                height: 230,
                cacheWidth: 360,
                fit: BoxFit.contain,
                excludeFromSemantics: true,
              ),
              const SizedBox(width: 28),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estás en la casilla ${game.position}',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: AppColors.ink,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      game.currentOffice.name,
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.muted,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        AnimatedRotation(
                          turns: game.turns.toDouble(),
                          duration: MediaQuery.disableAnimationsOf(context)
                              ? Duration.zero
                              : const Duration(milliseconds: 600),
                          curve: Curves.easeOutCubic,
                          child: Die(value: game.die1),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text('+', style: TextStyle(fontSize: 28)),
                        ),
                        AnimatedRotation(
                          turns: -game.turns.toDouble(),
                          duration: MediaQuery.disableAnimationsOf(context)
                              ? Duration.zero
                              : const Duration(milliseconds: 600),
                          curve: Curves.easeOutCubic,
                          child: Die(value: game.die2),
                        ),
                        const SizedBox(width: 18),
                        Text(
                          '= ${game.total}',
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Text(
          'Primero lee y responde. Un acierto te permite avanzar; un error te hace retroceder 2 casillas.',
          style: TextStyle(fontSize: 23, height: 1.35, color: AppColors.muted),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            key: const ValueKey('roll-dice'),
            onPressed: game.canRoll ? game.roll : null,
            icon: Icon(
              busy ? Icons.hourglass_top_rounded : Icons.casino_rounded,
              size: 30,
            ),
            label: Text(busy ? 'Espera un momento…' : 'LANZAR DADOS'),
          ),
        ),
      ],
    );
  }

  Widget _learning() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _eyebrow('01 · CONOCE LA OFICINA'),
      const SizedBox(height: 16),
      _officeTitle(game.targetOffice),
      const SizedBox(height: 18),
      Expanded(
        child: SingleChildScrollView(
          key: ValueKey('learning-${game.destination}'),
          child: Text(
            game.targetOffice.description,
            style: const TextStyle(
              fontSize: 28,
              height: 1.5,
              color: AppColors.ink,
            ),
          ),
        ),
      ),
      const SizedBox(height: 12),
      _notice(
        Icons.casino_outlined,
        'Sacaste ${game.total}. Si aciertas, irás de la casilla ${game.position} a la ${game.destination}.',
      ),
      const SizedBox(height: 18),
      SizedBox(
        width: double.infinity,
        child: FilledButton.icon(
          key: const ValueKey('show-question'),
          onPressed: game.showQuestion,
          icon: const Icon(Icons.quiz_outlined),
          label: const Text('RESPONDER PREGUNTA'),
        ),
      ),
    ],
  );

  Widget _question() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _eyebrow('02 · RESPONDE PARA AVANZAR'),
      const SizedBox(height: 10),
      Text(
        'Casilla ${game.destination} · ${game.targetOffice.name}',
        style: const TextStyle(
          fontSize: 18,
          color: AppColors.muted,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 18),
      Expanded(
        child: SingleChildScrollView(
          key: ValueKey('question-${game.destination}'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                game.activeQuestion!.question.trim(),
                style: const TextStyle(
                  fontSize: 28,
                  height: 1.3,
                  fontWeight: FontWeight.w700,
                  color: AppColors.ink,
                ),
              ),
              const SizedBox(height: 22),
              for (
                var index = 0;
                index < game.activeQuestion!.options.length;
                index++
              )
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      key: ValueKey('answer-$index'),
                      onPressed: () => game.answer(index),
                      style: OutlinedButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        backgroundColor: const Color(0xFFF8FAF6),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 18,
                        ),
                        side: const BorderSide(
                          color: AppColors.line,
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        game.activeQuestion!.options[index],
                        style: const TextStyle(
                          fontSize: 23,
                          height: 1.25,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 10),
      const Text(
        'Elige una respuesta. Cada turno es una oportunidad de aprender.',
        style: TextStyle(fontSize: 17, color: AppColors.muted),
      ),
    ],
  );

  Widget _feedback(BuildContext context) {
    final correct = game.answeredCorrectly!;
    final delta = game.movement;
    final message = correct ? '¡Respuesta correcta!' : '¡Sigue intentando!';
    final movement = correct
        ? 'Avanzas $delta ${delta == 1 ? 'casilla' : 'casillas'}'
        : delta == 0
        ? 'Te quedas en la casilla de inicio'
        : 'Retrocedes ${-delta} ${delta == -1 ? 'casilla' : 'casillas'}';
    return Semantics(
      liveRegion: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _eyebrow('03 · DESCUBRE Y CONTINÚA'),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(
                correct ? Icons.check_circle_rounded : Icons.lightbulb_rounded,
                size: 54,
                color: correct ? AppColors.green : AppColors.error,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: AppColors.ink,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    correct ? 'Lo has aprendido:' : 'La respuesta correcta es:',
                    style: const TextStyle(
                      fontSize: 22,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    game.activeQuestion!.correctAnswer,
                    style: const TextStyle(
                      fontSize: 27,
                      height: 1.4,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    game.targetOffice.description,
                    style: const TextStyle(
                      fontSize: 21,
                      height: 1.4,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          _notice(correct ? Icons.trending_up : Icons.trending_down, movement),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              key: const ValueKey('continue-turn'),
              onPressed: () => game.continueTurn(
                animate: !MediaQuery.disableAnimationsOf(context),
              ),
              icon: const Icon(Icons.arrow_forward),
              label: Text(
                correct && game.destination == 27
                    ? 'LLEGAR A LA META'
                    : 'CONTINUAR RECORRIDO',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _preview() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _eyebrow('EXPLORA · TU POSICIÓN NO CAMBIA'),
      const SizedBox(height: 18),
      _officeTitle(preview!),
      const SizedBox(height: 22),
      Expanded(
        child: SingleChildScrollView(
          key: ValueKey('preview-${preview!.id}'),
          child: Text(
            preview!.description,
            style: const TextStyle(
              fontSize: 28,
              height: 1.5,
              color: AppColors.ink,
            ),
          ),
        ),
      ),
      const SizedBox(height: 18),
      SizedBox(
        width: double.infinity,
        child: FilledButton.icon(
          key: const ValueKey('close-preview'),
          onPressed: onClosePreview,
          icon: const Icon(Icons.casino_outlined),
          label: const Text('VOLVER A LOS DADOS'),
        ),
      ),
    ],
  );

  Widget _officeTitle(Office office) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 62,
        height: 62,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.forest,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          '${office.id}'.padLeft(2, '0'),
          style: const TextStyle(
            fontSize: 28,
            color: AppColors.gold,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      const SizedBox(width: 18),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${office.floor}° PISO',
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.muted,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              office.name,
              style: const TextStyle(
                fontSize: 27,
                height: 1.15,
                fontWeight: FontWeight.w800,
                color: AppColors.ink,
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _eyebrow(String text) => Text(
    text,
    style: const TextStyle(
      fontSize: 16,
      letterSpacing: 1.4,
      fontWeight: FontWeight.w700,
      color: AppColors.green,
    ),
  );

  Widget _notice(IconData icon, String text) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFF0F4EB),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      children: [
        Icon(icon, size: 28, color: AppColors.green),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
        ),
      ],
    ),
  );
}
