import 'package:flutter/material.dart';
import 'package:my_portfolio/reusablewidgets/layout_helper.dart';
import 'package:my_portfolio/skills/desktop_skills.dart';
import 'package:my_portfolio/skills/large_tablet_skills.dart';
import 'package:my_portfolio/skills/mobile_skills.dart';
import 'package:my_portfolio/skills/small_tablet_skills.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutHelper(
        mobileBody: MobileSkills(),
        largeTabletBody: LargeTabletSkill(),
        desktopBody: DesktopSkills(),
        smallTabletBody: SmallTabletSkill());
  }
}
