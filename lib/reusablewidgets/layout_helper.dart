import 'package:flutter/material.dart';

class LayoutHelper extends StatelessWidget {
  final dynamic mobileBody;
  final dynamic largeTabletBody;
  final dynamic desktopBody;
  final dynamic smallTabletBody;

  const LayoutHelper({
    super.key,
    required this.mobileBody,
    required this.largeTabletBody,
    required this.desktopBody,
    required this.smallTabletBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileBody;
        } else if (constraints.maxWidth < 800) {
          return smallTabletBody;
        } else if (constraints.maxWidth < 1100) {
          return largeTabletBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
