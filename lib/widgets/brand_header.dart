import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key, this.trailing, this.light = false});
  final Widget? trailing;
  final bool light;

  @override
  Widget build(BuildContext context) {
    final color = light ? Colors.white : AppColors.forest;
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.account_balance_rounded,
            color: AppColors.forest,
            size: 30,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MINISTERIO PÚBLICO',
                style: TextStyle(fontSize: 14, letterSpacing: 2, color: color),
              ),
              Text(
                'Fiscalía Departamental de Potosí',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ],
          ),
        ),
        ?trailing,
      ],
    );
  }
}
