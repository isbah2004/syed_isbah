import 'package:flutter/material.dart';
import 'package:my_portfolio/about/desktop_about.dart';
import 'package:my_portfolio/about/large_tablet_about.dart';
import 'package:my_portfolio/about/mobile_about.dart';
import 'package:my_portfolio/about/small_tablet_about.dart';
import 'package:my_portfolio/reusablewidgets/layout_helper.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutHelper(
      mobileBody: MobileAbout(),
      largeTabletBody: LargeTabletAbout(),
      desktopBody: DesktopAbout(),
      smallTabletBody: SmallTabletAbout(),
    );
  }
}
