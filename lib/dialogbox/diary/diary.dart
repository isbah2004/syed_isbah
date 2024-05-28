import 'package:flutter/material.dart';
import 'package:my_portfolio/dialogbox/diary/desktop_diary.dart';
import 'package:my_portfolio/dialogbox/diary/large_tablet_diary.dart';
import 'package:my_portfolio/dialogbox/diary/mobile_diary.dart';
import 'package:my_portfolio/dialogbox/diary/small_tablet_diary.dart';
import 'package:my_portfolio/reusablewidgets/layout_helper.dart';

void showDiaryDialogBox(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return LayoutHelper(
        mobileBody: showMobileDiaryDialogBox(context),
        largeTabletBody: showLargeTabletDiaryDialogBox(context),
        desktopBody: showDesktopDiaryDialogBox(context),
        smallTabletBody: showSmallTabletDiaryDialogBox(context),
      );
    },
  );
}
