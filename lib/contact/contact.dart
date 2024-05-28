import 'package:flutter/material.dart';
import 'package:my_portfolio/contact/desktop_contact.dart';
import 'package:my_portfolio/contact/large_tablet_contact.dart';
import 'package:my_portfolio/contact/mobile_contact.dart';
import 'package:my_portfolio/contact/small_tablet_contact.dart';
import 'package:my_portfolio/reusablewidgets/layout_helper.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutHelper(
      mobileBody: MobileContact(),
      largeTabletBody: LargeTabletContact(),
      desktopBody: DesktopContact(),
      smallTabletBody: SmallTabletContact(),
    );
  }
}
