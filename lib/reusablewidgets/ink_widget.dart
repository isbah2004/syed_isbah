import 'package:flutter/material.dart';
import 'package:my_portfolio/theme/theme_data.dart';

class InkWidget extends StatelessWidget {
  final String? asset, message;
  final double size;
  final VoidCallback onTap;

  const InkWidget(
      {super.key,
      required this.asset,
      required this.size,
      required this.onTap,
       this.message});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message??'',
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          asset??'',
          color: AppTheme.secondaryColor,
          fit: BoxFit.fill,
          height: size,
          width: size,
        ),
      ),
    );
  }
}
