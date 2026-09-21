import 'package:flutter/material.dart';
import '../game/game_controller.dart';
import '../models/office.dart';
import '../theme/app_theme.dart';
import '../widgets/brand_header.dart';
import '../widgets/office_board.dart';
import '../widgets/turn_panel.dart';
import 'finish_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.onHome, this.controller});
  final VoidCallback onHome;
  final GameController? controller;
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final GameController game = widget.controller ?? GameController();
  Office? preview;
  bool confirmExit = false;

  @override
  void dispose() {
    if (widget.controller == null) game.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: game,
    builder: (context, _) {
      if (game.phase == TurnPhase.finished) {
        return FinishScreen(game: game, onHome: widget.onHome);
      }
      return Stack(
        children: [
          ColoredBox(
            color: AppColors.cream,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 26, 28, 18),
              child: Column(
                children: [
                  BrandHeader(
                    trailing: OutlinedButton.icon(
                      key: const ValueKey('exit-game'),
                      onPressed: () => setState(() => confirmExit = true),
                      icon: const Icon(Icons.home_outlined),
                      label: const Text('Inicio'),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recorre tu Fiscalía',
                              style: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w800,
                                color: AppColors.ink,
                                letterSpacing: -1,
                              ),
                            ),
                            Text(
                              'Conoce nuestras unidades, responde y avanza.',
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.muted,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.line),
                        ),
                        child: Text(
                          '${game.position} / 27',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: AppColors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Expanded(
                    child: OfficeBoard(
                      position: game.position,
                      visited: game.learnedOffices,
                      destination: switch (game.phase) {
                        TurnPhase.learning ||
                        TurnPhase.question ||
                        TurnPhase.feedback => game.destination,
                        _ => null,
                      },
                      onOfficeTap: game.canRoll
                          ? (office) => setState(() => preview = office)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 590,
                    child: TurnPanel(
                      game: game,
                      preview: preview,
                      onClosePreview: () => setState(() => preview = null),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TURNO ${game.turns}  ·  ${game.correctAnswers} ACIERTOS',
                        style: const TextStyle(
                          fontSize: 14,
                          letterSpacing: 1,
                          color: AppColors.muted,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'LA META ESTÁ EN EL AUDITORIO · CASILLA 27',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 13,
                            letterSpacing: .6,
                            color: AppColors.muted,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (confirmExit)
            Positioned.fill(
              child: ColoredBox(
                color: const Color(0xAA123D35),
                child: Center(
                  child: Container(
                    width: 710,
                    padding: const EdgeInsets.all(36),
                    decoration: BoxDecoration(
                      color: AppColors.cream,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.home_outlined,
                          size: 50,
                          color: AppColors.green,
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          '¿Volver al inicio?',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'El recorrido actual se reiniciará para el siguiente visitante.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 28),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () =>
                                    setState(() => confirmExit = false),
                                child: const Text('Seguir jugando'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: FilledButton(
                                key: const ValueKey('confirm-exit'),
                                onPressed: widget.onHome,
                                child: const Text('Volver al inicio'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
    },
  );
}
