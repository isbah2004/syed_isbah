import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/neumorphism_button.dart';
import 'package:my_portfolio/reusablewidgets/profile_picture.dart';
import 'package:my_portfolio/reusablewidgets/resume_button.dart';
import 'package:my_portfolio/theme/theme_data.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:provider/provider.dart';

class MobileIntro extends StatelessWidget {
  const MobileIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(Constants.introTitle, style: AppTheme.font25Bold),
            Text(
              Constants.introSubtitle,
              style: AppTheme.font15,
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
            const SizedBox(height: 20),
            Consumer<ResumeProvider>(
              builder: (context, value, child) {
                return ResumeButton(
                  height: 30,
                  width: 100,
                  textStyle: AppTheme.font15,
                );
              },
            ),
            const SizedBox(height: 30),
            const Center(child: ProfileImage(size: 380)),
          ],
        ),
      ),
    );
  }
}
