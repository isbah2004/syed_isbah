import 'package:flutter/material.dart';
import 'package:my_portfolio/intro/desktop_intro.dart';
import 'package:my_portfolio/intro/large_tablet_intro.dart';
import 'package:my_portfolio/intro/mobile_intro.dart';
import 'package:my_portfolio/intro/small_tablet_intro.dart';
import 'package:my_portfolio/reusablewidgets/layout_helper.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutHelper(
      mobileBody: MobileIntro(),
      largeTabletBody: LargeTabletIntro(),
      desktopBody: DesktopIntro(),
      smallTabletBody: SmallTabletIntro(),
    );
  }
}
