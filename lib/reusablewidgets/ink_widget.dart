import 'package:flutter/material.dart';
import 'package:my_portfolio/theme/theme_data.dart';

class InkWidget extends StatelessWidget {
  final String asset;
  final double size;
  final VoidCallback onTap;
  const InkWidget(
      {super.key,
      required this.asset,
      required this.size,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        asset,
        color: AppTheme.secondaryColor,
        fit: BoxFit.fill,
        height: size,
        width: size,
      ),
    );
  }
}
