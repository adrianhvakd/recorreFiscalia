import 'package:flutter/material.dart';
import '../data/offices.dart';
import '../models/office.dart';
import '../theme/app_theme.dart';

class OfficeBoard extends StatelessWidget {
  const OfficeBoard({
    super.key,
    required this.position,
    required this.visited,
    this.destination,
    this.onOfficeTap,
  });
  final int position;
  final int? destination;
  final Set<int> visited;
  final ValueChanged<Office>? onOfficeTap;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(26),
    child: ColoredBox(
      color: AppColors.forest,
      child: Column(
        children: [
          SizedBox(
            height: 126,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/potosi_panorama_v2.png',
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -.35),
                  cacheWidth: 1536,
                  excludeFromSemantics: true,
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xEF123D35), Color(0x60123D35)],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'UN RECORRIDO POR NUESTRA INSTITUCIÓN',
                              style: TextStyle(
                                color: AppColors.gold,
                                fontSize: 13,
                                letterSpacing: 1.6,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Aprende y avanza hasta la meta',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.flag_rounded,
                        color: AppColors.gold,
                        size: 46,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          for (final floor in [5, 4, 3, 2, 1])
            Expanded(
              child: _FloorRow(
                floor: floor,
                position: position,
                destination: destination,
                visited: visited,
                onOfficeTap: onOfficeTap,
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
            child: Row(
              children: [
                const Icon(
                  Icons.person_pin_circle,
                  color: AppColors.gold,
                  size: 20,
                ),
                const SizedBox(width: 6),
                const Text(
                  'Tu posición',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(width: 22),
                const Icon(
                  Icons.check_circle_outline,
                  color: Color(0xFFADD6C2),
                  size: 18,
                ),
                const SizedBox(width: 6),
                const Text(
                  'Oficina conocida',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    onOfficeTap != null
                        ? 'Toca una oficina para conocerla'
                        : 'Resuelve el reto para avanzar',
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      color: Color(0xFFD1E2D9),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class _FloorRow extends StatelessWidget {
  const _FloorRow({
    required this.floor,
    required this.position,
    required this.destination,
    required this.visited,
    required this.onOfficeTap,
  });
  final int floor;
  final int position;
  final int? destination;
  final Set<int> visited;
  final ValueChanged<Office>? onOfficeTap;

  @override
  Widget build(BuildContext context) {
    final floorOffices = offices
        .where((office) => office.floor == floor)
        .toList();
    // Preserve the original ascending, serpentine route through each floor.
    final ordered = floor.isEven
        ? floorOffices.reversed.toList()
        : floorOffices;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: floor.isEven ? const Color(0xFF1D493F) : AppColors.forest,
        border: const Border(top: BorderSide(color: Color(0xFF356052))),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          children: [
            SizedBox(
              width: 68,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '0$floor',
                    style: const TextStyle(
                      fontSize: 32,
                      color: AppColors.gold,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    'PISO',
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            for (final office in ordered)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: _OfficeTile(
                    office: office,
                    current: office.id == position,
                    target: office.id == destination,
                    known: visited.contains(office.id),
                    onTap: onOfficeTap == null
                        ? null
                        : () => onOfficeTap!(office),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _OfficeTile extends StatelessWidget {
  const _OfficeTile({
    required this.office,
    required this.current,
    required this.target,
    required this.known,
    this.onTap,
  });
  final Office office;
  final bool current;
  final bool target;
  final bool known;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = current ? AppColors.forest : Colors.white;
    return Semantics(
      label:
          'Casilla ${office.id}, ${office.name}${current ? ', tu posición' : ''}',
      button: onTap != null,
      child: Material(
        color: current
            ? AppColors.gold
            : target
            ? const Color(0xFF396B56)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          key: ValueKey('office-${office.id}'),
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: target ? AppColors.gold : const Color(0xFF547266),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (current)
                      Icon(Icons.person_pin_circle, color: color, size: 19),
                    Text(
                      '${office.id}'.padLeft(2, '0'),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: color,
                      ),
                    ),
                    if (known && !current)
                      const Padding(
                        padding: EdgeInsets.only(left: 2),
                        child: Icon(
                          Icons.check_circle,
                          size: 12,
                          color: Color(0xFFADD6C2),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Flexible(
                  child: Text(
                    office.shortName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.12,
                      fontWeight: FontWeight.w600,
                      color: color,
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
}
