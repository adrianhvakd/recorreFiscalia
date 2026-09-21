import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Vector pips stay sharp at 4K without decoding six separate bitmaps.
class Die extends StatelessWidget {
  const Die({super.key, required this.value, this.size = 78});
  final int value;
  final double size;

  @override
  Widget build(BuildContext context) => Semantics(
    label: 'Dado: $value',
    child: Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.line, width: 2),
      ),
      child: CustomPaint(painter: _Pips(value)),
    ),
  );
}

class _Pips extends CustomPainter {
  _Pips(this.value);
  final int value;
  static const points = <int, List<Offset>>{
    1: [Offset(.5, .5)],
    2: [Offset(.28, .28), Offset(.72, .72)],
    3: [Offset(.28, .28), Offset(.5, .5), Offset(.72, .72)],
    4: [Offset(.28, .28), Offset(.72, .28), Offset(.28, .72), Offset(.72, .72)],
    5: [
      Offset(.28, .28),
      Offset(.72, .28),
      Offset(.5, .5),
      Offset(.28, .72),
      Offset(.72, .72),
    ],
    6: [
      Offset(.28, .25),
      Offset(.72, .25),
      Offset(.28, .5),
      Offset(.72, .5),
      Offset(.28, .75),
      Offset(.72, .75),
    ],
  };
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.forest;
    for (final point in points[value]!) {
      canvas.drawCircle(
        Offset(point.dx * size.width, point.dy * size.height),
        size.width * .07,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_Pips oldDelegate) => value != oldDelegate.value;
}
