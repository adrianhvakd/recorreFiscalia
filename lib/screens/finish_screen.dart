import 'package:flutter/material.dart';
import '../game/game_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/brand_header.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key, required this.game, required this.onHome});
  final GameController game;
  final VoidCallback onHome;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: AppColors.cream,
    child: Padding(
      padding: const EdgeInsets.all(36),
      child: Column(
        children: [
          const BrandHeader(),
          const SizedBox(height: 36),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(36),
              decoration: BoxDecoration(
                color: AppColors.forest,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.emoji_events_rounded,
                    color: AppColors.gold,
                    size: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '¡Felicidades!',
                    style: TextStyle(
                      fontSize: 66,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Has completado el recorrido por la\nFiscalía Departamental de Potosí.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      height: 1.4,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        'assets/personaje_fiscalia.png',
                        fit: BoxFit.contain,
                        cacheWidth: 540,
                        excludeFromSemantics: true,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _Stat(
                          value: '${game.turns}',
                          label: 'turnos jugados',
                        ),
                      ),
                      Expanded(
                        child: _Stat(
                          value: '${game.correctAnswers}',
                          label: 'respuestas correctas',
                        ),
                      ),
                      Expanded(
                        child: _Stat(
                          value: '${game.learnedOffices.length}',
                          label: 'oficinas descubiertas',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 26),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFFAEDD0),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.card_giftcard, size: 42, color: AppColors.forest),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Un regalo especial para ti',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: AppColors.ink,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Al llegar hasta el final, eres merecedor de un regalo especial, preparado con mucho cariño por parte de la Fiscalía Departamental de Potosí.',
                        style: TextStyle(
                          fontSize: 23,
                          height: 1.35,
                          color: AppColors.ink,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Consulta en el punto de atención de la Fiscalía.',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '¡Gracias por participar y conocer nuestra institución!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26, color: AppColors.ink),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              key: const ValueKey('new-game'),
              onPressed: onHome,
              icon: const Icon(Icons.replay_rounded),
              label: const Text('NUEVO RECORRIDO'),
              style: FilledButton.styleFrom(minimumSize: const Size(0, 84)),
            ),
          ),
        ],
      ),
    ),
  );
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});
  final String value;
  final String label;
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(
        value,
        style: const TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.w800,
          color: AppColors.gold,
        ),
      ),
      Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    ],
  );
}
