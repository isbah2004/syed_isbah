import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/neumorphism_button.dart';
import 'package:my_portfolio/reusablewidgets/profile_picture.dart';
import 'package:my_portfolio/reusablewidgets/resume_button.dart';
import 'package:my_portfolio/theme/theme_data.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:provider/provider.dart';

class LargeTabletIntro extends StatelessWidget {
  const LargeTabletIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 30),
      child: SizedBox(
        height: 600,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Constants.introTitle, style: AppTheme.font35Bold),
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6),
                    child: Text(
                      Constants.introSubtitle,
                      style: AppTheme.font25Bold,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Consumer<ResumeProvider>(builder: (context, value, child) {
                  return ResumeButton(
                    height: 40,
                    width: 140,
                    textStyle: AppTheme.font25,
                  );
                })
              ],
            ),
            const ProfileImage(size: 380),
          ],
        ),
      ),
    );
  }
}
