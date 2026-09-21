import 'dart:async';
import 'package:flutter/material.dart';
import 'screens/game_screen.dart';
import 'screens/welcome_screen.dart';
import 'theme/app_theme.dart';
import 'widgets/kiosk_frame.dart';

class FiscaliaApp extends StatelessWidget {
  const FiscaliaApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Recorre tu Fiscalía',
    theme: buildAppTheme(),
    home: const _KioskSession(),
  );
}

class _KioskSession extends StatefulWidget {
  const _KioskSession();
  @override
  State<_KioskSession> createState() => _KioskSessionState();
}

class _KioskSessionState extends State<_KioskSession>
    with WidgetsBindingObserver {
  static const idleTimeout = Duration(minutes: 3);
  bool playing = false;
  Timer? warningTimer;
  Timer? expirationTimer;
  Timer? countdownTimer;
  int? countdown;
  DateTime lastInteraction = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  void _cancelTimers() {
    warningTimer?.cancel();
    expirationTimer?.cancel();
    countdownTimer?.cancel();
  }

  void _touch() {
    if (!playing) return;
    lastInteraction = DateTime.now();
    _cancelTimers();
    if (countdown != null) setState(() => countdown = null);
    warningTimer = Timer(idleTimeout - const Duration(seconds: 30), () {
      if (!mounted) return;
      setState(() => countdown = 30);
      countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (mounted && countdown != null && countdown! > 0) {
          setState(() => countdown = countdown! - 1);
        }
      });
    });
    expirationTimer = Timer(idleTimeout, _home);
  }

  void _home() {
    _cancelTimers();
    if (!mounted) return;
    setState(() {
      playing = false;
      countdown = null;
    });
  }

  void _start() {
    setState(() => playing = true);
    _touch();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed &&
        playing &&
        DateTime.now().difference(lastInteraction) >= idleTimeout) {
      _home();
    }
  }

  @override
  void dispose() {
    _cancelTimers();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: false,
    child: Scaffold(
      body: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: (_) => _touch(),
        child: KioskFrame(
          child: Stack(
            children: [
              Positioned.fill(
                child: playing
                    ? GameScreen(onHome: _home)
                    : WelcomeScreen(onStart: _start),
              ),
              if (countdown != null)
                Positioned(
                  left: 40,
                  right: 40,
                  top: 125,
                  child: Material(
                    color: AppColors.gold,
                    elevation: 8,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.timer_outlined,
                            size: 34,
                            color: AppColors.forest,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'Volveremos al inicio en $countdown s.\nToca la pantalla para seguir jugando.',
                              style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: AppColors.forest,
                              ),
                            ),
                          ),
                          FilledButton(
                            onPressed: _touch,
                            child: const Text('Seguir'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
