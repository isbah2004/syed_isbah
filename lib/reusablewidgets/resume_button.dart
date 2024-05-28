import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/neumorphism_button.dart';
import 'package:my_portfolio/theme/theme_data.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart'as launcher;

class ResumeButton extends StatelessWidget {
  final double height, width;
  final TextStyle textStyle;
  const ResumeButton({
    super.key,
    required this.height,
    required this.width,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ResumeProvider>(
      builder: (context, value, child) {
        return MouseRegion(
          onEnter: (_) {
            value.setPressed(true);
          },
          onExit: (_) {
            value.setPressed(false);
          },
          child: GestureDetector(
            onTap: () {launcher.launchUrl(Uri.parse(Constants.resumeLink));},
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: value.isPressed
                    ? [
                        const BoxShadow(
                          color: AppTheme.upperNeumorphismShade,
                          offset: Offset(-10.0, -10.0),
                          blurRadius: 30,
                          spreadRadius: 10,
                        ),
                        const BoxShadow(
                          color: AppTheme.lowerNeumorphismShade,
                          offset: Offset(10.0, 10.0),
                          blurRadius: 30,
                          spreadRadius: 10,
                        ),
                      ]
                    : [
                        const BoxShadow(
                          color: AppTheme.upperNeumorphismShade,
                          offset: Offset(-0.1, -0.1),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                        const BoxShadow(
                          color: AppTheme.lowerNeumorphismShade,
                          offset: Offset(0.1, 0.1),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
              ),
              child: Center(child: Text(Constants.resume, style: textStyle)),
            ),
          ),
        );
      },
    );
  }
}
