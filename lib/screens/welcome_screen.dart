import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/brand_header.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.onStart});
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: AppColors.cream,
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(36, 32, 36, 26),
          child: BrandHeader(),
        ),
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/potosi_panorama_v2.png',
                fit: BoxFit.cover,
                cacheWidth: 1536,
                excludeFromSemantics: true,
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x10123D35),
                      Color(0x10123D35),
                      Color(0xFF123D35),
                    ],
                    stops: [0, .4, 1],
                  ),
                ),
              ),
              Positioned(
                left: 44,
                right: 44,
                bottom: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.gold,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'POTOSÍ · CONOCE NUESTRAS UNIDADES',
                        style: TextStyle(
                          color: AppColors.forest,
                          fontSize: 16,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Text(
                      'Recorre\ntu Fiscalía',
                      style: TextStyle(
                        fontSize: 86,
                        height: 1.02,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -3,
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Explora, responde y avanza.',
                      style: TextStyle(color: Color(0xFFE5EBDF), fontSize: 30),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 32, 40, 30),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/personaje_fiscalia.png',
                    width: 128,
                    height: 160,
                    cacheWidth: 280,
                    fit: BoxFit.contain,
                    excludeFromSemantics: true,
                  ),
                  const SizedBox(width: 26),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tu meta: llegar al auditorio',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: AppColors.forest,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Descubre el trabajo de nuestras oficinas en un recorrido por los cinco pisos.',
                          style: TextStyle(
                            fontSize: 24,
                            height: 1.4,
                            color: AppColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _Rule(
                      number: '01',
                      title: 'Lanza los dados',
                      text: 'Descubre la oficina de tu próximo reto.',
                    ),
                  ),
                  SizedBox(width: 18),
                  Expanded(
                    child: _Rule(
                      number: '02',
                      title: 'Lee y responde',
                      text:
                          'Si aciertas, avanzas. Si fallas, retrocedes 2 casillas.',
                    ),
                  ),
                  SizedBox(width: 18),
                  Expanded(
                    child: _Rule(
                      number: '03',
                      title: 'Alcanza la meta',
                      text:
                          'Responde el último reto para completar el recorrido.',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  key: const ValueKey('start-game'),
                  onPressed: onStart,
                  icon: const Icon(Icons.arrow_forward_rounded, size: 30),
                  label: const Text('COMENZAR RECORRIDO'),
                  style: FilledButton.styleFrom(minimumSize: const Size(0, 88)),
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'TRANSPARENCIA  ·  SERVICIO  ·  COMPROMISO',
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 2,
                  color: AppColors.muted,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _Rule extends StatelessWidget {
  const _Rule({required this.number, required this.title, required this.text});
  final String number;
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        number,
        style: const TextStyle(
          color: AppColors.green,
          fontSize: 17,
          fontWeight: FontWeight.w800,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        title,
        style: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          height: 1.35,
          color: AppColors.muted,
        ),
      ),
    ],
  );
}
