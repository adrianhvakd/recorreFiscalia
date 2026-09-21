import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Uses the whole available width and gives the screens the actual aspect ratio.
/// Taller portrait displays grow the flexible content instead of adding bands.
/// Short displays scroll rather than clipping controls or stretching the artwork.
class KioskFrame extends StatelessWidget {
  const KioskFrame({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: AppColors.cream,
    child: SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          const logicalWidth = 900.0;
          const minimumHeight = 1600.0;
          final scale = constraints.maxWidth / logicalWidth;
          final logicalHeight = math.max(
            minimumHeight,
            constraints.maxHeight / scale,
          );
          return SingleChildScrollView(
            child: SizedBox(
              width: constraints.maxWidth,
              height: logicalHeight * scale,
              child: FittedBox(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: logicalWidth,
                  height: logicalHeight,
                  child: child,
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
