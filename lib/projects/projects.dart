import 'package:flutter/material.dart';
import 'package:my_portfolio/projects/desktop_projects.dart';
import 'package:my_portfolio/projects/large_tablet_projects.dart';
import 'package:my_portfolio/projects/mobile_tablet_projects.dart';
import 'package:my_portfolio/projects/small_tablet_projects.dart';
import 'package:my_portfolio/reusablewidgets/layout_helper.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutHelper(
      mobileBody: MobileProjects(),
      largeTabletBody: LargeTabletProjects(),
      desktopBody: DesktopProjects(),
      smallTabletBody: SmallTabletProjects(),
    );
  }
}
